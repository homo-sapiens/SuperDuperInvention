//
//  OnboardingViewController.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 12/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

class OnboardingViewController: BaseViewController, OnboardingView {

    var onFinish: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func finishTapped(_ sender: Any) {
        onFinish?()
    }
}

