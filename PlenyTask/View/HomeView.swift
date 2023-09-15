//
//  HomeView.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm: HomeVM
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            CustomNavBar(searchText: $searchText)
            
            VStack(alignment: .leading, spacing: 5) {
                
                List(vm.posts, id: \.id) { post in
                    Text(post.body)
                        .font(.system(size: 18))
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .frame(maxHeight: .infinity)
                        .padding(.bottom)
                        .onAppear {
                            vm.loadMoreDataIfNeeded(currentItem: post)
                        }
                }
                .listStyle(.plain)
                .overlay {
                    if vm.isLoading {
                        VStack {
                            Spacer()
                            ProgressView().padding()
                        }
                        
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(vm: HomeVM())
    }
}


//List(items, id: \.element.id) { index, item in
//    // 3
//    ListItemRowView(item: item)
//        .onAppear { viewModel.requestMoreItemsIfNeeded(index: index) }
//}.overlay {
//    // 4
//    if viewModel.dataIsLoading {
//        LoadingView()
//    }
//}
