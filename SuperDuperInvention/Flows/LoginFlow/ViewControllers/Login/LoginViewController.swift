//
//  LoginViewController.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

final class LoginViewController: BaseViewController, LoginView, LoginViewInput {

    //MARK: LoginView
    var onCompleteAuth: (() -> Void)?
    var onSignUpButtonTap: (() -> Void)?

    //MARK: LoginViewInput
    var loginViewModel: LoginViewModel?

    //MARK: Outlets
    @IBOutlet private weak var usernameField: UITextField!
    @IBOutlet private weak var usernameValidLabel: UILabel!

    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var passwordValidLabel: UILabel!

    @IBOutlet private weak var loginButton: UIButton!

    @IBAction func loginButtonClicked(_ sender: AnyObject) { onCompleteAuth?() }
    @IBAction func signUpClicked(_ sender: AnyObject) { onSignUpButtonTap?() }

    let disposeBag = DisposeBag()

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }

    private func setupUI() {
        title = "Login"
        usernameValidLabel.text = loginViewModel?.loginValid.value
        passwordValidLabel.text = loginViewModel?.passwordValid.value
    }

    private func setupBindings() {
        guard let viewModel = loginViewModel else {
            return
        }

        let usernameValid = usernameField.rx.text.orEmpty
            .map { $0.count >= minimalUsernameLength }
            .share(replay: 1) // without this map would be executed once for each binding, rx is stateless by default
        
        let passwordValid = passwordField.rx.text.orEmpty
            .map { $0.count >= minimalPasswordLength }
            .share(replay: 1)
        
        usernameValid
            .bind(to: passwordField.rx.isEnabled)
            .disposed(by: disposeBag)
        
        usernameValid
            .bind(to: usernameValidLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        passwordValid
            .bind(to: passwordValidLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        let everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
            .share(replay: 1)
        
        everythingValid
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        usernameField.rx.text
            .orEmpty
            .bind(to: viewModel.login)
            .disposed(by: disposeBag)
        
        passwordField.rx.text
            .orEmpty
            .bind(to: viewModel.password)
            .disposed(by: disposeBag)
        
        _ = viewModel.login.asObservable()
            .map { $0.uppercased() }
            .subscribe(onNext: { (element) in
                print(element)
            })
        _ = viewModel.password.asObservable()
            .subscribe(onNext: { (element) in
                print(element)
            })

        _ = loginButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
               self?.onCompleteAuth
            })
            .disposed(by: disposeBag)

    }

}











