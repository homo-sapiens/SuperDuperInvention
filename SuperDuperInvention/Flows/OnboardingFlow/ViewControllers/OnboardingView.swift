//
//  OnboardingView.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 12/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

protocol OnboardingView: BaseView {
    var onFinish: (() -> Void)? { get set }
}
