//
//  ItemListViewModel.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 13/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

class ItemListViewModel {
    let title = Variable<String>("Main items")
    let items: Observable<[Item]>

    init() {
        self.items = Observable.just(
            (0..<20).map { Item(title: "Item № \($0)", subtitle: "Item descripton") }
            )
    }
}
