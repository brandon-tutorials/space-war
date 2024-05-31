//
//  Shot.swift
//  SpaceWar
//
//  Created by Brandon Grande on 27/05/24.
//

import SpriteKit

enum ShotDirection{
    case righToLeft
    case leftToRight
}

enum SpriteType {
    case enemy
    case player
}

final class Shot: SKSpriteNode{
    
    private var shotDirection: ShotDirection = .leftToRight
    
    init(texture:SKTexture, position: CGPoint, shotDirection: ShotDirection, spriteType: SpriteType){
        super.init(texture: texture, color: .clear, size: texture.size())
        setup(texture: texture, position: position, shotDirection: shotDirection, spriteType: spriteType)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(texture:SKTexture, position: CGPoint, shotDirection: ShotDirection, spriteType: SpriteType){
        self.position = position
        self.texture = texture
        self.shotDirection = shotDirection
        setScale(2.0)
        physicsBody?.isDynamic = true
        physicsBody?.usesPreciseCollisionDetection = true
        switch spriteType {
        case .enemy:
            physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
            physicsBody?.categoryBitMask = PhysicsCategory.enemyProjectile //Indicamos que es la fisica del projectile del enemigo
            physicsBody?.contactTestBitMask = PhysicsCategory.player // Nos notifique cuando toque a la fisica del jugador
            physicsBody?.collisionBitMask = PhysicsCategory.none // Que no interacture con la fisica de los demas nodos (que no los mueva)
            break
        case .player:
            physicsBody = SKPhysicsBody(rectangleOf: size)
            physicsBody?.categoryBitMask = PhysicsCategory.playerProjectile
            physicsBody?.contactTestBitMask = PhysicsCategory.enemy
            physicsBody?.collisionBitMask = PhysicsCategory.all
            break
        }
        
    }
    
    func movement(){
        let direction = CGVector(dx: shotDirection == .leftToRight ? 1.0 : -1.0, dy: 0.0)
        let distance: CGFloat = 750
        let action = SKAction.moveBy(x: direction.dx * distance, y: direction.dy * distance, duration: 1.0)
        let remove = SKAction.removeFromParent()
        
        run(SKAction.sequence([action,remove]))
    }
}
