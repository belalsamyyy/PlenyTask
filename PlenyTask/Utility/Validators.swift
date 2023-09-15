//
//  Validators.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import Foundation

protocol ValidatorProtocol {
    func validated(_ value: String) throws -> String
}

struct ValidationError: Error {
    var message: String
    init(_ message: String) {
        self.message = message
    }
}

//MARK: - Validator Factory

enum ValidatorType {
    case optional
    case required(String)
    case email
    case password
}

enum ValidatorFactory {
    static func validateFor(type: ValidatorType) -> ValidatorProtocol {
        switch type {
        case .optional:
            return OptionalValidator()
        case .required(let message):
            return RequiredValidator(errorMessage: message)
        case .email:
            return EmailValidator()
        case .password:
            return PasswordValidator()
        }
    }
    
    
    //MARK: - Validators
    
    struct OptionalValidator: ValidatorProtocol {
        func validated(_ value: String) throws -> String {
            return value
        }
    }
    
    struct RequiredValidator: ValidatorProtocol {
        let errorMessage: String
        func validated(_ value: String) throws -> String {
            guard !value.isBlank else { throw ValidationError(errorMessage)}
            return value
        }
    }
    
    struct EmailValidator: ValidatorProtocol {
        func validated(_ value: String) throws -> String {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailtest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            let lowerCasedValue = value.lowercased()

            guard !lowerCasedValue.isBlank else { throw ValidationError("Email Address TextField is Empty !!") }
            guard emailtest.evaluate(with: lowerCasedValue) else { throw ValidationError("Email Address is Invalid") }
            return lowerCasedValue
        }
    }
        
    struct PasswordValidator: ValidatorProtocol {
        func validated(_ value: String) throws -> String {
            guard !value.isBlank else { throw ValidationError("Password TextField is Empty !!") }
            guard value.count >= 6 else { throw ValidationError("Password should have at least 6 characters") }
            return value
        }
    }
}



