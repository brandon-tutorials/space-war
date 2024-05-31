//
//  GameScene.swift
//  SpaceWar
//
//  Created by Brandon Grande on 26/05/24.
//

 
import SpriteKit
import GameplayKit

final class GameScene: ParentScene {
    private struct SceneTraits{
        static let animation: CGFloat = 0.25
    }
    var player = Player()
    var joystickIsActive = false
    var selectedNodes: [UITouch: SKSpriteNode] = [:]
    var playerVelocityX: CGFloat = 0
    var playerVelocityY: CGFloat = 0
    var enemiesDestroyed: Int = 0 {
        didSet{
            ScoreManager.saveScore(score: enemiesDestroyed)
            scoreLabel.text = String(format: NSLocalizedString("score.text", comment: ""), String(ScoreManager.getScore()))
        }
    }

    let joystickBase = SKSpriteNode(imageNamed: Constants.Images.joystickBase)
    let joystick = SKSpriteNode(imageNamed: Constants.Images.joystick)
    let firePad = SKSpriteNode(imageNamed: Constants.Images.firePad)
    
    override func didMove(to view: SKView) {
        createParallaxBackground()
        createPlayerControls()
        createPlayer()
        addAsteroids()
        addEnemies()
        setupPhysics()
        createScoreLabel()
    }
    
    private func setupPhysics() {
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        physicsBody = SKPhysicsBody(edgeLoopFrom: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), frame.size.width, frame.size.height))
    }
    
    override func update(_ currentTime: TimeInterval) {
        if joystickIsActive{
            player.position = CGPointMake(player.position.x + (playerVelocityX * 4), player.position.y + (playerVelocityY * 4))
        }
        player.normalEnginePlayerIsHidden(joystickIsActive)
        player.turboEnginePlayerIsHidden(!joystickIsActive)
        
    }
    
    func endGame(isWin: Bool){
        let transition = SKTransition.crossFade(withDuration: SceneTraits.animation )
        let gameScene = GameOverScene(size: self.size, win: isWin)
        view?.presentScene(gameScene, transition: transition)
        
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
