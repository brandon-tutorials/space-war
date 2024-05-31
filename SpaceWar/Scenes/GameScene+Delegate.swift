//
//  GameScene+Delegate.swift
//  SpaceWar
//
//  Created by Brandon Grande on 29/05/24.
//

import SpriteKit

extension GameScene: SKPhysicsContactDelegate{
    
    func didBegin(_ contact: SKPhysicsContact){
        let firstBody = contact.bodyA
        let secondBody = contact.bodyB
        
        if firstBody.categoryBitMask == PhysicsCategory.enemy && secondBody.categoryBitMask == PhysicsCategory.playerProjectile
        {
            if let enemy = firstBody.node as? SKSpriteNode, let playerProjectile = secondBody.node as? SKSpriteNode{
                enemyDidCollideWithPlayerShot(enemy: enemy, playerProjectile: playerProjectile)
            }
        }else if firstBody.categoryBitMask == PhysicsCategory.playerProjectile && secondBody.categoryBitMask == PhysicsCategory.enemy{
            if let playerProjectile = firstBody.node as? SKSpriteNode, let enemy = secondBody.node as? SKSpriteNode{
                playerShotDidCollideWithEnemy(playerProjectile: playerProjectile, enemy: enemy)
            }
        }
        else if firstBody.categoryBitMask == PhysicsCategory.enemy && secondBody.categoryBitMask == PhysicsCategory.player {
            if let enemy = firstBody.node as? SKSpriteNode, let player = secondBody.node as? SKSpriteNode{
                enemyDidCollideWithPlayer(enemy: enemy, player: player)
            }
        } else if firstBody.categoryBitMask == PhysicsCategory.player && secondBody.categoryBitMask == PhysicsCategory.enemy{
            if let player = firstBody.node as? SKSpriteNode, let enemy = secondBody.node as? SKSpriteNode{
                playerDidCollideWithEnemy(player: player, enemy: enemy)
            }
        }else if firstBody.categoryBitMask == PhysicsCategory.player && secondBody.categoryBitMask == PhysicsCategory.enemyProjectile {
            if let player = firstBody.node as? SKSpriteNode, let enemyProjectile = secondBody.node as? SKSpriteNode{
                playerDidCollideWithEnemyShot(player: player, enemyShot: enemyProjectile)
            }
        }else if  firstBody.categoryBitMask == PhysicsCategory.enemyProjectile && secondBody.categoryBitMask == PhysicsCategory.player{
            if let enemyProjectile = firstBody.node as? SKSpriteNode, let player = secondBody.node as? SKSpriteNode{
                enemyShotDidCollideWithPlayer(enemyShot: enemyProjectile, player: player)
            }
        }
    }

    func didEnd(_ contact: SKPhysicsContact){}
    
}
