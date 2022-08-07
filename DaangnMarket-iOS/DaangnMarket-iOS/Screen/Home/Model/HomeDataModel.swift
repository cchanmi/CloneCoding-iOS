//
//  HomeDataModel.swift
//  DaangnMarket-iOS
//
//  Created by 황찬미 on 2022/08/07.
//

import UIKit

struct HomeDataModel {
    let itemImage: UIImage?
    let itemName: String
    let address: String
    let createdTime: String
    let price: String
}

extension HomeDataModel {
    static let itemImages: [HomeDataModel] = [
        HomeDataModel(itemImage: Constant.Image.image1, itemName: "기본 셔링 반팔티", address: "동대문구 제기동", createdTime: "1분 전", price: "6000원"),
        HomeDataModel(itemImage: Constant.Image.image2, itemName: "아이보리 가방", address: "분당구 정자동", createdTime: "3분 전", price: "25000원"),
        HomeDataModel(itemImage: Constant.Image.image3, itemName: "김치볶음밥", address: "성남시 은행동", createdTime: "6분 전", price: "10000원"),
        HomeDataModel(itemImage: Constant.Image.image4, itemName: "커튼", address: "오산시 양산동", createdTime: "10분 전", price: "9500원"),
        HomeDataModel(itemImage: Constant.Image.image5, itemName: "머리띠", address: "동대문구 제기동", createdTime: "1분 전", price: "6000원")]
}
