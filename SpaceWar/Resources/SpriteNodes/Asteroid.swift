//
//  Asteroid.swift
//  SpaceWar
//
//  Created by Brandon Grande on 27/05/24.
//

import SpriteKit

final class Asteroid: SKSpriteNode{
    
    init(texture: SKTexture, position: CGPoint){
        super.init(texture: texture, color: .clear, size: texture.size())
        setup(with: position)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(with position: CGPoint){
        zPosition = 1
        self.position = position
        rotate()
    }
    
    private func rotate(){
        let rotationAction = SKAction.rotate(byAngle: .pi, duration: 2.0)
        let repeatRotateAction = SKAction.repeatForever(rotationAction)
        run(repeatRotateAction)
        
        let duration = CGFloat.random(in: CGFloat(3.0)...CGFloat(5.0))
        let actionMove = SKAction.move(to: CGPoint(x: -size.width / 2 , y: position.y), duration: duration)
        let actionModeDone = SKAction.removeFromParent()
        
        run(SKAction.sequence([actionMove,actionModeDone]))
    }
}
