//
//  NetworkManager.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/9/24.
//

import Foundation
import RxSwift
import Alamofire

enum APIError: Error {
    case invalidURL
    case unknownResponse
    case statusError
}

final class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    func callRequest(query: String) -> Observable<SearchModel> {
        let url = "https://itunes.apple.com/search?term=\(query)&entity=audiobook"
        
        return Observable.create { observer in
            AF.request(url)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: SearchModel.self) { response in
                    switch response.result {
                    case .success(let success):
                        observer.onNext(success)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            
            return Disposables.create()
        }
    }
}
