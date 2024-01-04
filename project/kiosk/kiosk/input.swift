//
//  input.swift
//  kiosk
//
//  Created by A on 2023/12/07.
//

import Foundation

class Input{
    func userInput() -> Int?{
        print("입력: ", terminator: "")
        guard let input = readLine() else{return nil}
        print("\n")
        return Int(input)
    }
}
