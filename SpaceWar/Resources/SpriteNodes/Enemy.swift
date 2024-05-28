//
//  Enemy.swift
//  SpaceWar
//
//  Created by Brandon Grande on 27/05/24.
//

import SpriteKit

final class Enemy: SKSpriteNode{
    
    init(){
        super.init(texture: nil, color: .clear, size: .zero)
    }
    
    init(texture: SKTexture){
        super.init(texture: texture, color: .clear, size: texture.size())
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        zPosition = 1
    }
    
    func movement(){
        let duration = CGFloat.random(in: 3...6)
        let moveAction = SKAction.moveTo(x: -size.width, duration: duration)
        let removeAction = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction,removeAction])
        run(sequence)
    }
    
    func addEnginefire(with texture: String){
        let adnimatedAtlas = SKTextureAtlas(named: texture)
        let numImages = adnimatedAtlas.textureNames.count
        
        var frames : [SKTexture] = []
        
        for i in 1...numImages{
            let textureName = String(format: Constants.Textures.texture, i)
            frames.append(adnimatedAtlas.textureNamed(textureName))
        }
        
        let firstFrameTexture = frames[0]
        let turboEnemy = SKSpriteNode(texture:firstFrameTexture)
        turboEnemy.position = CGPoint(x: size.width / 2, y: 0.0)
        
        addChild(turboEnemy)
        
        turboEnemy.run(SKAction.repeatForever(SKAction.animate(with: frames, timePerFrame: 0.1, resize: false, restore: true)))
    }
    
    func shot(){
        let shotDelay = SKAction.wait(forDuration: 1.5)
        let shotAction = SKAction.run {
            let texture = SKTexture(imageNamed: Constants.Images.enemyShot)
            let shot = Shot(texture:texture, position: CGPoint(x:-50.0, y:0.0),type: .righToLeft)
            shot.movement()
            self.addChild(shot)
        }
        let shotSequence = SKAction.sequence([shotDelay,shotAction])
        let shotForever = SKAction.repeatForever(shotSequence)
        run(shotForever)
    }
}
