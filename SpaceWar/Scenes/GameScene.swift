//
//  GameScene.swift
//  SpaceWar
//
//  Created by Brandon Grande on 26/05/24.
//

 
import SpriteKit
import GameplayKit

final class GameScene: SKScene {
    var player = Player()
    let joystickBase = SKSpriteNode(imageNamed: Constants.Images.joystickBase)
    let joystick = SKSpriteNode(imageNamed: Constants.Images.joystick)
    let firePad = SKSpriteNode(imageNamed: Constants.Images.firePad)
    
    override func didMove(to view: SKView) {
        createParallaxBackground()
        createPlayerControls()
        createPlayer()
        addAsteroids()
        addEnemies()
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    private func addAsteroids(){
        run(SKAction.repeatForever(SKAction.sequence([
            SKAction.run{self.createAsteoid()},
            SKAction.wait(forDuration: CGFloat.random(in: 3...5))]
        )))
    }
    
    private func addEnemies(){
        run(SKAction.repeatForever(SKAction.sequence([
            SKAction.run{self.createEnemy()},
            SKAction.wait(forDuration: CGFloat.random(in: 3...5))]
        )))
        
    }
}
