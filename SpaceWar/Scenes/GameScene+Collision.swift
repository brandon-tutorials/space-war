//
//  GameScene+Collision.swift
//  SpaceWar
//
//  Created by Brandon Grande on 30/05/24.
//

import SpriteKit

extension GameScene {
    func enemyDidCollideWithPlayerShot(enemy: SKSpriteNode, playerProjectile: SKSpriteNode){
        playerShotAndEnemy(enemy: enemy, playerProjectile: playerProjectile)
    }
    func playerShotDidCollideWithEnemy(playerProjectile: SKSpriteNode, enemy: SKSpriteNode){
        playerShotAndEnemy(enemy: enemy, playerProjectile: playerProjectile)
    }
    func playerDidCollideWithEnemy(player: SKSpriteNode, enemy: SKSpriteNode){
        enemyAndPlayer(enemy: enemy, player: player)
    }
    func enemyDidCollideWithPlayer(enemy: SKSpriteNode, player:SKSpriteNode){
        enemyAndPlayer(enemy: enemy, player: player)
    }
    func enemyShotDidCollideWithPlayer(enemyShot: SKSpriteNode, player: SKSpriteNode){
        playerAndEnemyShot(player: player, enemyShot: enemyShot)
    }
    func playerDidCollideWithEnemyShot(player: SKSpriteNode, enemyShot: SKSpriteNode){
        playerAndEnemyShot(player: player, enemyShot: enemyShot)
    }
    private func playerShotAndEnemy(enemy: SKSpriteNode, playerProjectile: SKSpriteNode){
        let enemyExplosion = Explosion(size: enemy.size)
        switch enemy.name {
        case Nodes.asteroid.rawValue:
            enemiesDestroyed += 1
            enemyExplosion.explosion(texture: Constants.Textures.explosion, in: enemy.position)
        
        case Nodes.enemy.rawValue:
            enemiesDestroyed += 2
            enemyExplosion.explosion(texture: Constants.Textures.enemyExplosion, in: enemy.position)
        default:
            break
        }
        addChild(enemyExplosion)
        enemy.removeFromParent()
        playerProjectile.removeFromParent()
    }
    private func enemyAndPlayer(enemy: SKSpriteNode, player: SKSpriteNode){
        let enemyExplosion = Explosion(size: enemy.size)
        switch enemy.name {
        case Nodes.asteroid.rawValue:
            enemyExplosion.explosion(texture: Constants.Textures.explosion, in: enemy.position)
        
        case Nodes.enemy.rawValue:
            enemyExplosion.explosion(texture: Constants.Textures.enemyExplosion, in: enemy.position)
        default:
            break
        }
        let playerExplosion = Explosion(size: player.size)
        playerExplosion.explosion(texture: Constants.Textures.playerExplosion, in: player.position){
            self.endGame(isWin: false)
        }
        addChild(enemyExplosion)
        addChild(playerExplosion)
        enemy.removeFromParent()
        player.removeFromParent()
    }
    private func playerAndEnemyShot( player: SKSpriteNode, enemyShot: SKSpriteNode){
        let playerExplosion = Explosion(size: player.size)
        playerExplosion.explosion(texture: Constants.Textures.playerExplosion, in: player.position){
            self.endGame(isWin: false)
        }
        addChild(playerExplosion)
        player.removeFromParent()
    }
}
