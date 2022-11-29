//
//  GameplayView.swift
//  DogChase
//
//  Created by CIS 280 on 11/4/22.
//
import SwiftUI
import Foundation
import SpriteKit

class GameScene:SKScene {

    override func sceneDidLoad() {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        let dogTexture1 = SKTexture(imageNamed: "DogAnimation1");
        let dogTexture2 = SKTexture(imageNamed: "DogAnimation2");
        let dogTexture3 = SKTexture(imageNamed: "DogAnimation3");
        let dogTexture4 = SKTexture(imageNamed: "DogAnimation4");
        let textures:Array<SKTexture> =
        [dogTexture1, dogTexture2, dogTexture3, dogTexture4];
        
        let dog:SKSpriteNode = SKSpriteNode(imageNamed: "DogAnimation1");
        dog.texture = dogTexture1;
        dog.position = CGPoint(x:200, y:200);
        addChild(dog);
        dog.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1)));
        
        let officerTexture1 = SKTexture(imageNamed: "OfficerAnimation1");
        let officerTexture2 = SKTexture(imageNamed: "OfficerAnimation2");
        let officerTexture3 = SKTexture(imageNamed: "OfficerAnimation3");
        let officerTexture4 = SKTexture(imageNamed: "OfficerAnimation4");
        let textures2:Array<SKTexture> =
        [officerTexture1, officerTexture2, officerTexture3, officerTexture4];
        
        let officer:SKSpriteNode = SKSpriteNode(imageNamed: "OfficerAnimation1");
        officer.texture = officerTexture1;
        officer.position = CGPoint(x:600, y:600);
        addChild(officer);
        officer.run(SKAction.repeatForever(SKAction.animate(with: textures2, timePerFrame: 0.2)));
        
    }
    
    var background = SKSpriteNode(imageNamed: "yard background");
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
//        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
//        addChild(background)
        
        DispatchQueue.main.async {
            self.background.zPosition = 0
            self.background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
            self.background.size = CGSize(width: self.size.width, height: self.size.height)
            self.addChild(self.background)
        }
        
    }
}

struct GameplayView: View {
    @EnvironmentObject var gameState:GameState;
    var scene:SKScene {
        let scene = GameScene();
        scene.scaleMode = .resizeFill;
        return scene;
    }
    var body: some View {
        VStack {
            SpriteView(scene: scene)
        }
        }
    }
