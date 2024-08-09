//
//  SearchModel.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/9/24.
//

import Foundation

struct SearchModel: Decodable {
    let resultCount: Int
    let results: [Results]
    
    struct Results: Decodable {
        let artistId: Int
        let artistName: String
        let collectionName: String
        let artworkUrl100: String
        let primaryGenreName: String
        let description: String
        let previewUrl: String
    }
}
