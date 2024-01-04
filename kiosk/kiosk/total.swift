//
//  total.swift
//  kiosk
//
//  Created by A on 2023/12/07.
//

import Foundation

class total{
    var bugname: [String] = []
    var price1: [String] = []
    var sidename: [String] = []
    var price2: [String] = []
    
    func addBug(menuName: String, price: String) {
            bugname.append(menuName)
            price1.append(price)
    }
    func addSide(menuName: String, price: String) {
            sidename.append(menuName)
            price2.append(price)
    }
    func calculateTotalPrice() -> Int {
            let totalPrice1 = price1.map { Int($0) ?? 0 }.reduce(0, +)
            let totalPrice2 = price2.map { Int($0) ?? 0 }.reduce(0, +)
            return totalPrice1 + totalPrice2
    }
}
