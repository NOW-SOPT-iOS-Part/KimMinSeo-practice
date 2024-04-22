//
//  ChatModel.swift
//  34th-Sopt-Seminar
//
//  Created by 김민서 on 4/20/24.
//

import Foundation
import UIKit

struct ChatModel {
    let profileImg: UIImage
    let name: String
    let place: String
    let message: String
    let itemImg: UIImage
}
extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel(profileImg: .tamama, name: "류희재", place: "성북구", message: "땡큐", itemImg: .rectangle2),
            ChatModel(profileImg: .tamama, name: "윤희슬", place: "여의도", message: "안녕", itemImg: .rectangle3),
            ChatModel(profileImg: .tamama, name: "김가현", place: "잠실", message: "아요", itemImg: .rectangle3),
            ChatModel(profileImg: .tamama, name: "김선우", place: "회기", message: "너무 좋아요", itemImg: .rectangle4),
            ChatModel(profileImg: .tamama, name: "김나연", place: "미국", message: "뿅", itemImg: .rectangle5),
            ChatModel(profileImg: .tamama, name: "김민서", place: "중국", message: "뿡", itemImg: .rectangle6)
        ]
    }
}
