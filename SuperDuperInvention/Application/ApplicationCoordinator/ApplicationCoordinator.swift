//
//  ApplicationCoordinator.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

fileprivate var onboardingWasShown = false
fileprivate var isAutorized = false

fileprivate enum LaunchInstructor {
    case main, auth, onboarding

    static func configure(
        tutorialWasShown: Bool = onboardingWasShown,
        isAutorized: Bool = isAutorized) -> LaunchInstructor {

        switch (tutorialWasShown, isAutorized) {
        case (true, false), (false, false): return .auth
        case (false, true): return .onboarding
        case (true, true): return .main
        }
    }
}

final class ApplicationCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router

    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }

    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

    override func start() {
        switch instructor {
        case .onboarding: runOnboardingFlow()
        case .auth: runAuthFlow()
        case .main: runMainFlow()
        }
    }

    private func runAuthFlow() {
        let coordinator = coordinatorFactory.makeAuthCoordinatorBox(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            isAutorized = true
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }

    private func runOnboardingFlow() {
        print("run onboarding flow")
        let coordinator = coordinatorFactory.makeOnboardingCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            onboardingWasShown = true
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }

    private func runMainFlow() {
        print("run main flow")
        let itemCoordinator = coordinatorFactory.makeItemCoordinator(router: router)
        itemCoordinator.finishFlow = { [weak self, weak itemCoordinator] in
            isAutorized = false
            onboardingWasShown = false
            self?.start()
            self?.removeDependency(itemCoordinator)
        }
        addDependency(itemCoordinator)
        itemCoordinator.start()
    }
}
