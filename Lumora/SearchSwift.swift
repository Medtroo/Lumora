//
//  SearchSwift.swift
//  Lumora
//
//  Created by Nika Metreveli on 4/26/26.
//

import Foundation
import SwiftUI

struct SearchView: View {
    let movies: [Movie]
    @Binding var searchText: String
    @Binding var watchlist: [Movie]

    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return []
        } else {
            return movies.filter { movie in
                movie.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.lumoraBackground
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(Constants.searchTitle)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(Color.lumoraText)

                        Text("Find movies, TV series, and animated shows")
                            .font(.subheadline)
                            .foregroundStyle(Color.lumoraSecondaryText)

                        TextField(
                            "",
                            text: $searchText,
                            prompt: Text("Search movies or shows...")
                                .foregroundStyle(Color.lumoraSecondaryText.opacity(0.8))
                        )
                        .padding()
                        .background(Color.lumoraCard)
                        .foregroundStyle(Color.lumoraText)
                        .cornerRadius(12)

                        if searchText.isEmpty {
                            Text("Start typing to search for a movie or show")
                                .font(.subheadline)
                                .foregroundStyle(Color.lumoraSecondaryText)
                        } else if filteredMovies.isEmpty {
                            Text("No results found")
                                .font(.subheadline)
                                .foregroundStyle(Color.lumoraSecondaryText)
                        } else {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Results")
                                    .font(.headline)
                                    .foregroundStyle(Color.lumoraText)

                                ForEach(filteredMovies) { movie in
                                    NavigationLink {
                                        MovieDetailView(movie: movie, watchlist: $watchlist)
                                    } label: {
                                        MovieRowView(movie: movie)
                                    }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(Constants.searchTitle)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }

