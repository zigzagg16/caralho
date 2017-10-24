//
//  CaralhoCell.swift
//  caralho
//
//  Created by Arnaud Schloune on 24/10/2017.
//  Copyright © 2017 Arnaud Schloune. All rights reserved.
//

import Foundation
import UIKit

class CaralhoCell:UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.textLabel?.textColor = .white
        self.textLabel?.backgroundColor = .clear
        self.selectionStyle = .none
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
