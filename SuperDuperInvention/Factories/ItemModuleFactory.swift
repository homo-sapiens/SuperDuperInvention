//
//  ItemModuleFactory.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 12/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

protocol ItemModuleFactory {
    func makeMainItems() -> ItemsListView
    //func makeItemDetailOutput(item: Item) -> ItemDetailView
}

