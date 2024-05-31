//
//  ScoreManager.swift
//  SpaceWar
//
//  Created by Brandon Grande on 30/05/24.
//

import Foundation

struct ScoreManager{
    private static let defaults = UserDefaults.standard
    
    static func getScore()-> Int {
        defaults.integer(forKey: Constants.Keys.score)
    }
    static func saveScore(score: Int){
        defaults.setValue(score, forKey: Constants.Keys.score) 
    }
}
