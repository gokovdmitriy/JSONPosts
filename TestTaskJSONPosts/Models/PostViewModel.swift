//
//  PostViewModel.swift
//  TestTaskJSONPosts
//
//  Created by MacBook Pro  on 18.10.2023.
//

import Foundation
struct PostServerResponce : Codable {
    let post : Post?

    enum CodingKeys: String, CodingKey {

        case post = "post"
    }
}


struct Post : Codable {
    let postId : Int?
    let timeshamp : Int?
    let title : String?
    let text : String?
    let postImage : String?
    let likes_count : Int?
    let preview_text : String?
    var isExpanded: Bool = true

    enum CodingKeys: String, CodingKey {

        case postId = "postId"
        case timeshamp = "timeshamp"
        case title = "title"
        case text = "text"
        case postImage = "postImage"
        case likes_count = "likes_count"
         case preview_text = "preview_text"
    }
}

