//
//  WatchlistView.swift
//  Lumora
//
//  Created by Nika Metreveli on 4/26/26.
//

import Foundation
import SwiftUI

struct WatchlistView: View {
    @Binding var watchlist: [Movie]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.lumoraBackground
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(Constants.watchlistTitle)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(Color.lumoraText)

                        if watchlist.isEmpty {
                            VStack(spacing: 12) {
                                Image(systemName: "bookmark")
                                    .font(.system(size: 36))
                                    .foregroundStyle(Color.lumoraAccent)

                                Text("No movies saved yet")
                                    .font(.headline)
                                    .foregroundStyle(Color.lumoraText)

                                Text("Add titles from the detail screen to build your watchlist.")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(Color.lumoraSecondaryText)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.lumoraCard)
                            .cornerRadius(16)
                        } else {
                            ForEach(watchlist) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie, watchlist: $watchlist)
                                } label: {
                                    MovieRowView(movie: movie)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(Constants.watchlistTitle)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}
