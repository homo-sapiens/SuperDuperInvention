//
//  CoordinatorFactory.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

protocol CoordinatorFactory {

    //func makeTabbarCoordinator() -> (configurator: Coordinator, toPresent: Presentable?)
    func makeAuthCoordinatorBox(router: Router) -> Coordinator & AuthCoordinatorOutput


    func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoordinatorOutput

    func makeItemCoordinator(router: Router) -> Coordinator & ItemCoordinatorOutput

    /*
    func makeItemCoordinator(navController: UINavigationController?) -> Coordinator
    func makeItemCoordinator() -> Coordinator


    func makeSettingsCoordinator() -> Coordinator
    func makeSettingsCoordinator(navController: UINavigationController?) -> Coordinator


    func makeItemCreationCoordinatorBox() ->
        (configurator: Coordinator & ItemCreateCoordinatorOutput,
        toPresent: Presentable?)

    func makeItemCreationCoordinatorBox(navController: UINavigationController?) ->
        (configurator: Coordinator & ItemCreateCoordinatorOutput,
        toPresent: Presentable?)
 */
}


