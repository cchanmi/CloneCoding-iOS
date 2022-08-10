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
    
    // MARK: Property
    
    var imageData: UIImage?
    
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
        $0.addTarget(self, action: #selector(homeButtonDidTap), for: .touchUpInside)
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
    
    var contentScrollerView = UIScrollView().then {
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = false
    }
    
    var contentView = UIView().then {
        $0.backgroundColor = .white
    }
    
    var titleView = UIView().then {
        $0.backgroundColor = .white
    }
    
    var profileImage = UIImageView().then {
        $0.image = Constant.Image.image5
    }
    
    var userNameLabel = UILabel().then {
        $0.text = "짠미"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    var placeLabel = UILabel().then {
        $0.text = "개봉동"
        $0.font = .systemFont(ofSize: 12, weight: .light)
    }
    
    var userLabelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 3
        $0.alignment = .leading
    }
    
    var temperature = UILabel().then {
        $0.text = "36.5℃"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .blue
    }
    
    var progessBar = UIProgressView().then {
        $0.progress = 0.1
    }
    
    var temperatureStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 3
        $0.alignment = .leading
    }
    
    var smaileImageView = UIImageView().then {
        $0.image = Constant.Image.icFace
    }
    
    var mannerTemperature = UILabel().then {
        $0.text = "매너온도"
        $0.font = .systemFont(ofSize: 11, weight: .medium)
        $0.textColor = .systemGray2
    }
    
    var titleViewBottomLine = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    let imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    var statusButton = UIButton().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.layer.cornerRadius = 4
    }
    
    var statusLabel = UILabel().then {
        $0.text = "판매중"
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    var arrowImage = UIImageView().then {
        $0.image = Constant.Image.icArrow
    }
    
    var itemNameLabel = UILabel().then {
        $0.text = "최태성 한능검 심화 기출 500제"
        $0.font = .systemFont(ofSize: 19, weight: .bold)
    }
    
    var categoryLabel = UILabel().then {
        $0.text = "도서/티켓/음반"
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .systemGray2
    }
    
    var createdTimeLabel = UILabel().then {
        $0.text = "5분 전"
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .systemGray2
    }
    
    var contentLabel = UILabel().then {
        $0.text = "새 책입니다."
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 15, weight: .medium)
    }
    
    var referenceLabel = UILabel().then {
        $0.text = "조회 2"
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .systemGray2
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setScrollerView()
        setCollectionView()
        hiddenTabBar()
    }
    
    // MARK: - @objc
    
    @objc func homeButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Custom Method
    
    private func setCollectionView() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
    }
    
    private func hiddenTabBar() {
        self.tabBarController?.tabBar.isHidden = true
    }
    
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
    
    private func setScrollerView() {
        view.addSubview(contentScrollerView)
        contentScrollerView.addSubview(contentView)
        contentView.addSubview(imageCollectionView)
        
        contentScrollerView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomView.snp.top)
        }
        
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(contentScrollerView)
            $0.width.equalTo(UIScreen.main.bounds.size.width)
        }
        
        imageCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(contentView)
            $0.height.equalTo(UIScreen.main.bounds.size.width)
        }
        
        contentView.addSubview(titleView)
        titleView.addSubviews([profileImage,
                               userLabelStackView,
                               temperatureStackView,
                               smaileImageView,
                               mannerTemperature,
                               titleViewBottomLine])
        
        userLabelStackView.addArrangedSubview(userNameLabel)
        userLabelStackView.addArrangedSubview(placeLabel)
        
        temperatureStackView.addArrangedSubview(temperature)
        temperatureStackView.addArrangedSubview(progessBar)
        
        titleView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(imageCollectionView.snp.bottom)
        }
        
        temperatureStackView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.top).offset(14)
            $0.trailing.equalTo(smaileImageView.snp.leading).offset(-9)
        }
        
        smaileImageView.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.trailing.equalToSuperview().offset(-15)
            $0.centerY.equalTo(temperatureStackView)
        }
        
        mannerTemperature.snp.makeConstraints {
            $0.top.equalTo(temperatureStackView.snp.bottom).offset(9)
            $0.trailing.equalToSuperview().offset(-15)
            $0.bottom.equalTo(titleViewBottomLine).inset(12)
        }
        
        titleViewBottomLine.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalTo(titleView.snp.bottom)
            $0.height.equalTo(1)
        }
        
        profileImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalTo(titleView)
            $0.height.width.equalTo(40)
        }
        
        userLabelStackView.snp.makeConstraints {
            $0.centerY.equalTo(profileImage)
            $0.leading.equalTo(profileImage.snp.trailing).offset(9)
        }
        
        contentView.addSubviews([statusButton,
                                 statusLabel,
                                 arrowImage,
                                 itemNameLabel,
                                 categoryLabel,
                                 createdTimeLabel,
                                 contentLabel,
                                 createdTimeLabel,
                                 referenceLabel])
        
        statusButton.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(100)
            $0.height.equalTo(40)
        }
        
        statusLabel.snp.makeConstraints {
            $0.centerY.equalTo(statusButton)
            $0.leading.equalTo(statusButton.snp.leading).inset(13)
        }
        
        arrowImage.snp.makeConstraints {
            $0.centerY.equalTo(statusButton)
            $0.trailing.equalTo(statusButton.snp.trailing).inset(13)
        }
        
        itemNameLabel.snp.makeConstraints {
            $0.top.equalTo(statusButton.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(15)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(itemNameLabel.snp.bottom).offset(8)
            $0.leading.equalTo(itemNameLabel.snp.leading)
        }
        
        createdTimeLabel.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.top)
            $0.leading.equalTo(categoryLabel.snp.trailing).offset(9)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(14)
            $0.leading.equalTo(categoryLabel.snp.leading)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        referenceLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(12)
            $0.leading.equalTo(contentLabel.snp.leading)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        if let imageData = imageData as? UIImage {
            cell.setData(imageData)
        }
        return cell
    }
}
