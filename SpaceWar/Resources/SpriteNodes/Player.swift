//
//  Player.swift
//  SpaceWar
//
//  Created by Brandon Grande on 27/05/24.
//

import SpriteKit

final class Player : SKSpriteNode{
    
    init(){
        super.init(texture: nil, color: .clear, size: .zero)
    }
    
    init(texture: SKTexture, size: CGSize, position: CGPoint){
        super.init(texture: texture, color: .clear, size: size)
        setup(with: position)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(with position: CGPoint){
        zPosition = 1
        self.position = position
    }
    
    func addNormalEnginefire(with texture: String){
        let adnimatedAtlas = SKTextureAtlas(named: texture)
        let numImages = adnimatedAtlas.textureNames.count
        
        var frames : [SKTexture] = []
        
        for i in 1...numImages{
            let textureName = String(format: Constants.Textures.texture, i)
            frames.append(adnimatedAtlas.textureNamed(textureName))
        }
        
        let firstFrameTexture = frames[0]
        let normalPlayer = SKSpriteNode(texture:firstFrameTexture)
        
        normalPlayer.position = CGPoint(x: (-size.width/2) - 10.0 , y: 0.0)
        
        addChild(normalPlayer)
        
        normalPlayer.run(SKAction.repeatForever(SKAction.animate(with: frames, timePerFrame: 0.1, resize: false, restore: true)))
    }
    
    func addTurboEnginefire(with texture: String){
        let adnimatedAtlas = SKTextureAtlas(named: texture)
        let numImages = adnimatedAtlas.textureNames.count
        
        var frames : [SKTexture] = []
        
        for i in 1...numImages{
            let textureName = String(format: Constants.Textures.texture, i)
            frames.append(adnimatedAtlas.textureNamed(textureName))
        }
        
        let firstFrameTexture = frames[0]
        let normalPlayer = SKSpriteNode(texture:firstFrameTexture)
        
        normalPlayer.position = CGPoint(x: (-size.width/2) - 10.0 , y: 0.0)
        
        addChild(normalPlayer)
        
        normalPlayer.run(SKAction.repeatForever(SKAction.animate(with: frames, timePerFrame: 0.1, resize: false, restore: true)))
    }
}
