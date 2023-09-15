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
                    .ignoresSafeArea(.all)
                
                ContentView()
                    .tag(vm.tabItems[1])
                    .ignoresSafeArea(.all)
                
                ContentView()
                    .tag(vm.tabItems[2])
                    .ignoresSafeArea(.all)
                
                ContentView()
                    .tag(vm.tabItems[3])
                    .ignoresSafeArea(.all)
                
                ContentView()
                    .tag(vm.tabItems[4])
                    .ignoresSafeArea(.all)
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
