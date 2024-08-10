//
//  SearchViewController.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/9/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Kingfisher

final class SearchViewController: UIViewController {
    // MARK: UI
    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    
    // MARK: Properties
    private let viewModel = SearchViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        bind()
    }
    
    // MARK: Functions
    private func configure() {
        // view
        view.backgroundColor = .white
        // addSubview
        view.addSubviews([searchBar, tableView])
        // constraints
        navigationItem.titleView = searchBar
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        tableView.rowHeight = 90
        tableView.register(SearchCell.self, forCellReuseIdentifier: SearchCell.id)
    }
    
    private func bind() {
        let input = SearchViewModel.Input(searchButtonTap: searchBar.rx.searchButtonClicked,
                                          searchText: searchBar.rx.text.orEmpty)
        let output = viewModel.transform(input: input)
        
        output.bookList
            .bind(to: tableView.rx.items(cellIdentifier: SearchCell.id, cellType: SearchCell.self)) { (row, element, cell) in
                let imageString = self.setCoverImage(imageURL: element.artworkUrl100)
                if let imageURL = URL(string: imageString) {
                    cell.coverImageView.kf.setImage(with: imageURL, options: [.transition(.fade(0.5))])
                }
                cell.booknameLabel.text = element.collectionName
                cell.artistNameLabel.text = element.artistName
            }
            .disposed(by: disposeBag)
        
        
        Observable.zip(tableView.rx.itemSelected, tableView.rx.modelSelected(SearchModel.Results.self))
            .subscribe(with: self) { owner, value in
                owner.tableView.deselectRow(at: value.0, animated: true)
                let vc = DetailViewController()
                vc.bind()
                vc.detailData.onNext(value.1)
                owner.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
    }
}
