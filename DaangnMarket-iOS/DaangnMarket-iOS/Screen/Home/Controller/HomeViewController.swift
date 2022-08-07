//
//  HomeViewController.swift
//  DaangnMarket-iOS
//
//  Created by 황찬미 on 2022/08/07.
//

import UIKit

import SnapKit
import Then
import SwiftUI

final class HomeViewController: UIViewController {
    
    // MARK: - UI Property
    
    var navigationBar = UIView().then {
        $0.backgroundColor = .white
    }
    
    var navigationLine = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    var placeLabel = UILabel().then {
        $0.text = "상봉제 1동"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.sizeToFit()
    }
    
    var searchButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Constant.Image.icSearch, for: .normal)
    }
    
    var menuButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Constant.Image.icMenu, for: .normal)
    }
    
    var bellButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Constant.Image.icBell, for: .normal)
    }
    
    var naviButtonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 16
        $0.distribution = .fillEqually
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        setLayout()
    }
    
    // MARK: - Custom Method
    
    private func hideNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setLayout() {
        view.addSubviews([navigationBar,
                          navigationLine,
                          placeLabel,
                          naviButtonStackView])
        naviButtonStackView.addArrangedSubview(searchButton)
        naviButtonStackView.addArrangedSubview(menuButton)
        naviButtonStackView.addArrangedSubview(bellButton)
        
        navigationBar.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(40)
        }
        navigationLine.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(navigationBar)
            $0.height.equalTo(1)
        }
        
        placeLabel.snp.makeConstraints {
            $0.centerY.equalTo(navigationBar)
            $0.leading.equalToSuperview().inset(16)
        }
        
        naviButtonStackView.snp.makeConstraints {
            $0.centerY.equalTo(navigationBar)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}
