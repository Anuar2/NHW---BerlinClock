//
//  main.swift
//  NHW - BerlinClock
//
//  Created by Anuar Orazbekov on 21.07.2022.
//

import Foundation

print("Введите секунды")
var seconds = readLine()

print("Введите минуты")
var minutes = readLine()

print("Введите часы")
var hours = readLine()

var result: String = ""

var arr : [String]

func berlinClockSecond(second: Int ) -> String {

    if second % 2 == 0 {
        result += "Y"
    } else {
        result += "O"
    }
    return result
}



//func berlinClockMinute(minute: Int, color: Character) -> String {
//
//}

func validateAndGetResult(hours: Int) -> String {
    guard hours <= 24 else { return "Invalid format of hours" }
    
    let divider = hours / 5
    let mod = hours % 5
    let count = divider + mod
    let result = [String](repeating: "R", count: count)
    return result.joined()
}

func validateAndGetResult(minutes: Int) -> String {
    guard minutes < 60 else { return "Invalid format of minutees" }
    
    let divider = minutes / 5
    let mod = minutes % 5
    
    let yellowResultOfFive = [String](repeating: "Y", count: divider)
    let realResultOfFive: [String] = yellowResultOfFive.enumerated().compactMap { (index, result) in
        let redPartIndexes = [3, 6, 9]
        return redPartIndexes.contains(index + 1) ? "R" : result
    }
    
    let resultOfOne = [String](repeating: "Y", count: mod)
    let result = realResultOfFive + resultOfOne
    
    return result.joined()
}


print(validateAndGetResult(hours: 20))
print(validateAndGetResult(minutes: 55))
