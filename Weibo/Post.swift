//
//  Post.swift
//  Weibo
//
//  Created by shihanmax on 2020/11/29.
//

import SwiftUI


struct PostList: Codable {
    var list: [Post]
}


// Data Model
struct Post: Codable, Identifiable {  // 遵循codeable协议/Identifiable协议
    let id: Int
    let avatar: String  // 头像
    let vip: Bool  // is VIP
    let name: String
    let date: String
    var isFollowed: Bool  // 可变
    
    let text: String  // 文字内容
    let images: [String]  // 图片内容
    
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
    
}  // 属性名称，类型失配时，解析会出错，则缺少时则不会


// 为data model 扩展view 属性
extension Post {
    var avatarImage: Image {
        return loadImage(name: avatar)
    }
    
    var commentCountText: String {
        if commentCount <= 0 {return "评论"}
        if commentCount < 1000 {return "\(commentCount)"}
        return String(format: "%.1fk", Double(commentCount / 1000))
    }
    
    var likeCountText: String {
        if likeCount <= 0 {return "点赞"}
        if likeCount < 1000 {return "\(likeCount)"}
        return String(format: "%.1fk", Double(likeCount / 1000))
    }
}

let postList = loadPostListData(fileName: "PostListData_recommend_1.json")  // global


func loadPostListData(fileName: String) -> PostList {
    /*
     parse json file for fetching post list data
     */
    
    // bundle: 文件夹
    // guard: 类似断言
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Cannot file \(fileName) in main bundle")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Cannot find \(url)")
    }
    
    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("Cannot parse json")
    }
    
    return list
}


func loadImage(name: String) -> Image {
    // load image from a string path 
    return Image(uiImage: UIImage(named: name)!)
}
