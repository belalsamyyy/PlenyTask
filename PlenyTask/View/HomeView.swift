//
//  HomeView.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm: HomeVM
    
    var body: some View {
        VStack {
            CustomNavBar()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(vm.posts, id: \.id) { post in
                        VStack(alignment: .center, spacing: 20) {
                            Divider()
                            Text(post.body)
                                .font(.system(size: 18))
                                .multilineTextAlignment(.leading)
                                .lineLimit(3)
                                .frame(maxHeight: .infinity)
                                .padding(.bottom)
                        }
                    }
                }
                .padding(.horizontal)
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(vm: HomeVM())
    }
}
