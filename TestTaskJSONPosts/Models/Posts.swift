import Foundation
struct Posts : Codable {
    let postId : Int?
    let timeshamp : Int?
    let title : String?
    let preview_text : String?
    let likes_count : Int?

    enum CodingKeys: String, CodingKey {

        case postId = "postId"
        case timeshamp = "timeshamp"
        case title = "title"
        case preview_text = "preview_text"
        case likes_count = "likes_count"
    }

//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        postId = try values.decodeIfPresent(Int.self, forKey: .postId)
//        timeshamp = try values.decodeIfPresent(Int.self, forKey: .timeshamp)
//        title = try values.decodeIfPresent(String.self, forKey: .title)
//        preview_text = try values.decodeIfPresent(String.self, forKey: .preview_text)
//        likes_count = try values.decodeIfPresent(Int.self, forKey: .likes_count)
//    }

}
