//
//  HomeTableViewCell.swift
//  DaangnMarket-iOS
//
//  Created by 황찬미 on 2022/08/07.
//

import UIKit

import SnapKit
import Then

final class HomeTableViewCell: UITableViewCell {
    
    static let identifier = "HomeTableViewCell"
    
    // MARK: - Property
    
    var itemImageView = UIImageView().then {
        $0.image = Constant.Image.image1
        $0.contentMode = .scaleAspectFit
    }
    
    var placeLabel = UILabel().then {
        $0.text = "동대문구 제기동"
        $0.font = .systemFont(ofSize: 11, weight: .medium)
        $0.textColor = .lightGray
    }
    
    var itemNameLable = UILabel().then {
        $0.text = "기본 셔링 반팔티"
        $0.font = .systemFont(ofSize: 15, weight: .regular)
    }
    
    var createdTimeLabel = UILabel().then {
        $0.text = "1분 전"
        $0.font = .systemFont(ofSize: 11, weight: .medium)
        $0.textColor = .lightGray
    }
    var priceLabel = UILabel().then {
        $0.text = "25,000원"
        $0.font = .systemFont(ofSize: 15, weight: .bold)
    }
    
    var labelStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
    }
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setLayout()
    }
    
    // MARK: - Custom Method
    
    private func setLayout() {
        self.addSubviews([itemImageView,
                          itemNameLable,
                          labelStackView,
                          priceLabel])
        labelStackView.addArrangedSubview(placeLabel)
        labelStackView.addArrangedSubview(createdTimeLabel)
        
        itemImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(15)
            $0.width.height.equalTo(103)
        }
        
        itemNameLable.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.top)
            $0.leading.equalTo(itemImageView.snp.trailing).offset(17)
        }
        
        labelStackView.snp.makeConstraints {
            $0.top.equalTo(itemNameLable.snp.bottom).offset(4)
            $0.leading.equalTo(itemNameLable.snp.leading)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(labelStackView.snp.bottom).offset(7)
            $0.leading.equalTo(labelStackView.snp.leading)
        }
    }
    
    func setData(_ data: HomeDataModel) {
        itemImageView.image = data.itemImage
        itemNameLable.text = data.itemName
        placeLabel.text = data.address
        createdTimeLabel.text = data.createdTime
        priceLabel.text = data.price
    }
}
