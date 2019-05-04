//
//  FieldSurveyJSONLoader.swift
//  Field Survey
//
//  Created by Park, Joy (MU-Student) on 5/3/19.
//  Copyright © 2019 Park. All rights reserved.
//

import Foundation

class FieldSurveyJSONLoader {
    
    class func load(jsonFileName: String) -> FieldSurveys? {
        var fieldSurveys: FieldSurveys?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
            fieldSurveys = try? jsonDecoder.decode(FieldSurveys.self, from: jsonData)
        }
        
        return fieldSurveys
    }
}
