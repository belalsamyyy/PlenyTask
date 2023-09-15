//
//  String+Extensions.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import Foundation

extension String {
        
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func validate(type: ValidatorType) throws -> String {
        let validator = ValidatorFactory.validateFor(type: type)
        return try validator.validated(self)
    }
}
