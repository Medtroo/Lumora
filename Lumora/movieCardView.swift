//
//  movieCardView.swift
//  Lumora
//
//  Created by Nika Metreveli on 4/26/26.
//

import Foundation
import SwiftUI

struct MovieCardView: View {
    let movie: Movie

    var body: some View {
        RoundedRectangle(cornerRadius: 18)
            .fill(Color.lumoraCard)
            .frame(width: 160, height: 230)
            .overlay {
                VStack(alignment: .leading, spacing: 10) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.lumoraAccent)
                        .frame(height: 120)
                        .overlay {
                            Text(movie.title)
                                .font(.headline)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color.lumoraText)
                                .padding(.horizontal, 8)
                        }

                    Text(movie.title)
                        .font(.headline)
                        .foregroundStyle(Color.lumoraText)
                        .lineLimit(2)

                    Text("\(movie.type) • \(movie.year)")
                        .font(.caption)
                        .foregroundStyle(Color.lumoraSecondaryText)

                    Text("⭐ \(movie.rating)")
                        .font(.caption)
                        .foregroundStyle(Color.lumoraSecondaryText)

                    Spacer()
                }
                .padding()
            }
    }
}
