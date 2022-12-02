//
//  GameOverScene.swift
//  DogChase
//
//  Created by CIS 280 on 11/29/22.
//

import Foundation
import SpriteKit
import SwiftUI

class GameOverScene: SKScene {
    let gameOver: Bool
    
    init(size:CGSize, gameOver: Bool) {
        self.gameOver = gameOver
        super.init(size: size)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        var background: SKSpriteNode
        if(gameOver) {
            background = SKSpriteNode(imageNamed: "gameOver")
            run(SKAction.wait(forDuration: 0.3))
        }
        let wait = SKAction.wait(forDuration: 3.0)
        let block = SKAction.run {
            let nextScene = GameScene(size: self.size)
            nextScene.scaleMode = self.scaleMode
            self.view?.presentScene(nextScene)
        }
        
        self.run(SKAction.sequence([wait, block]))
    }
    
}
