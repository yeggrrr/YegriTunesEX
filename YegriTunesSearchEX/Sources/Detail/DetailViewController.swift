//
//  DetailViewController.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/9/24.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

final class DetailViewController: UIViewController {
    // MARK: UI
    let detailView = DetailView()
    
    // MARK: Properties
    var detailData = PublishSubject<SearchModel.Results>()
    
    let viewModel = DetailViewModel()
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
    
    func bind() {
        detailData
            .subscribe(with: self) { owner, value in
                owner.navigationItem.title = value.collectionName
                owner.detailView.genreLabel.text = value.primaryGenreName
                owner.detailView.artistNameInfoLabel.text = value.artistName
                owner.detailView.bookNameInfoLabel.text = value.collectionName
                owner.detailView.descriptionLabel.text = value.description
                let imageString = self.setCoverImage(imageURL: value.artworkUrl100)
                if let imageURL = URL(string: imageString) {
                    owner.detailView.coverImageView.kf.setImage(with: imageURL)
                }
            }
            .disposed(by: disposeBag)
    }
}
