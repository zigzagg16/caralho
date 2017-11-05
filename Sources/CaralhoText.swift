//
//  CaralhoText.swift
//  caralho
//
//  Created by Arnaud Schloune on 20/10/2017.
//  Copyright © 2017 Arnaud Schloune. All rights reserved.
//

import Foundation
import UIKit

class CaralhoText {
    var text: String = ""
    var time: Double = 0.0
    var backgroundImage: UIImage?
    var position: Int
    var inAnimation: UITableViewRowAnimation
    var outAnimation: UITableViewRowAnimation

    init(text: String,
         time: Double,
         image: UIImage? = nil,
         position: Int,
         inAnimation: UITableViewRowAnimation = .middle,
         outAnimation: UITableViewRowAnimation = .middle) {
        self.text = text
        self.time = time
        self.backgroundImage = image
        self.position = position
        self.inAnimation = inAnimation
        self.outAnimation = outAnimation
    }
}
