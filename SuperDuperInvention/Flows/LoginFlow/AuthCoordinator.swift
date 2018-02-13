//
//  AuthCoordinator.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    
    private let factory: AuthModuleFactory
    private let router: Router
    private var signUpView: SignUpView?
    
    init(router: Router, factory: AuthModuleFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showLogin()
    }
    
    //MARK: - Run current flow's controllers
    
    private func showLogin() {
        var loginVC = factory.makeLoginOutput()
        loginVC.onCompleteAuth = { [weak self] in
            self?.finishFlow?()
        }
        loginVC.onSignUpButtonTap = { [weak self] in
            self?.showSignUp()
        }

        loginVC.loginViewModel = LoginViewModel()
        router.setRootModule(loginVC)
    }
    
    private func showSignUp() {
        signUpView = factory.makeSignUpHandler()
        signUpView?.onSignUpComplete = { [weak self] in
//            self?.signUpView = nil
            self?.finishFlow?()
        }
        signUpView?.onTermsButtonTap = { [weak self] in
            self?.showTerms()
        }
        router.push(signUpView)
    }
    
    private func showTerms() {
        let termsOutput = factory.makeTermsOutput()
        termsOutput.confirmed = self.signUpView?.confirmed ?? false
        
        termsOutput.onConfirmChanged = { [weak self] confirmed in
            self?.signUpView?.conformTermsAgreement(confirmed)
        }
        router.push(termsOutput, animated: true)
    }
}

