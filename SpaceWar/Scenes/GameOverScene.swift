//
//  GameOverScene.swift
//  SpaceWar
//
//  Created by Brandon Grande on 30/05/24.
//

import SpriteKit
import GameplayKit

class GameOverScene: ParentScene {
    private struct SceneTraits{
        static let titleFontSize : CGFloat = 60
        static let alpha: CGFloat = 0.4
        static let animation: CGFloat = 0.25
    }
    
    private var win = false
    
    init(size: CGSize, win: Bool){
        super.init(size: size)
        self.win = win
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        createBackground()
        createTitleLabel()
        presentMainScene()
        createScoreLabel()
        
    }
    private func createTitleLabel(){
        let text = win ?  NSLocalizedString("game.win", comment: "") : NSLocalizedString("game.over", comment: "")
        let titleLabel = SKLabelNode(text: text)
        titleLabel.fontSize = SceneTraits.titleFontSize
        titleLabel.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(titleLabel)
    }
    
    private func createBackground(){
        guard let image = UIImage(named: Constants.Images.background),
            let scene else {
                return
            }
        let texture = SKTexture(image: image)
        let background = Background(texture: texture, size: scene.frame.size, position: CGPoint(x: scene.frame.midX, y: scene.frame.midY), alpha: SceneTraits.alpha)
        
        addChild(background)
    }
    
    private func presentMainScene(){
        run(SKAction.sequence([
            SKAction.wait(forDuration: 3),
            SKAction.run {
                [weak self] in
                guard let self else {
                    return
                }
                let transition = SKTransition.crossFade(withDuration: SceneTraits.animation )
                let menuMainScene = MainMenuScene(size: self.size)
                self.view?.presentScene(menuMainScene, transition: transition)
                ScoreManager.saveScore(score: 0)
            }
        ]))
    }
}
