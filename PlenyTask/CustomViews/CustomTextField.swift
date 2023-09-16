//
//  CustomTextField.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import SwiftUI

//MARK: - TextField Action Enum

enum TextFiledButtonType: Equatable {
    case password
    case cancel(action: () -> Void)
    
    static func == (lhs: TextFiledButtonType, rhs: TextFiledButtonType) -> Bool {
        switch (lhs, rhs) {
        case (.password, .password):
            return true
        default:
            return false
        }
    }
}

//MARK: - Text Field

struct CustomTextField: View {
    // optional - title ( text view )
    var title: String? = nil
    
    // logo
    var icon: String? = nil
    
    // text field properties
    var type: UIKeyboardType = .default
    @Binding var value: String
    var placeholder: String
    
    // optional - action btn
    // => open for extension for other types in future ...
    var actionType: TextFiledButtonType? = nil
    @State var isTextHidden: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            //MARK: - TextField Title
            
            if title != nil {
                Text(title!)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
                    .padding(.horizontal)
            }
            
            //MARK: - TextField itself
            
            HStack {
                
                if icon != nil {
                    Image(icon!)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.leading, 10)
                }
                
                if actionType == .password {
                    if !isTextHidden {
                        SecureField(placeholder, text: $value)
                            .keyboardType(type)
                            .font(.system(size: 20))
                            .multilineTextAlignment(.leading)
                            .frame(maxHeight: .infinity)
                            .padding(.horizontal, 15)
                    } else {
                        TextField(placeholder, text: $value)
                            .keyboardType(type)
                            .font(.system(size: 20))
                            .multilineTextAlignment(.leading)
                            .frame(maxHeight: .infinity)
                            .padding(.horizontal, 15)
                    }
                } else {
                    TextField(placeholder, text: $value)
                        .keyboardType(type)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.leading)
                        .frame(maxHeight: .infinity)
                        .padding(.horizontal, 15)
                }
                
                switch actionType {
                    
                    //MARK: - Action Types
                    
                case .password:
                    Button {
                        withAnimation(.easeInOut) {
                            isTextHidden.toggle()
                        }
                    } label: {
                        Image("icon-textfield-showPassword")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(isTextHidden ? Color("primaryColor") : .gray)
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 30)
                    }
                    .padding(.leading, 10)
                    .frame(width: 25, height: 15)
                    
                case .cancel(let action):
                    Button {
                        value = ""
                        action()
                    } label: {
                        Image("icon-searchbar-cancel")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.trailing, 30)
                    }
                    .padding(.leading, 10)
                    .frame(width: 25, height: 15)
                    
                    
                default:
                    EmptyView()
                }
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("lightGray"), lineWidth: 1)
            )
            .padding(.horizontal)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(title: "User Name", type: .emailAddress, value: .constant(""), placeholder: "Enter your user name")
        CustomTextField(title: "Password", type: .numberPad, value: .constant(""), placeholder: "Enter your password", actionType: .password)
        CustomTextField(icon: "icon-home-search", value: .constant(""), placeholder: "Search ...", actionType: .cancel(action: { print("cancel btn tapped ...") }))
    }
}
