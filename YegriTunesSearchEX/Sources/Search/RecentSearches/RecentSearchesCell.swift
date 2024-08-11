//
//  RecentSearchesCell.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/11/24.
//

import UIKit

final class RecentSearchesCell: UITableViewCell, ViewRepresentable {
    private let clockImageView = UIImageView()
    let itemLabel = UILabel()
    let deleteButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setConstraints()
        configureUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func addSubviews() {
        contentView.addSubviews([clockImageView, itemLabel, deleteButton])
    }
    
    func setConstraints() {
        let safeArea = contentView.safeAreaLayoutGuide
        clockImageView.snp.makeConstraints {
            $0.top.bottom.equalTo(safeArea).inset(10)
            $0.leading.equalTo(safeArea).offset(10)
            $0.width.equalTo(clockImageView.snp.height)
        }
        
        itemLabel.snp.makeConstraints {
            $0.top.bottom.equalTo(safeArea)
            $0.leading.equalTo(clockImageView.snp.trailing).offset(10)
            $0.trailing.equalTo(deleteButton.snp.leading).offset(-10)
        }
        
        deleteButton.snp.makeConstraints {
            $0.top.bottom.equalTo(safeArea)
            $0.trailing.equalTo(safeArea)
            $0.width.equalTo(deleteButton.snp.height)
        }
    }
    
    func configureUI() {
        clockImageView.image = UIImage(systemName: "clock")
        clockImageView.tintColor = .black
        clockImageView.contentMode = .scaleAspectFit
        
        itemLabel.setUI(txtColor: .label, numOfLines: 1, fontStyle: .systemFont(ofSize: 15, weight: .regular))
        
        deleteButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        deleteButton.tintColor = .black
    }
}
