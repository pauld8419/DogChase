//
//  GameOverScene.swift
//  DogChase
//
//  Created by CIS 280 on 11/29/22.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    let won: Bool
    
    init(size:CGSize, won: Bool) {
        self.won = won
        super.init(size: size)
    }
    
    required init(coder aDecoder: NSCoder)
}
