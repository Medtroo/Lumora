//
//  Movie.swift
//  Lumora
//
//  Created by Nika Metreveli on 4/23/26.
//

import Foundation

struct Movie: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let type: String
    let year: String
    let rating: String
    let overview: String
}
