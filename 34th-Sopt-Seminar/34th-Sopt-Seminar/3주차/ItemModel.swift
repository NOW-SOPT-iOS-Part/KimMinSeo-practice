//
//  ChatModel.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 4/20/24.
//

import Foundation
import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}
extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .character1, name: "케로로", price: "2,000원", heartIsSelected: false),
            ItemModel(itemImg: .character2, name: "기로로", price: "5,000원", heartIsSelected: false),
            ItemModel(itemImg: .character3, name: "타마마", price: "3,000원", heartIsSelected: false),
            ItemModel(itemImg: .character4, name: "도로로", price: "3,000원", heartIsSelected: false),
            ItemModel(itemImg: .character5, name: "푸루루", price: "3,000원", heartIsSelected: false),
            ItemModel(itemImg: .character6, name: "쿠루루", price: "3,000원", heartIsSelected: false),
            ItemModel(itemImg: .character6, name: "류희재", price: "3,000원", heartIsSelected: false),
            ItemModel(itemImg: .character6, name: "류희재", price: "3,000원", heartIsSelected: false)
        ]
    }
}
