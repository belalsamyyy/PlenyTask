//
//  MainView.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var vm: MainViewVM
    
    var body: some View {
        VStack {
            TabView(selection: $vm.selected) {
                HomeView(vm: vm.homeVM)
                    .tag(vm.tabItems[0])
                
                ContentView(view: "shop")
                    .tag(vm.tabItems[1])
                
                ContentView(view: "discount")
                    .tag(vm.tabItems[2])
                
                ContentView(view: "gallery")
                    .tag(vm.tabItems[3])
                
                ContentView(view: "profile")
                    .tag(vm.tabItems[4])
            }
            
            Spacer()
            
            CustomTabBar(tabItems: vm.tabItems, selected: $vm.selected)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(vm: MainViewVM(homeVM: HomeVM(), placeHolderVM: PlaceHolderVM()))
    }
}
