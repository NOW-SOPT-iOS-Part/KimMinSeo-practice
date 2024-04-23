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
            ItemModel(itemImg: .character1, name: "배지현", price: "2,000원", heartIsSelected: false),
            ItemModel(itemImg: .character2, name: "이현진", price: "5,000원", heartIsSelected: false),
            ItemModel(itemImg: .character3, name: "오승연", price: "성북구", heartIsSelected: false),
            ItemModel(itemImg: .character4, name: "이나경", price: "성북구", heartIsSelected: false),
            ItemModel(itemImg: .character5, name: "이지민", price: "성북구", heartIsSelected: false),
            ItemModel(itemImg: .character6, name: "류희재", price: "성북구", heartIsSelected: false),
            ItemModel(itemImg: .character6, name: "류희재", price: "성북구", heartIsSelected: false),
            ItemModel(itemImg: .character6, name: "류희재", price: "성북구", heartIsSelected: false)
        ]
    }
}
