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
}
extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .tamama, name: "류희재", price: "성북구"),
            ItemModel(itemImg: .tamama, name: "류희재", price: "성북구"),
            ItemModel(itemImg: .tamama, name: "류희재", price: "성북구"),
            ItemModel(itemImg: .tamama, name: "류희재", price: "성북구"),
            ItemModel(itemImg: .tamama, name: "류희재", price: "성북구"),
            ItemModel(itemImg: .tamama, name: "류희재", price: "성북구")
        ]
    }
}
