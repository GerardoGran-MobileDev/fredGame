//
//  Score.swift
//  FredGame
//
//  Created by user188455 on 4/17/21.
//

import Foundation

class Score : Codable {
    var name : String
    var date : Date
    var points : Int
    
    init(name: String, date: Date, points: Int) {
        self.name = name
        self.date = date
        self.points = points
    }
    
    
}
