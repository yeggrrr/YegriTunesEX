//
//  DetailViewModel.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/10/24.
//

import Foundation
import RxSwift
import RxCocoa

final class DetailViewModel {
    var detailData = PublishSubject<SearchModel.Results>()
    
    struct Input {
        let previewButtonTap: ControlEvent<Void>
    }
    
    struct Output {
        let previewButtonTap: ControlEvent<Void>
    }
    
    func transform(input: Input) -> Output {
        return Output(previewButtonTap: input.previewButtonTap)
    }
}
