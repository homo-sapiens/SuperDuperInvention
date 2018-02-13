//
//  SignUpView.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

protocol SignUpView: BaseView {

    var confirmed: Bool { get set }
    var onSignUpComplete: (() -> Void)? { get set }
    var onTermsButtonTap: (() -> Void)? { get set }

    func conformTermsAgreement(_ agree: Bool)
}

