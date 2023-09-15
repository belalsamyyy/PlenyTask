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
        Text("Welcome from Home View ...")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(vm: HomeVM())
    }
}
