//
//  ModuleFactoryImp.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

final class ModuleFactoryImp: AuthModuleFactory, OnboardingModuleFactory, ItemModuleFactory {

    func makeLoginOutput() -> LoginView & LoginViewInput {
        return LoginViewController.init(nibName: LoginViewController.nameOfClass, bundle: nil)
    }

    func makeSignUpHandler() -> SignUpView {
        return SignUpViewController.init(nibName: SignUpViewController.nameOfClass, bundle: nil)
    }

    func makeTermsOutput() -> TermsView {
        return TermsViewController.init(nibName: TermsViewController.nameOfClass, bundle: nil)
    }

    func makeOnboardingModule() -> OnboardingView {
        return OnboardingViewController.init(nibName: OnboardingViewController.nameOfClass, bundle: nil)
    }

    func makeMainItems() -> ItemsListView & ItemListViewInput {
        return ItemsListViewController.init(nibName: ItemsListViewController.nameOfClass, bundle: nil)
    }

}

