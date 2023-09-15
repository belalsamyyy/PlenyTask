//
//  CustomTabBar.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import SwiftUI

//MARK: - Custom Tab Bar

struct CustomTabBar: View {
    var tabItems: [TabBarItem]
    @Binding var selected: TabBarItem
    
    init(tabItems: [TabBarItem], selected: Binding<TabBarItem>) {
        UITabBar.appearance().isHidden = true
        self.tabItems = tabItems
        self._selected = selected
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Divider()
            HStack(alignment: .center, spacing: 0) {
                ForEach(tabItems, id: \.self) { item in
                    TabBarButton(selected: $selected, item: item, image: item.iconImage)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainView(vm: MainViewVM(homeVM: HomeVM(), placeHolderVM: PlaceHolderVM()))
    }
}


//MARK: - Tab Bar Button

struct TabBarButton : View {
    @Binding var selected : TabBarItem
    var item: TabBarItem
    var image: String
    
    var body: some View {
        // button
        Button(action: {
            withAnimation(.spring()) {
                selected = item
            }
        }, label: {
            VStack(alignment: .center, spacing: 14) {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(selected == item ? Color("primaryColor") : .white)
                    .opacity(selected == item ? 1 : 0)
                    .frame(width: 20, height: 5)
                
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundColor(selected == item ? Color("primaryColor") : .black)
                    .opacity(selected == item ? 1 : 0.50)
                    .frame(width: 30, height: 30)
            }
        })
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
    }
}
