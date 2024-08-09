//
//  NetworkManager.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/9/24.
//

import Foundation
import RxSwift

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
        
        let result = Observable<SearchModel>.create { observer in
            guard let url = URL(string: url) else {
                observer.onError(APIError.invalidURL)
                return Disposables.create()
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    observer.onError(APIError.unknownResponse)
                    return
                }
                
                guard let response = response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    observer.onError(APIError.statusError)
                    return
                }
                
                if let data = data,
                   let searchData = try? JSONDecoder().decode(SearchModel.self, from: data) {
                    observer.onNext(searchData)
                    observer.onCompleted()
                } else {
                    print("Decoding Failed")
                    observer.onError(APIError.unknownResponse)
                }
            }
            .resume()
            
            return Disposables.create()
        }
        
        return result
    }
}
