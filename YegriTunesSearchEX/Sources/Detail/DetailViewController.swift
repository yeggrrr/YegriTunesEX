//
//  DetailViewController.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/9/24.
//

import UIKit
import RxSwift
import RxCocoa

final class DetailViewController: UIViewController {
    // MARK: UI
    let detailView = DetailView()
    
    // MARK: Properties
    var detailData = PublishSubject<SearchModel.Results>()
    let disposeBag = DisposeBag()
    
    // MARK: View Life Cycle
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: Functions
    func configureUI() {
        view.backgroundColor = .white
    }
}
