//
//  SignUpViewController.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

final class SignUpViewController: BaseViewController, SignUpView {

    //controller handler
    var onSignUpComplete: (() -> Void)?
    var onTermsButtonTap: (() -> Void)?

    @IBOutlet weak var termsLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!

    var confirmed = false {
        didSet {
            termsLabel.isHidden = !confirmed
            signUpButton.isEnabled = confirmed
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SignUp"
        termsLabel.isHidden = true
        signUpButton.isEnabled = false
    }

//    override func loadView() {
//        print("load View1")
//        let viewTest: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
//        viewTest.backgroundColor = UIColor.red
//        self.view.addSubview(viewTest)
//    }

    @IBAction func signUpClicked(_ sender: AnyObject) {
        if confirmed {
            onSignUpComplete?()
        }
    }

    @IBAction func termsButtonClicked(_ sender: AnyObject) {
        onTermsButtonTap?()
    }

    func conformTermsAgreement(_ agree: Bool) {
        confirmed = agree
    }
}
