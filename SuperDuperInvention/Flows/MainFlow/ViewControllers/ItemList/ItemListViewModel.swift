//
//  ItemListViewModel.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 13/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

class ItemListViewModel {

    // MARK: - Inputs

    /// Call to open detailItem.
    let selectItem: AnyObserver<Item>

    /// Call to reload items.
    let reload: AnyObserver<Void>


    // MARK: - Outputs

    /// Emits an array of fetched items.
    let items = Variable<[Item]>([])
//    let items: Observable<[Item]>

    /// Emits a formatted title for a navigation item.
    let title: Observable<String>

    /// Emits an item to be shown in detail screen.
    let showItem: Observable<Item>


    let disposeBag = DisposeBag()


    init() {

        self.title = Observable.just("Main Items!")

        let _selectItem = PublishSubject<Item>()
        self.selectItem = _selectItem.asObserver()
        self.showItem = _selectItem.asObservable()
            .map { $0 }

        self.items.value = (0..<20).map { Item(title: "Item № \($0)", subtitle: "Item descripton") }
//        self.items = Observable.from(optional: (0..<20).map { Item(title: "Item № \($0)", subtitle: "Item descripton") })

        let _reload = PublishSubject<Void>()
        self.reload = _reload.asObserver()
        _reload.asObservable()
            .subscribe(onNext: { [weak self] in self?.updateItems()})
            .disposed(by: disposeBag)

    }

    func updateItems() {
        self.items.value.append(Item(title: "NewItem № 4578", subtitle: "NewItem descripton"))
    }
}
