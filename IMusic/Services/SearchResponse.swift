//
//  SearchResponse.swift
//  IMusic
//
//  Created by Дмитрий Рудаков on 21.12.2020.
//
import Foundation

// MARK: - SearchResponse
struct SearchResponse: Codable {
    var resultCount: Int
    var results: [Track]
}

// MARK: - Track
struct Track: Codable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl100: String?
    var previewUrl: String?
}

