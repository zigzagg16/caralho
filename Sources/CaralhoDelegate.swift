//
//  CaralhoDelegate.swift
//  caralho
//
//  Created by Arnaud Schloune on 24/10/2017.
//  Copyright © 2017 Arnaud Schloune. All rights reserved.
//

import Foundation

protocol CaralhoDelegate {
    func didStart(caralho:Caralho)
    func didSelectCaralhoText(text:CaralhoText)
    //TODO: Add didEnd method + logic in Caralho.swift
}
