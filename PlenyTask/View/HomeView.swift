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
                    CustomPostCell(username: randomUserName(), userimage: randomUserImage(), content: post.body, images: randomPostImages())
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
    
    func randomUserName() -> String {
        let userNames = ["Alice Smith", "Bob Johnson", "Charlie Brown", "David Davis",
                         "Emma White", "Frank Wilson", "Grace Lee", "Hannah Miller", "Isaac Adams", "Jack Taylor"]
        let randomIndex = Int.random(in: 0...userNames.count - 1)
        return userNames[randomIndex]
    }
    
    func randomUserImage() -> String {
        let userImages = ["image-profile-user1", "image-profile-user2"]
        let randomIndex = Int.random(in: 0...userImages.count - 1)
        return userImages[randomIndex]
    }
    
    func randomPostImages() -> [String] {
        let postImages: [String] = ["image-post-meal1", "image-post-meal2", "image-post-meal3", "image-post-meal4",
                                     "image-post-meal5", "image-post-meal6", "image-post-meal7", "image-post-meal8", "image-post-meal9"]
        let numberOfImages = Int.random(in: 1...postImages.count)  // random post images quantity
        return Array(postImages.shuffled().prefix(numberOfImages))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(vm: HomeVM())
    }
}
