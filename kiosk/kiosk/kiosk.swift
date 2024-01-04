//
//  kiosk.swift
//  kiosk
//
//  Created by A on 2023/12/08.
//

import Foundation

let allmenu = menu()
let bItem = bugermenu()
let sItem = sidemenu()
let inp = Input()

var bagAdd = false

class kiosk1{
    var totalObj = total()
    func run(){
        while true{
            allmenu.mainmenu()
            if bagAdd == true{
                print("장바구니")
                print("버거: \(totalObj.bugname) 사이드: \(totalObj.sidename)")
                print("총합: \(totalObj.calculateTotalPrice())")
            }
            if let input = inp.userInput() {
                
                switch input{
                case 1:
                    bItem.showBurger(total: totalObj)
                case 2:
                    sItem.showSide(total: totalObj)
                case 0:
                    return
                default:
                    print("다시 입력하세요")
                }
            }
        }
    }
}
