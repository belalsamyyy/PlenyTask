//
//  CustomButton.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var btnColor: Color = Color("primaryColor") // btn color
    var lblColor: Color = .white // btn label color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(lblColor)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(btnColor)
        )
        .padding(.horizontal, 15)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Sign in", action: { print("btn tapped ....") })
    }
}
