//
//  TermsView.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

protocol TermsView: BaseView {
    var confirmed: Bool { get set }
    var onConfirmChanged: ((Bool) -> ())? { get set }
}

