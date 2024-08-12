//
//  NetworkManager.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/9/24.
//

import Foundation
import RxSwift
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    func callRequest(query: String) -> Single<SearchModel> {
        let url = "https://itunes.apple.com/search?term=\(query)&entity=audiobook"
        
        return Single.create { observer in
            AF.request(url)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: SearchModel.self) { response in
                    switch response.result {
                    case .success(let success):
                        observer(.success(success))
                    case .failure(let error):
                        observer(.failure(error))
                    }
                }
            
            return Disposables.create()
        }
        .debug("네트워크 통신")
    }
}
