//
//  MovieDetailView.swift
//  Lumora
//
//  Created by Nika Metreveli on 3/24/26.
//

import Foundation
import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @Binding var watchlist: [Movie]

    var isSaved: Bool {
        watchlist.contains(movie)
    }

    var body: some View {
        ZStack {
            Color.lumoraBackground
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.lumoraCard)
                        .frame(height: 220)
                        .overlay {
                            Text(movie.title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.lumoraText)
                        }

                    Text(movie.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.lumoraText)

                    Text("\(movie.type) • \(movie.year) • ⭐ \(movie.rating)")
                        .font(.subheadline)
                        .foregroundStyle(Color.lumoraSecondaryText)

                    Button {
                        if isSaved {
                            watchlist.removeAll { $0 == movie }
                        } else {
                            watchlist.append(movie)
                        }
                    } label: {
                        Text(isSaved ? "Remove from Watchlist" : "Add to Watchlist")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.lumoraAccent)
                            .foregroundStyle(Color.lumoraText)
                            .cornerRadius(12)
                    }

                    Text("Overview")
                        .font(.headline)
                        .foregroundStyle(Color.lumoraText)

                    Text(movie.overview)
                        .foregroundStyle(Color.lumoraSecondaryText)
                }
                .padding()
            }
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}
