//
//  ParentScene.swift
//  SpaceWar
//
//  Created by Brandon Grande on 30/05/24.
//

import SpriteKit
import GameplayKit

class ParentScene: SKScene {
    var scoreLabel = SKLabelNode(text: "")
    override func didMove(to view: SKView) {
    }
    override func update(_ currentTime: TimeInterval) {
    }
    func createScoreLabel(){
        let score = ScoreManager.getScore()
        scoreLabel.zPosition = 6
        scoreLabel.text = String(format: NSLocalizedString("score.text", comment: ""), String(score))
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.verticalAlignmentMode = .top
        scoreLabel.position = CGPoint(x: size.width - 35, y: size.height - 35)
        addChild(scoreLabel)
        ScoreManager.saveScore(score: 0)
    }
}
