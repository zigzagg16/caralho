//
//  ViewController.swift
//  caralhoDemo
//
//  Created by Arnaud Schloune on 24/10/2017.
//  Copyright © 2017 caralho. All rights reserved.
//

import UIKit

typealias demo = (items:[CaralhoText],rowHeight:CGFloat,font:UIFont)

class ViewController: UIViewController {
    
    @IBOutlet weak var caralho: Caralho!
    var demos:[demo] = []
    var demoIndex = 0
    
    func prepareDemos(){
        
        demos.append(
            (items:[
                CaralhoText(text: "How", time: 0.5, position: 0),
                CaralhoText(text: "to", time: 0.7, position: 1),
                CaralhoText(text: "shoot", time: 0.9, position: 2),
                CaralhoText(text: "on iPhone X", time: 1.1, position: 4),
                CaralhoText(text: "portraits", time: 1.6, image: UIImage(named: "orange"), position: 3, inAnimation: .left)
                ],
             rowHeight : 40.0,
             font : UIFont(name: "HelveticaNeue-bold", size: 45)!)
        )
        
        demos.append(
            (items:[
                CaralhoText(text: "CA", time: 0.5, position: 0, inAnimation: .bottom),
                CaralhoText(text: "RA", time: 0.7, position: 1, inAnimation: .fade),
                CaralhoText(text: "LHO", time: 0.9, position: 2, inAnimation: .right),
                CaralhoText(text: "LHO !", time: 1.4, image: UIImage(named: "orange"), position: 2, inAnimation: .fade, outAnimation: .fade)
                ],
             rowHeight : 80.0,
             font : UIFont.boldSystemFont(ofSize: 85.0))
        )
        //Please add more demos here! PRs welcome ! 🤙🏼
    }
    
    func vaiCaralho(){
        let demo = demos[demoIndex]
        caralho.items = demo.items
        caralho.rowHeight = demo.rowHeight
        caralho.font = demo.font
        caralho.caralhoDelegate = self
        caralho.play()
        //Go to next demo
        demoIndex = (demoIndex == demos.count - 1) ? 0 : (demoIndex + 1)
    }
    
    override func viewDidLoad() {
        prepareDemos()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        vaiCaralho()
    }
    
    @IBAction func showtime(_ sender: UIButton) {
        vaiCaralho()
    }
}

//MARK: - Caralho delegate

extension ViewController : CaralhoDelegate {
    
    func didStart(caralho: Caralho) {
        print("🇧🇷 CARALHO ! - Start")
    }
    
    func didEnd(caralho: Caralho) {
        print("🇧🇷 CARALHO ! - End")
    }
    
    func didSelectCaralhoText(text: CaralhoText) {
        print("🇧🇷 CARALHO ! - Tapped \(text.position) - \(text.text)")
    }
}
