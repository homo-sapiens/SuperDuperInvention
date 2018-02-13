//
//  UIViewControllerExtension.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//
enum Storyboards: String {
    case main = "Main"
    case items = "Items"
    case auth = "Auth"
    case onboarding = "Onboarding"
    case create = "Create"
    case settings = "Settings"
}


extension UIViewController {

    private class func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }

    class func controllerInStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }

    class func controllerInStoryboard(_ storyboard: UIStoryboard) -> Self {
        return controllerInStoryboard(storyboard, identifier: nameOfClass)
    }


    class func controllerFromStoryboard(_ storyboard: Storyboards) -> Self {
        return controllerInStoryboard(UIStoryboard(name: storyboard.rawValue, bundle: nil), identifier: nameOfClass)
    }


}

extension UIViewController {
    static func nibInit() -> UIViewController {
        let controller = self.init(nibName: nibName, bundle: nil)
        return controller
    }
}
