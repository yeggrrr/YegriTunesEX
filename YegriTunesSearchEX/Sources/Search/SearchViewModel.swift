//
//  SearchViewModel.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/9/24.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel {
    let disposeBag = DisposeBag()
    
    struct Input {
        let searchButtonTap: ControlEvent<Void>
        let searchText: ControlProperty<String>
    }
    
    struct Output {
        let bookList: Observable<[SearchModel.Results]>
    }
    
    func transform(input: Input) -> Output {
        let bookList = PublishSubject<[SearchModel.Results]>()
        
        input.searchButtonTap
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .withLatestFrom(input.searchText)
            .distinctUntilChanged()
            .flatMap { value in
                NetworkManager.shared.callRequest(query: value)
            }
            .subscribe(with: self, onNext: { owner, bookData in
                bookList.onNext(bookData.results)
            }, onError: { owner, error in
                print("error: \(error)")
            }, onCompleted: { owner in
                print("completed")
            }, onDisposed: { owner in
                print("disposed")
            })
            .disposed(by: disposeBag)
        
        return Output(bookList: bookList)
    }
}
