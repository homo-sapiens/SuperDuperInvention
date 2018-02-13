//
//  AuthModuleFactory.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

protocol AuthModuleFactory {
    func makeLoginOutput() -> LoginView & LoginViewInput
    func makeSignUpHandler() -> SignUpView
    func makeTermsOutput() -> TermsView
}
