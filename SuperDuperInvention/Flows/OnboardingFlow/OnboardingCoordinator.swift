//
//  OnboardingCoordinator.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 12/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

class OnboardingCoordinator: BaseCoordinator, OnboardingCoordinatorOutput {

    var finishFlow: (() -> Void)?

    private let factory: OnboardingModuleFactory
    private let router: Router

    init(with factory: OnboardingModuleFactory, router: Router) {
        self.factory = factory
        self.router = router
    }

    override func start() {
        showOnboarding()
    }

    func showOnboarding() {
        let onboardingModule = factory.makeOnboardingModule()
        onboardingModule.onFinish = { [weak self] in
            self?.finishFlow?()
        }
        router.setRootModule(onboardingModule)
    }
}

