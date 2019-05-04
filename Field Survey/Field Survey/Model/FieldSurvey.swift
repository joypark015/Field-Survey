//
//  FieldSurvey.swift
//  Field Survey
//
//  Created by Park, Joy (MU-Student) on 5/3/19.
//  Copyright © 2019 Park. All rights reserved.
//

import Foundation

enum Classification: String, Codable {
    case bird
    case amphibian
    case reptile
    case insect
    case fish
    case plant
    case mammal
}

struct FieldSurvey: Codable {
    let classification: Classification
    let title: String
    let description: String
    let date: Date
}

struct FieldSurveys: Codable {
    var status: String
    var observations: [FieldSurvey]
}
