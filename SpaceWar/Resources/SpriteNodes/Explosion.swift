//
//  Explosion.swift
//  SpaceWar
//
//  Created by Brandon Grande on 30/05/24.
//

import SpriteKit

final class Explosion: SKSpriteNode{
    
    init(size: CGSize){
        super.init(texture:nil, color: .clear, size:size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func explosion(texture: String, in position: CGPoint, completion: (()->Void)?=nil){
        zPosition = 1
        let animatedAtlas = SKTextureAtlas(named: texture)
        let numImages = animatedAtlas.textureNames.count
        
        var explosion = SKSpriteNode()
        var frames : [SKTexture] = []
        
        for i in 1...numImages{
            let textureName = String(format: Constants.Textures.texture, i)
            frames.append(animatedAtlas.textureNamed(textureName))
        }
        
        let firstFrameTexture = frames[0]
        explosion = SKSpriteNode(texture: firstFrameTexture)
        explosion.position = position
        addChild(explosion)
        
        explosion.run(SKAction.animate(with: frames, timePerFrame: 0.1, resize: false, restore: true)){
            explosion.removeFromParent()
            completion?()
        }
        
        
    }
}
