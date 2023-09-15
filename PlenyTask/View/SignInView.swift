//
//  SignInView.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var vm: SignInVM
    
    // i add default values, for quicker testing
    @State private var username = "kminchelle"
    @State private var password = "0lelplR"
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 25) {
                Image("image-welcome")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 440)
                    .scaledToFit()
                
                Text("Welcome")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(Color("primaryColor"))
                
                // Text Fields
                CustomTextField(title: "User Name", type: .emailAddress, value: $username, placeholder: "Enter your user name")
                CustomTextField(title: "Password", type: .default, value: $password, placeholder: "Enter your password", actionType: .password)
                
                // Sign in Button
                CustomButton(text: "Sign in", action: {
                    print("Sign in btn tapped ....")
                    vm.validateFieldsAndLogin(username: username, password: password)
                })
                .padding(.vertical, 20)
                
                Spacer(minLength: 25)
            }
        }
        .adaptsToKeyboard() // => make sure keyboard always under the textfield
        .onTapGesture { UIApplication.shared.hideKeyboard() } // => tap anywhere to dismiss the keyboard
        .ignoresSafeArea()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(vm: SignInVM())
    }
}

