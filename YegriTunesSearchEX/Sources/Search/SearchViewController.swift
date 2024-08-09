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
                cell.booknameLabel.text = element.collectionName
                cell.artistNameLabel.text = element.artistName
                if let imageURL = URL(string: element.artworkUrl100) {
                    cell.coverImageView.kf.setImage(with: imageURL)
                }
            }
            .disposed(by: disposeBag)
    }
}

