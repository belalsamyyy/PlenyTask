//
//  UIApplication+hideKeyboard.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    // hide keyboard when tap anywhere in the screen ...
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
