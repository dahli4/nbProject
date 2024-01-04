//
//  side.swift
//  kiosk
//
//  Created by A on 2023/12/07.
//

import Foundation

class sidemenu{
    var side = [
        "1: 감자튀김     |   1000  |   감자튀김이 바삭바삭",
        "2: 치킨너겟     |   2000  |   맛있는 치킨너겟~",
        "3: 치즈감자     |   2000  |   감자튀김에 치즈를 뿌렸다"]
    var realSide = ["감자튀김","치즈너겟","치즈감자"]
    var price = ["1000", "2000", "2000"]
    
    
    func showSide(total: total){
        while true{
            print("\n")
            print("~사이드~")
            print("================")
            for menu in side {
                print(menu)
            }
            print("0: 뒤로가기")
            print("================\n")
            
            if let choice = Input().userInput() {
                
                switch choice {
                case 1:
                    print("\(side[0])을\n 장바구니에 사이드를 담았습니다.\n")
                    total.addSide(menuName: realSide[0], price: price[0])
                    bagAdd = true
                case 2:
                    print("\(side[1])을\n 장바구니에 사이드를 담았습니다.\n")
                    total.addSide(menuName: realSide[1], price: price[1])
                    bagAdd = true
                case 3:
                    print("\(side[2])를\n 장바구니에 사이드를 담았습니다.\n")
                    total.addSide(menuName: realSide[2], price: price[2])
                    bagAdd = true
                case 0:
                    print("전체 메뉴로 돌아갑니다.\n")
                    return
                default:
                    print("잘못된 선택입니다.\n")
                }
            }
        }
    }
}
