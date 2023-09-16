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
            
            //MARK: - Nav bar / Search bar
            
            CustomNavBar(searchText: $vm.searchQuery, startSearchAction: {
                //print("search btn in nav bar tapped !")
                vm.isSearching = true
                vm.resetAndRefreshPostsList()
                
            }, cancelAction: {
                //print("cancel search btn in search bar tapped !")
                vm.isSearching = false
                vm.resetAndRefreshPostsList()
                
            })
            .onChange(of: vm.searchQuery) { query in
                // a little delay to ignoring very quick changes ...
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    vm.resetAndRefreshPostsList()
                })
            }
            
            Divider()
            
            
            //MARK: - Posts List
            
            VStack(alignment: .leading, spacing: 5) {
                if vm.isSearching && vm.posts.isEmpty {
                    if vm.isLoading {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .tint(Color("primaryColor"))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .scaleEffect(2.0)
                    } else {
                        Text("No Results .. try again !")
                            .font(.system(size: 25, weight: .medium))
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                    }
                    
                    
                } else {
                    List(vm.posts, id: \.id) { post in
                        CustomPostCell(username: randomUserName(), userimage: randomUserImage(), date: randomDate(), content: post.body, images: randomPostImages())
                            .onAppear { vm.loadMoreDataIfNeeded(currentItem: post) }
                    }
                    .listStyle(.plain)
                    .overlay {
                        if vm.isLoading && !vm.posts.isEmpty {
                            VStack {
                                Spacer()
                                ProgressView()
                                    .progressViewStyle(.circular)
                                    .tint(Color("primaryColor"))
                                    .scaleEffect(1.0)
                            }
                            
                        }
                    }
                    
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.hideKeyboard()
        }
    }
    
    func randomUserName() -> String {
        let userNames = ["Alice Smith", "Bob Johnson", "Charlie Brown", "David Davis",
                         "Emma White", "Frank Wilson", "Grace Lee", "Hannah Miller", "Isaac Adams", "Jack Taylor"]
        let randomIndex = Int.random(in: 0...userNames.count - 1)
        return userNames[randomIndex]
    }
    
    func randomUserImage() -> String {
        let userImages = ["image-profile-user1", "image-profile-user2", "image-profile-kfc"]
        let randomIndex = Int.random(in: 0...userImages.count - 1)
        return userImages[randomIndex]
    }
    
    func randomDate() -> String {
        return "\(Int.random(in: 1...30)) days ago"
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
