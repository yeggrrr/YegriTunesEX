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
    private let genreView = UIView()
    let genreLabel = UILabel()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let artistNameLabel = UILabel()
    let artistNameInfoLabel = UILabel()
    private let artistUnderscoreView = UIView()
    private let bookNameLabel = UILabel()
    let bookNameInfoLabel = UILabel()
    private let bookUnderscoreView = UIView()
    private let descriptionTitleView = UIView()
    private let descriptionTitleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setConstraints()
        configureUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func addSubviews() {
        addSubviews([coverImageView, genreView])
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews([
            artistNameLabel,
            artistNameInfoLabel,
            artistUnderscoreView,
            bookNameLabel,
            bookNameInfoLabel,
            bookUnderscoreView,
            descriptionTitleView,
            descriptionLabel])
        
        descriptionTitleView.addSubview(descriptionTitleLabel)
        genreView.addSubview(genreLabel)
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
            $0.trailing.lessThanOrEqualTo(safeArea.snp.trailing).offset(-20)
            $0.height.equalTo(30)
        }
        
        genreLabel.snp.makeConstraints {
            $0.edges.equalTo(genreView.snp.edges).inset(5)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(genreView.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(safeArea).inset(20)
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.verticalEdges.equalTo(scrollViewContent.snp.verticalEdges)
            $0.horizontalEdges.equalTo(scrollViewFrame.snp.horizontalEdges)
        }
        
        artistNameLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.leading.equalTo(contentView.snp.leading)
            $0.trailing.lessThanOrEqualTo(contentView.snp.trailing).offset(-20)
        }
        
        artistUnderscoreView.snp.makeConstraints {
            $0.top.equalTo(artistNameLabel.snp.bottom)
            $0.leading.equalTo(artistNameLabel.snp.leading)
            $0.trailing.equalTo(artistNameLabel.snp.trailing)
            $0.height.equalTo(2)
        }
        
        artistNameInfoLabel.snp.makeConstraints {
            $0.top.equalTo(artistUnderscoreView.snp.bottom).offset(2)
            $0.leading.equalTo(artistUnderscoreView.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-20)
        }
        
        bookNameLabel.snp.makeConstraints {
            $0.top.equalTo(artistNameInfoLabel.snp.bottom).offset(10)
            $0.leading.equalTo(artistNameInfoLabel.snp.leading)
            $0.trailing.lessThanOrEqualTo(contentView.snp.trailing).offset(-20)
        }
        
        bookUnderscoreView.snp.makeConstraints {
            $0.top.equalTo(bookNameLabel.snp.bottom)
            $0.leading.equalTo(bookNameLabel.snp.leading)
            $0.trailing.equalTo(bookNameLabel.snp.trailing)
            $0.height.equalTo(2)
        }
        
        bookNameInfoLabel.snp.makeConstraints {
            $0.top.equalTo(bookUnderscoreView.snp.top).offset(2)
            $0.leading.equalTo(bookUnderscoreView.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-20)
        }
        
        descriptionTitleView.snp.makeConstraints {
            $0.top.equalTo(bookNameInfoLabel.snp.bottom).offset(20)
            $0.leading.equalTo(contentView.snp.leading)
            $0.width.equalTo(90)
            $0.height.equalTo(30)
        }
        
        descriptionTitleLabel.snp.makeConstraints {
            $0.edges.equalTo(descriptionTitleView.snp.edges).inset(5)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionTitleView.snp.bottom).offset(5)
            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    func configureUI() {
        scrollView.showsVerticalScrollIndicator = false
        artistUnderscoreView.backgroundColor = .systemBrown
        bookUnderscoreView.backgroundColor = .systemBrown
        genreView.setUI(bgColor: .systemBrown)
        descriptionTitleView.setUI()
        
        genreLabel.setUI(
            fontStyle: .systemFont(ofSize: 16, weight: .bold),
            txtAlignment: .center)
        
        artistNameLabel.setUI(
            txt: "작가 이름",
            fontStyle: .systemFont(ofSize: 17, weight: .bold))
        
        artistNameInfoLabel.setUI(
            txtColor: .darkGray,
            numOfLines: 0,
            fontStyle: .systemFont(ofSize: 17, weight: .semibold))
        
        bookNameLabel.setUI(
            txt: "책 이름",
            fontStyle: .systemFont(ofSize: 17, weight: .bold))
        
        bookNameInfoLabel.setUI(
            txtColor: .darkGray,
            numOfLines: 0,
            fontStyle: .systemFont(ofSize: 17, weight: .semibold))
        
        descriptionTitleLabel.setUI(
            txt: "작품 줄거리",
            fontStyle: .systemFont(ofSize: 17, weight: .bold),
            txtAlignment: .center)
        
        descriptionLabel.setUI(
            txtColor: .darkGray,
            numOfLines: 0,
            fontStyle: .systemFont(ofSize: 17, weight: .semibold),
            txtAlignment: .left)
    }
}
