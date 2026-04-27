//
//  ContentView.swift
//  Lumora
//
//  Created by Nika Metreveli on 3/23/26.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var watchlist: [Movie] = []

    let movies = SampleMovies.movies

    var body: some View {
        TabView {
            HomeView(movies: movies, watchlist: $watchlist)
                .tabItem {
                    Label(Constants.homeTitle, systemImage: Constants.homeIcon)
                }

            SearchView(movies: movies, searchText: $searchText, watchlist: $watchlist)
                .tabItem {
                    Label(Constants.searchTitle, systemImage: Constants.searchIcon)
                }

            WatchlistView(watchlist: $watchlist)
                .tabItem {
                    Label(Constants.watchlistTitle, systemImage: Constants.watchlistIcon)
                }

            DownloadsView(movies: movies, watchlist: $watchlist)
                .tabItem {
                    Label(Constants.downloadsTitle, systemImage: Constants.downloadsIcon)
                }
        }
        .tint(Color.lumoraAccent)
    }
}

#Preview {
    ContentView()
}
