//
//  data.swift
//  StarterProjectMultipleViews
//
//  Created by Caden Ng on 19/3/2026.
//

import Foundation

struct NutrientDataPoint: Identifiable {
    var id = UUID().uuidString
    var nutrient: String
    var amount: Int

}
var userInformation: [Int: Bool] = [
    9: false,   // "hips"
    10: false,  // "knees"
    11: false,  // "ankles"
    12: false,  // "shoulders"
    13: false,  // "chest"
    14: false,  // "arm"
    15: true,   // "fatLoss"
    16: true    // "muscleGain"
]

var weight: Float = 70.0
var age: Float = 20.0

var loseFat = (userInformation[15]) ?? false
var gainMuscle = (userInformation[16]) ?? false

var proteinPerKG: Float = 0.0
var fatPerKG: Float = 0.0
var carbPerKG: Float = 0.0



var proteinAmount = 0
var fatAmount = 0
var carbAmount = 0

var excerciseChosen = 0
let injuryError = "(This excercise is not recommended to avoid injury)"





