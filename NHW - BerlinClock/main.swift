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

func berlinClockHour(hours: Int) -> String {
    guard hours <= 24 else { return "Invalid format of hours" }
    
    let divider = hours / 5
    let mod = hours % 5
    let count = divider + mod
    var result = [String](repeating: "R", count: count)
    result.append(" ")
    result.append(lampRow(totalNumberLamps: 4, numberLampsOn: mod, lampSymbol: "R"))
    return result.joined()
}

func validateAndGetResult(minutes: Int) -> String {
    guard minutes < 60 else { return "Invalid format of minutees" }
    
    let divider = minutes / 5
    let mod = minutes % 5
    
//    let yellowResultOfFive = [String](repeating: "Y", count: divider)
//    var realResultOfFive: [String] = yellowResultOfFive.enumerated().compactMap { (index, result) in
//        let redPartIndexes = [3, 6, 9]
//        return redPartIndexes.contains(index + 1) ? "R" : result
//    }
    var realResultOfFive: String = ""
    let intStream = 1...11
    intStream.forEach { i in
        realResultOfFive.append( i <= divider ? minuteRow(index: i) : "O")
    }
    realResultOfFive.append(" ")
    
    realResultOfFive.append(lampRow(totalNumberLamps: 4, numberLampsOn: mod, lampSymbol: "Y"))
    
    return realResultOfFive
    }
    
//    realResultOfFive.append(" ")
//    realResultOfFive.append(lampRow(totalNumberLamps: 4, numberLampsOn: mod, lampSymbol: "Y"))
//    let resultOfOne = [String](repeating: "Y", count: mod)
//    let result = realResultOfFive + resultOfOne
//
//    return result.joined()



func lampRow(totalNumberLamps: Int , numberLampsOn: Int , lampSymbol: String ) -> String {
    var sb: String = ""
    let intStream = 1...totalNumberLamps
    intStream.forEach { i in
        sb.append( i <= numberLampsOn ? lampSymbol : "O" )
    }
    return sb
    
}

func minuteRow(index: Int) -> String {
    return index % 3 == 0 ? "R" : "Y";
}

print(berlinClockHour(hours: 20))
print(validateAndGetResult(minutes: 55))
print(berlinClockSecond(second: 33))
