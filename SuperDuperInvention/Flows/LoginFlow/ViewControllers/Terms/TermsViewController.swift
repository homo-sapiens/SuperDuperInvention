//
//  TermsViewController.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

class TermsViewController: BaseViewController, TermsView {

    @IBOutlet weak var termsSwitch: UISwitch! {
        didSet { termsSwitch.isOn = confirmed }
    }
    var confirmed = false
    var onConfirmChanged: ((Bool) -> ())?

    @IBAction func termsSwitchValueChanged(_ sender: UISwitch) {
        onConfirmChanged?(sender.isOn)
    }
}

