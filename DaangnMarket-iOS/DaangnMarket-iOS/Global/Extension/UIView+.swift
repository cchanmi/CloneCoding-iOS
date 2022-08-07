//
//  UIView+.swift
//  DaangnMarket-iOS
//
//  Created by 황찬미 on 2022/08/07.
//

import UIKit

extension UIView {
    
    public func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
