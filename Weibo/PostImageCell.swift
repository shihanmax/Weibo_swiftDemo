//
//  PostImageCell.swift
//  Weibo
//
//  Created by shihanmax on 2020/11/29.
//

import SwiftUI

private let KImageSpace: CGFloat = 6

struct PostImageCell: View {
    let images: [String]
    let width: CGFloat
    
    var body: some View {
        Group {
            if images.count == 1 {
                loadImage(name: self.images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: width,
                           height: width * 0.75)
                    .clipped()
            } else if images.count == 2 {
                PostImageCelleRow(images: images, width: width)
                
            } else if images.count == 3 {
                PostImageCelleRow(images: images, width: width)
                
            } else if images.count == 4 {
                VStack(spacing: KImageSpace) {
                    PostImageCelleRow(images: Array(images[0...1]), width: width)
                    PostImageCelleRow(images: Array(images[2...3]), width: width)
                }

            } else if images.count == 5 {
                VStack(spacing: KImageSpace) {
                    PostImageCelleRow(images: Array(images[0...1]), width: width)
                    PostImageCelleRow(images: Array(images[2...4]), width: width)
                }
                
            } else if images.count == 6 {
                VStack(spacing: KImageSpace) {
                    PostImageCelleRow(images: Array(images[0...2]), width: width)
                    PostImageCelleRow(images: Array(images[3...5]), width: width)
                }
            }
        }
    }
}

struct PostImageCelleRow: View {
    let images: [String]
    let width: CGFloat
    
    var body: some View {
        HStack(spacing: KImageSpace) {
            ForEach(images, id: \.self) {image in
                loadImage(name: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (self.width - KImageSpace * CGFloat(self.images.count - 1)) / CGFloat(self.images.count),
                           height: (self.width - KImageSpace * CGFloat(self.images.count - 1)) / CGFloat(self.images.count))
                    .clipped()
            }
        }
    }
    
}
struct PostImageCell_Previews: PreviewProvider {
    static var previews: some View {
        let images = postList.list[0].images
        let width = UIScreen.main.bounds.width
        
        return Group {
            PostImageCell(images: Array(images[0...0]), width: width - 30)
            PostImageCell(images: Array(images[0...1]), width: width - 30)
            PostImageCell(images: Array(images[0...2]), width: width - 30)
            PostImageCell(images: Array(images[0...3]), width: width - 30)
            PostImageCell(images: Array(images[0...4]), width: width - 30)
            PostImageCell(images: Array(images[0...5]), width: width - 30)
        }
            
        .previewLayout(.fixed(width: width, height: 300))
    }
}
