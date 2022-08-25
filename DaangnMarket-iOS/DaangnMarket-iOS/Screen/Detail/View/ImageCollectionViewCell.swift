//
//  ImageCollectionViewCell.swift
//  DaangnMarket-iOS
//
//  Created by 황찬미 on 2022/08/08.
//

import UIKit

import SnapKit
import Then

final class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ImageCollectionViewCell"
    
    // MARK: - UI Property
    
    let itemImage = UIImageView().then {
        $0.image = Constant.Image.image3
        $0.contentMode = .scaleAspectFill
    }
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    func setData(_ data: UIImage) {
        itemImage.image = data
    }
    
    private func setLayout() {
        self.addSubview(itemImage)
        
        itemImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
