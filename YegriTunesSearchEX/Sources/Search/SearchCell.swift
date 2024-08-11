//
//  SearchCell.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/9/24.
//

import UIKit
import SnapKit

final class SearchCell: UITableViewCell, ViewRepresentable {
    // MARK: UI
    let coverImageView = UIImageView()
    private let nameStackView = UIStackView()
    let booknameLabel = UILabel()
    let artistNameLabel = UILabel()
    let previewButton = UIButton()
    
    
    // MARK: View Life Cycle
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        previewButton.layer.cornerRadius = previewButton.frame.height / 2
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setConstraints()
        configureUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: Functions
    func addSubviews() {
        contentView.addSubviews([coverImageView, nameStackView, previewButton])
        nameStackView.addArrangedSubviews([booknameLabel, artistNameLabel])
    }
    
    func setConstraints() {
        let safeArea = contentView.safeAreaLayoutGuide
        
        coverImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(20)
            $0.size.equalTo(60)
        }
        
        nameStackView.snp.makeConstraints {
            $0.verticalEdges.equalTo(safeArea).inset(15)
            $0.leading.equalTo(coverImageView.snp.trailing).offset(10)
            $0.trailing.equalTo(previewButton.snp.leading).offset(-10)
        }
        
        previewButton.snp.makeConstraints {
            $0.centerY.equalTo(coverImageView)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(32)
            $0.width.equalTo(72)
        }
    }
    
    func configureUI() {
        nameStackView.axis = .vertical
        nameStackView.distribution = .fillEqually
        
        // booknameLabel
        booknameLabel.font = .systemFont(ofSize: 17, weight: .bold)
        
        // artistNameLabel
        artistNameLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        artistNameLabel.textColor = .darkGray
        
        // coverImageView
        coverImageView.layer.cornerRadius = 10
        coverImageView.clipsToBounds = true
        
        // previewButton
        previewButton.backgroundColor = .systemGray6
        previewButton.layer.borderWidth = 1
        previewButton.layer.borderColor = UIColor.black.cgColor
        previewButton.setTitle("받기", for: .normal)
        previewButton.setTitleColor(.black, for: .normal)
    }
}
