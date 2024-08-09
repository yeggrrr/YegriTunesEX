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
        let artistId: Int // 저자 아이디
        let artistName: String // 저자 이름
        let collectionName: String // 책 이름
        let artworkUrl100: String // 표지 이미지 
        let primaryGenreName: String // 장르
        let description: String // 줄거리
        let previewUrl: String // 미리듣기 링크
    }
}
