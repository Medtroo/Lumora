//
//  MovieRowView.swift
//  Lumora
//
//  Created by Nika Metreveli on 4/26/26.
//

import Foundation
import SwiftUI

struct MovieRowView: View {
    let movie: Movie

    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.lumoraCard)
            .frame(height: 70)
            .overlay(alignment: .leading) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(movie.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.lumoraText)

                    Text("\(movie.type) • \(movie.year) • ⭐ \(movie.rating)")
                        .font(.caption)
                        .foregroundStyle(Color.lumoraSecondaryText)
                }
                .padding(.horizontal)
            }
    }
}
