//
//  PostListView.swift
//  Weibo
//
//  Created by shihanmax on 2020/11/29.
//

import SwiftUI

struct PostListView: View {
    init() {
        UITableView.appearance().separatorStyle = .none  // 禁用UITableView的分割线
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        List {
            ForEach(postList.list) {
                post in PostCell(post: post)
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView()
                .navigationBarTitle("热门")
                .navigationBarHidden(true)
        }
        
    }
}
