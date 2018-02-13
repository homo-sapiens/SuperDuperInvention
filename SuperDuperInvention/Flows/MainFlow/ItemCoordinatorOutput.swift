//
//  ItemCoordinatorOutput.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 12/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

protocol ItemCoordinatorOutput: class {
    var finishFlow: (() -> Void)? { get set }
}

