//
//  PostCell.swift
//  Weibo
//
//  Created by shihanmax on 2020/11/28.
//

import SwiftUI


struct PostCell: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 5){
                post.avatarImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        PostVIPBadge(isVip: post.vip)
                            .offset(x: 16, y: 16)
                    )
                
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(post.name)
                        .font(Font.system(size: 16))
                        .foregroundColor(Color(red: 242 / 255, green: 99 / 255, blue: 4 / 255))
                        .lineLimit(1) // 仅显示1行
                    Text(post.date)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
                
                .padding(.leading, 10)
                
                if !post.isFollowed{
                    Spacer()  // 占位
                    
                    Button(action: {
                        print("Clicked")
                        print("helloworld")
                        
                    }) {
                        Text("关注")
                            .font(.system(size: 14))
                            .foregroundColor(.orange)
                            .frame(width: 50, height: 26)  // 1/增大点击区域  2/ 方便设置圆角
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)  // 绘制圆角矩形
                                    .stroke(Color.orange, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)  // 仅绘制边框
                            )
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            Text(post.text)
                .font(.system(size: 17))
            
            if !post.images.isEmpty {
                PostImageCell(images: post.images, width: UIScreen.main.bounds.width - 30)
            }
            
            Divider()
            
            HStack(spacing: 0) {
                Spacer()
                PostCellToolbarButton(image: "message",
                                      text: post.commentCountText,
                                      color: .black) {
                    print("clicked comment button")
                }
                
                Spacer()
                
                PostCellToolbarButton(image: "heart",
                                      text: post.likeCountText,
                                      color: .black) {
                    print("clicked like button")
                }
                
                Spacer()
            }
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(Color(red: 238 / 255,
                                       green:238 / 255,
                                       blue: 238 / 255))
            
        }
        .padding(.horizontal, 10)
        .padding(.top, 15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[0])
    }
}
