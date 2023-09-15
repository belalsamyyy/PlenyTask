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
        Text("welcome to Main View ...")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(vm: MainViewVM(placeHolderVM: PlaceHolderVM()))
    }
}

