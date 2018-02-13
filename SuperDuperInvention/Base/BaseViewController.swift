//
//  BaseViewController.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

class BaseViewController: UIViewController {
    deinit {
        print("\(self.nameOfClass) deinit")
    }
}

extension BaseViewController: Presentable {

    func toPresent() -> UIViewController? {
        return self
    }
}
