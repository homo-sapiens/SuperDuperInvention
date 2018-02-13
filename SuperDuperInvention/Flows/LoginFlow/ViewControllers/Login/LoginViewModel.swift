//
//  LoginViewModel.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 13/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

let minimalUsernameLength = 5
let minimalPasswordLength = 5

class LoginViewModel {

    let login = Variable<String>("")
    let loginValid = Variable<String>("Username has to be at least \(minimalUsernameLength) characters")
    let password = Variable<String>("")
    let passwordValid = Variable<String>("Password has to be at least \(minimalPasswordLength) characters")


    init() {

    }


}
