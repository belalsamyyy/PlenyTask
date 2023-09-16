//
//  CustomNavBar.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import Foundation
import SwiftUI

struct CustomNavBar: View {
    @State private var isSearching: Bool = false
    @Binding var searchText: String
    @State var startSearchAction: () -> Void
    @State var cancelAction: () -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            if isSearching {
                CustomTextField(icon: "icon-home-search", value: $searchText, placeholder: "Search ...", actionType: .cancel(action: {
                    print("cancel btn tapped ...")
                    isSearching.toggle()
                    cancelAction() // customize cancel action
                }))
                
            } else {
                HStack {
                    Image("image-navbar-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 25)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    Button {
                        print("start searching ...")
                        isSearching.toggle()
                        startSearchAction() // do somethign when start searcing≥..
                        
                    } label: {
                        Image("icon-home-search")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .padding(.horizontal, 20)
                    }
                }
                .frame(height: 50)
            }
        }
        .padding(.horizontal, 5)
        .padding(.bottom, 8)
    }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar(searchText: .constant(""), startSearchAction: { print("start searching ...") }, cancelAction: { print("cancel btn tapped ... ")})
    }
}
