//
//  DownloadsView.swift
//  Lumora
//
//  Created by Nika Metreveli on 4/26/26.
//

import Foundation
import SwiftUI

struct DownloadsView: View {
    let movies: [Movie]
    @Binding var watchlist: [Movie]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.lumoraBackground
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(Constants.downloadsTitle)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(Color.lumoraText)

                        Text("Available offline titles")
                            .font(.subheadline)
                            .foregroundStyle(Color.lumoraSecondaryText)

                        ForEach(movies.suffix(3)) { movie in
                            NavigationLink {
                                MovieDetailView(movie: movie, watchlist: $watchlist)
                            } label: {
                                MovieRowView(movie: movie)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(Constants.downloadsTitle)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}
