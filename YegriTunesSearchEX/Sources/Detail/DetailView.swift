//
//  DetailView.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/10/24.
//

import UIKit
import SnapKit

final class DetailView: UIView, ViewRepresentable {
    let coverImageView = UIImageView()
    let genreView = UIView()
    let genreLabel = UILabel()
    private let artistNameLabel = UILabel()
    let artistNameInfoLabel = UILabel()
    let artistUnderscoreView = UIView()
    private let bookNameLabel = UILabel()
    let bookNameInfoLabel = UILabel()
    let bookUnderscoreView = UIView()
    
    private let descriptionTitleView = UIView()
    private let descriptionTitleLabel = UILabel()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setConstraints()
        configureUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func addSubviews() {
        addSubviews([coverImageView, genreView, artistNameLabel, artistNameInfoLabel, artistUnderscoreView, bookNameLabel, bookNameInfoLabel, bookUnderscoreView, descriptionTitleView])
        descriptionTitleView.addSubview(descriptionTitleLabel)
        genreView.addSubview(genreLabel)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(descriptionLabel)
    }
    
    func setConstraints() {
        let safeArea = safeAreaLayoutGuide
        let scrollViewFrame = scrollView.frameLayoutGuide
        let scrollViewContent = scrollView.contentLayoutGuide
        
        coverImageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(safeArea).inset(20)
            $0.height.equalTo(coverImageView.snp.width)
        }
        
        genreView.snp.makeConstraints {
            $0.top.equalTo(coverImageView.snp.bottom).offset(10)
            $0.leading.equalTo(coverImageView.snp.leading)
            $0.width.equalTo(80)
            $0.height.equalTo(30)
        }
        
        genreLabel.snp.makeConstraints {
            $0.edges.equalTo(genreView.snp.edges).inset(5)
        }
        
        artistNameLabel.snp.makeConstraints {
            $0.top.equalTo(genreView.snp.bottom).offset(10)
            $0.leading.equalTo(coverImageView.snp.leading)
        }
        
        artistNameInfoLabel.snp.makeConstraints {
            $0.top.equalTo(artistNameLabel.snp.top)
            $0.leading.equalTo(artistNameLabel.snp.trailing).offset(5)
            $0.trailing.lessThanOrEqualTo(safeArea).offset(20)
        }
        
        artistUnderscoreView.snp.makeConstraints {
            $0.top.equalTo(artistNameLabel.snp.bottom)
            $0.leading.equalTo(artistNameLabel.snp.leading)
            $0.trailing.equalTo(artistNameInfoLabel.snp.trailing)
            $0.height.equalTo(2)
        }
        
        bookNameLabel.snp.makeConstraints {
            $0.top.equalTo(artistUnderscoreView.snp.bottom).offset(5)
            $0.leading.equalTo(coverImageView.snp.leading)
        }
        
        bookNameInfoLabel.snp.makeConstraints {
            $0.top.equalTo(bookNameLabel.snp.top)
            $0.leading.equalTo(bookNameLabel.snp.trailing).offset(5)
            $0.trailing.lessThanOrEqualTo(safeArea).offset(20)
        }
        
        bookUnderscoreView.snp.makeConstraints {
            $0.top.equalTo(bookNameLabel.snp.bottom)
            $0.leading.equalTo(bookNameLabel.snp.leading)
            $0.trailing.equalTo(bookNameInfoLabel.snp.trailing)
            $0.height.equalTo(2)
        }
        
        descriptionTitleView.snp.makeConstraints {
            $0.top.equalTo(bookUnderscoreView).offset(20)
            $0.leading.equalTo(safeArea).offset(20)
            $0.width.equalTo(90)
            $0.height.equalTo(30)
        }
        
        descriptionTitleLabel.snp.makeConstraints {
            $0.edges.equalTo(descriptionTitleView.snp.edges).inset(5)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(descriptionTitleView.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(safeArea).inset(20)
            $0.bottom.equalTo(safeArea).offset(-20)
        }
        
        contentView.snp.makeConstraints {
            $0.verticalEdges.equalTo(scrollViewContent.snp.verticalEdges)
            $0.horizontalEdges.equalTo(scrollViewFrame.snp.horizontalEdges)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.verticalEdges.equalTo(contentView.snp.verticalEdges)
            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges)
        }
    }
    
    func configureUI() {
        // UI
        genreView.layer.cornerRadius = 10
        genreLabel.font = .systemFont(ofSize: 16, weight: .bold)
        genreLabel.textAlignment = .center
        artistNameLabel.text = "작가 이름:"
        artistNameLabel.font = .systemFont(ofSize: 17, weight: .bold)
        artistNameInfoLabel.tintColor = .darkGray
        artistNameInfoLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        artistUnderscoreView.backgroundColor = .systemBrown
        bookNameLabel.text = "책 이름:"
        bookNameLabel.font = .systemFont(ofSize: 17, weight: .bold)
        bookNameInfoLabel.tintColor = .darkGray
        bookNameInfoLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        bookUnderscoreView.backgroundColor = .systemBrown
        
        descriptionTitleView.layer.borderWidth = 2
        descriptionTitleView.layer.borderColor = UIColor.systemBrown.cgColor
        descriptionTitleView.layer.cornerRadius = 10
        
        descriptionTitleLabel.text = "작품 줄거리"
        descriptionTitleLabel.textAlignment = .center
        descriptionTitleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
    }
}
