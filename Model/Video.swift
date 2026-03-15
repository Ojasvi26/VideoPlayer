import Foundation

struct VideoResponse: Codable {
    let page: Int
    let per_page: Int
    let videos: [Video]
}

struct Video: Codable, Identifiable {
    let id: Int
    let duration: Int
    let image: String
    let user: userName
    let video_files: [VideoFile]
}

struct VideoFile: Codable {
    let link: String
    let quality: String
}

struct userName: Codable{
    let name: String
}
