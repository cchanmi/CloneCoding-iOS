//
//  DetailViewController.swift
//  DaangnMarket-iOS
//
//  Created by 황찬미 on 2022/08/07.
//

import UIKit

import SnapKit
import Then

final class DetailViewController: UIViewController {

    
    // MARK: - UI Property
    
    var navigationBar = UIView().then {
        $0.backgroundColor = .white
    }
    
    var bottomView = UIView().then {
        $0.backgroundColor = .white
    }
    
    var bottomViewTopLine = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    var homeButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Constant.Image.icBackHome, for: .normal)
    }
    
    var moreButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Constant.Image.icMore, for: .normal)
    }
    
    var heartButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setImage(Constant.Image.icHeartOff, for: .normal)
    }
    
    var bottomViewmiddelLine = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    var priceLabel = UILabel().then {
        $0.text = "16,000원"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    var priceProposal = UILabel().then {
        $0.text = "가격제안불가"
        $0.font = .systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .lightGray
    }
    
    var priceStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 3
        $0.alignment = .leading
    }
    
    var chatListButton = UIButton().then {
        $0.setTitle("채팅 목록 보기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        $0.backgroundColor = .daangnOrange
        $0.layer.cornerRadius = 4
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Custom Method
    
    private func setUI() {
        view.backgroundColor = .white
        
        view.addSubviews([navigationBar,
                          bottomView,
                          bottomViewTopLine,
                          homeButton,
                          moreButton,
                          heartButton,
                          bottomViewmiddelLine,
                          priceStackView,
                          chatListButton])
        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(priceProposal)
        
        navigationBar.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(40)
        }
        
        homeButton.snp.makeConstraints {
            $0.centerY.equalTo(navigationBar)
            $0.leading.equalToSuperview().inset(22)
        }
        
        moreButton.snp.makeConstraints {
            $0.centerY.equalTo(navigationBar)
            $0.trailing.equalToSuperview().offset(-18)
        }
        
        bottomView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(68)
        }
        
        bottomViewTopLine.snp.makeConstraints {
            $0.top.equalTo(bottomView.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        heartButton.snp.makeConstraints {
            $0.centerY.equalTo(bottomView)
            $0.leading.equalToSuperview().inset(16)
        }
        
        bottomViewmiddelLine.snp.makeConstraints {
            $0.centerY.equalTo(bottomView)
            $0.leading.equalTo(heartButton.snp.trailing).offset(16)
            $0.height.equalTo(40)
            $0.width.equalTo(1)
        }
        
        priceStackView.snp.makeConstraints {
            $0.centerY.equalTo(bottomView)
            $0.leading.equalTo(bottomViewmiddelLine.snp.trailing).offset(16)
        }
        
        chatListButton.snp.makeConstraints {
            $0.centerY.equalTo(bottomView)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(122)
            $0.height.equalTo(41)
        }
    }
}
