//
//  UIViewExtensions.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

extension UIView {

    private class func viewInNibNamed<T: UIView>(_ nibNamed: String) -> T {
        return Bundle.main.loadNibNamed(nibNamed, owner: nil, options: nil)!.first as! T
    }

    class func nib() -> Self {
        return viewInNibNamed(nameOfClass)
    }

    class func nib(_ frame: CGRect) -> Self {
        let view = nib()
        view.frame = frame
        view.layoutIfNeeded()
        return view
    }
}
/*
protocol NibInstantiatable {
    static var NibName: String { get }
}
extension NibInstantiatable {
    static var NibName: String { return String(Self) }
    static func instantiate() -> Self {
        return instantiateWithName(NibName)
    }
    static func instantiateWithOwner(owner: AnyObject?) -> Self {
        return instantiateWithName(NibName, owner: owner)
    }
    static func instantiateWithName(name: String, owner: AnyObject? = nil) -> Self {
        let nib = UINib(nibName: name, bundle: nil)
        guard let view = nib.instantiateWithOwner(owner, options: nil).first as? Self else {
            fatalError("failed to load \(name) nib file")
        }
        return view
    }
}
*/
