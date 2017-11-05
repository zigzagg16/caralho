//
//  Caralho.swift
//  caralho
//
//  Created by Arnaud Schloune on 20/10/2017.
//  Copyright © 2017 Arnaud Schloune. All rights reserved.
//

import UIKit

class Caralho: UITableView {

    var items: [CaralhoText] = []
    var displayedItems: [CaralhoText] = []
    var font: UIFont = UIFont.boldSystemFont(ofSize: 45.0)
    let cellIdentifier = "CaralhoCell"
    weak var caralhoDelegate: CaralhoDelegate?

    override func awakeFromNib() {
        self.rowHeight = 40.0
        self.separatorStyle = .none
        self.backgroundColor = .clear
        self.delegate = self
        self.dataSource = self
        self.isScrollEnabled = false
        self.register(CaralhoCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
    }

    func play() {
        scheduleItems(items: self.items)
    }

    func scheduleItems(items: [CaralhoText]) {
        if !displayedItems.isEmpty {
            displayedItems = []
            self.reloadData()
        }
        items.forEach { [weak self] item in
            Timer.scheduledTimer(withTimeInterval: item.time, repeats: false, block: { timer in
                self?.insert(caralhoText: item)
                timer.invalidate()
            })
        }
    }

    func insert(caralhoText: CaralhoText) {
        let index = position(desired: caralhoText.position, totalItems: displayedItems.count)
        if (displayedItems.filter { $0.position == index }).first != nil {
            displayedItems.remove(at: index)
            self.deleteRows(at: [IndexPath(row: index, section: 0)], with: caralhoText.outAnimation)
        }

        if index == 0 && displayedItems.isEmpty {
            caralhoDelegate?.didStart(caralho: self)
        }
        displayedItems.insert(caralhoText, at: index)
        self.insertRows(at: [IndexPath(row: index, section: 0)], with: caralhoText.inAnimation)
    }

    private func position(desired: Int, totalItems: Int) -> Int {
        return desired > totalItems ? totalItems : desired
    }
}

extension Caralho: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell: CaralhoCell =
            tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CaralhoCell
        // swiftlint:enable force_cast
        let crl = displayedItems[indexPath.row]
        cell.textLabel?.text = crl.text
        cell.textLabel?.font = self.font
        if let bg = crl.backgroundImage {
            let formattedTitle = NSMutableAttributedString(string: crl.text)
            formattedTitle.addAttribute(NSForegroundColorAttributeName,
                                        value: UIColor.init(patternImage: bg),
                                        range: NSMakeRange(0, crl.text.count))
            cell.textLabel?.attributedText = formattedTitle
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedItems.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        caralhoDelegate?.didSelectCaralhoText(text: displayedItems[indexPath.row])
    }
}
