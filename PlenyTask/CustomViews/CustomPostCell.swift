//
//  CustomPostCell.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import SwiftUI

struct CustomPostCell: View {
    @State var username: String
    @State var userimage: String
    @State var date: String
    @State var content: String
    @State var images: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
         
            HStack(alignment: .top) {
                Image(userimage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(username)
                        .font(.system(size: 18))
                    
                    Text(date)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "ellipsis")
                
            }
            .frame(height: 50)
            
            
            Text(content)
                .font(.system(size: 18))
                .multilineTextAlignment(.leading)
                .lineLimit(4)
                .frame(maxHeight: .infinity)
                .padding(.bottom, 5)
            
                        
            
            switch images.count {
            case 0:
                //MARK: - No Images, return nothing
                EmptyView()
                
            case 1:
                //MARK: - post have only 1 image
                Image(images.first ?? "")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 180)
                    .padding(.bottom)
                
            case 2:
                //MARK: - post have only 2 image
                HStack(spacing: 3) {
                    Image(images[0])
                        .resizable()
                    
                    Image(images[1])
                        .resizable()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 180)
                .padding(.bottom)
                
            case 3:
                //MARK: - post have only 3 image
                HStack(spacing: 3) {
                    Image(images[0])
                        .resizable()
                    
                    VStack(spacing: 3) {
                        Image(images[1])
                            .resizable()
                        
                        Image(images[2])
                            .resizable()
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 350)
                .padding(.bottom)
                
            case 4:
                //MARK: - post have only 4 image
                HStack(spacing: 3) {
                    VStack(spacing: 3) {
                        Image(images[0])
                            .resizable()
                        
                        Image(images[1])
                            .resizable()
                    }
                    
                    VStack(spacing: 3) {
                        Image(images[2])
                            .resizable()
                        
                        Image(images[3])
                            .resizable()
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 350)
                .padding(.bottom)
                
            default:
                //MARK: - post have more than 4 image
                HStack(spacing: 3) {
                    VStack(spacing: 3) {
                        Image(images[0])
                            .resizable()
                        
                        Image(images[1])
                            .resizable()
                    }
                    
                    VStack(spacing: 3) {
                        Image(images[2])
                            .resizable()
                        
                        ZStack(alignment: .center) {
                            Image(images[3])
                                .resizable()
                            
                            RoundedRectangle(cornerRadius: 5)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .foregroundColor(.black)
                                .opacity(0.60)
                            
                            Text("+\(images.count - 4)")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(maxWidth: .infinity)
                .frame(height: 350)
                .padding(.bottom)
            }
            
            
        }
        .frame(maxHeight: .infinity)
        .padding(.top, 15)
       
    }
}

struct CustomPostCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomPostCell(username: "Neama Ahmed", userimage: "image-post-meal1", date: "2 days ago", content: "Craving something delicious? Try our new dish - a savory mix of roasted vegetables and quinoa, topped with a zesty garlic. Yum!", images: [])
        HomeView(vm: HomeVM())
    }
}






