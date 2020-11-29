//
//  PostVIPBadge.swift
//  Weibo
//
//  Created by shihanmax on 2020/11/29.
//

import SwiftUI

struct PostVIPBadge: View {
    
    let isVip: Bool
    
    var body: some View {
        
        Group {
            if isVip {
                Text("V")
                    .bold()
                    .font(.system(size: 11))
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color.yellow)
                    .background(Color.red)
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 7.5)
                            .stroke(Color.white, lineWidth: 1))
            }
        }
    }
}

struct PostVIPBadge_Previews: PreviewProvider {
    static var previews: some View {
        PostVIPBadge(isVip: true)
    }
}
