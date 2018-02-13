//
//  CoordinatorFactoryImp.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

final class CoordinatorFactoryImp: CoordinatorFactory {
/*
    func makeTabbarCoordinator() -> (configurator: Coordinator, toPresent: Presentable?) {
        let controller = TabbarController.controllerFromStoryboard(.main)
        let coordinator = TabbarCoordinator(tabbarView: controller, coordinatorFactory: CoordinatorFactoryImp())
        return (coordinator, controller)
    }
*/
    func makeAuthCoordinatorBox(router: Router) -> Coordinator & AuthCoordinatorOutput {

        let coordinator = AuthCoordinator(router: router, factory: ModuleFactoryImp())
        return coordinator
    }

    func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoordinatorOutput {
        return OnboardingCoordinator(with: ModuleFactoryImp(), router: router)
    }


    func makeItemCoordinator(router: Router) -> Coordinator & ItemCoordinatorOutput {
        return ItemCoordinator(router: router, factory: ModuleFactoryImp(), coordinatorFactory: CoordinatorFactoryImp())
    }
/*
    func makeItemCoordinator() -> Coordinator {
        return makeItemCoordinator(navController: nil)
    }

    func makeItemCoordinator(navController: UINavigationController?) -> Coordinator {
        let coordinator = ItemCoordinator(
            router: router(navController),
            factory: ModuleFactoryImp(),
            coordinatorFactory: CoordinatorFactoryImp()
        )
        return coordinator
    }

    func makeSettingsCoordinator() -> Coordinator {
        return makeSettingsCoordinator(navController: nil)
    }

    func makeSettingsCoordinator(navController: UINavigationController? = nil) -> Coordinator {
        let coordinator = SettingsCoordinator(router: router(navController), factory: ModuleFactoryImp())
        return coordinator
    }

    func makeItemCreationCoordinatorBox() ->
        (configurator: Coordinator & ItemCreateCoordinatorOutput,
        toPresent: Presentable?) {

            return makeItemCreationCoordinatorBox(navController: navigationController(nil))
    }
    func makeItemCreationCoordinatorBox(navController: UINavigationController?) ->
        (configurator: Coordinator & ItemCreateCoordinatorOutput,
        toPresent: Presentable?) {

            let router = self.router(navController)
            let coordinator = ItemCreateCoordinator(router: router, factory: ModuleFactoryImp())
            return (coordinator, router)
    }
*/
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }


    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController.controllerFromStoryboard(.main) }
    }


}

