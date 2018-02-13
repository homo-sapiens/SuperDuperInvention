//
//  ItemTableViewCell.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 13/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

class ItemTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!

    func setName(_ name: String) {
        nameLabel.text = name
    }
}
