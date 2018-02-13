//
//  ItemListView.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 12/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

protocol ItemsListView: BaseView {
    var onItemSelect: ((Item) -> ())? { get set }
    var onCreateItem: (() -> Void)? { get set }
    var onLogout: (() -> Void)? { get set }

}

