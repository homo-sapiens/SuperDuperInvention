//
//  LoginView.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

protocol LoginView: BaseView {
    var onCompleteAuth: (() -> Void)? { get set }
    var onSignUpButtonTap: (() -> Void)? { get set }
}
