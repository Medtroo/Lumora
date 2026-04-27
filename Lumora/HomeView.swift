//
//  HomeView.swift
//  Lumora
//
//  Created by Nika Metreveli on 3/24/26.
//

import Foundation
import SwiftUI

struct HomeView: View {
    let movies: [Movie]
    @Binding var watchlist: [Movie]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.lumoraBackground
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Lumora")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(Color.lumoraText)

                        Text("Find movies, TV series, and animated shows")
                            .font(.subheadline)
                            .foregroundStyle(Color.lumoraSecondaryText)

                        Text("Trending Now")
                            .font(.headline)
                            .foregroundStyle(Color.lumoraText)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 14) {
                                ForEach(movies.prefix(4)) { movie in
                                    NavigationLink {
                                        MovieDetailView(movie: movie, watchlist: $watchlist)
                                    } label: {
                                        MovieCardView(movie: movie)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }

                        Text("Popular Picks")
                            .font(.headline)
                            .foregroundStyle(Color.lumoraText)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 14) {
                                ForEach(movies.dropFirst(2).prefix(4)) { movie in
                                    NavigationLink {
                                        MovieDetailView(movie: movie, watchlist: $watchlist)
                                    } label: {
                                        MovieCardView(movie: movie)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(Constants.homeTitle)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}
