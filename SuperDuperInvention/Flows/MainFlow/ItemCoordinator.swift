//
//  ItemCoordinator.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 12/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

final class ItemCoordinator: BaseCoordinator, ItemCoordinatorOutput {

    var finishFlow: (() -> Void)?

    private let factory: ItemModuleFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router

    init(router: Router, factory: ItemModuleFactory, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }

    override func start() {
        showItemList()
    }

    //MARK: - Run current flow's controllers

    private func showItemList() {

        var itemsOutput = factory.makeMainItems()
        itemsOutput.onItemSelect = { [weak self] (item) in
            self?.showItemDetail(item)
        }
        itemsOutput.onCreateItem = { [weak self] in
            self?.runCreationFlow()
        }

        itemsOutput.onLogout = { [weak self] in
            self?.runLogout()
        }

        let viewModel = ItemListViewModel()
        itemsOutput.itemListViewModel = viewModel
        viewModel.showItem
        .subscribe(onNext: { [weak self] in self?.showItemDetail($0) })
        .disposed(by: disposeBag)

        router.setRootModule(itemsOutput)
    }

    private func showItemDetail(_ item: Item) {
        print("showItemDetail")
        print("item = \(item)")


/*
        let itemDetailFlowOutput = factory.makeItemDetailOutput(item: item)
        router.push(itemDetailFlowOutput)*/

    }

    //MARK: - Run coordinators (switch to another flow)

    private func runCreationFlow() {

        print("runCreationFlow")
        
        /*
        let (coordinator, module) = coordinatorFactory.makeItemCreationCoordinatorBox()
        coordinator.finishFlow = { [weak self, weak coordinator] item in

            self?.router.dismissModule()
            self?.removeDependency(coordinator)
            if let item = item {
                self?.showItemDetail(item)
            }
        }
        addDependency(coordinator)
        router.present(module)
        coordinator.start()
 */
    }

    private func runLogout() {
        print("runLogout")
        self.finishFlow?()

    }
}
