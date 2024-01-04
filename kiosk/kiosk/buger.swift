//
//  buger.swift
//  kiosk
//
//  Created by A on 2023/12/07.
//

import Foundation

class bugermenu{
    var bugers = [
        "1: 그냥버거     |   3000  |   토마토, 양상추, 소고기패티가 들어간 오리지널 맛",
        "2: 치즈버거     |   4000  |   치즈가 들어간 맛있는 치즈버거",
        "3: 매운버거     |   5000  |   매운소스가 들어간 매운버거"]
    var price = ["3000", "4000", "5000"]
    var realBugers = ["그냥버거","치즈버거","매운버거"]
    
    func showBurger(total: total){
        while true{
            print("\n")
            print("~햄버거~")
            print("================")
            for menu in bugers {
                print(menu)
            }
            print("0: 뒤로가기")
            print("================\n")
            
            if let choice = Input().userInput() {
                
                switch choice {
                case 1:
                    print("\(bugers[0])을\n 장바구니에 버거를 담았습니다.\n")
                    total.addBug(menuName: realBugers[0], price: price[0])
                    bagAdd = true
                case 2:
                    print("\(bugers[1])을\n 장바구니에 버거를 담았습니다.\n")
                    total.addBug(menuName: realBugers[1], price: price[1])
                    bagAdd = true
                case 3:
                    print("\(bugers[2])을\n 장바구니에 버거를 담았습니다.\n")
                    total.addBug(menuName: realBugers[2], price: price[2])
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
