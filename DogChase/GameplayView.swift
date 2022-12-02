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
    
    var lives = 1
    var playerDead = false

    let dogTexture1 = SKTexture(imageNamed: "DogAnimation1");
    let dogTexture2 = SKTexture(imageNamed: "DogAnimation2");
    let dogTexture3 = SKTexture(imageNamed: "DogAnimation3");
    let dogTexture4 = SKTexture(imageNamed: "DogAnimation4");
    let dog:SKSpriteNode = SKSpriteNode(imageNamed: "DogAnimation1");
    
    let boneTexture = SKTexture(imageNamed: "bone-1");
    let bone:SKSpriteNode = SKSpriteNode(imageNamed: "bone-1");
    
    let officerTexture1 = SKTexture(imageNamed: "OfficerAnimation1");
    let officerTexture2 = SKTexture(imageNamed: "OfficerAnimation2");
    let officerTexture3 = SKTexture(imageNamed: "OfficerAnimation3");
    let officerTexture4 = SKTexture(imageNamed: "OfficerAnimation4");
    let officer:SKSpriteNode = SKSpriteNode(imageNamed: "OfficerAnimation1");
    
    
    override func didEvaluateActions() {
        checkCollision()
    }
    
    func checkCollision () {
        var hitBones: [SKSpriteNode] = []
        enumerateChildNodes(withName: "Bone") {node, _ in
            let bone = node as! SKSpriteNode
            if bone.frame.intersects(self.dog.frame) {
                hitBones.append(bone)
            }
            
        }
        for bone in hitBones {
            print("Hit a bone")
            dogHitBone(bone: bone)
        }
        
        var hitOfficer: [SKSpriteNode] = []
        enumerateChildNodes(withName: "Officer") {node, _ in
            let officer = node as! SKSpriteNode
            if officer.frame.intersects(self.dog.frame) {
                hitOfficer.append(officer)
            }
        }
        
        for officer in hitOfficer {
            print("Hit an Officer")
            dogHitOfficer(officer: officer)
        }
    }
    
    func dogHitBone(bone: SKSpriteNode) {
        bone.removeFromParent()
    }
    
    func dogHitOfficer(officer: SKSpriteNode) {
        officer.removeFromParent()
        lives-=1
        
        if lives <= 0 && !playerDead {
            playerDead = true
        }
        
        let gameOverScene = GameOverScene(size: size, gameOver: false)
        gameOverScene.scaleMode = scaleMode
        
        var background = SKSpriteNode(imageNamed: "gameOver");
        
        view?.presentScene(gameOverScene)
    }
    
    func spawnBone() {
        let bone = SKSpriteNode(imageNamed: "bone-1")
        bone.position = CGPoint (x: CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width))), y: UIScreen.main.bounds.height)
        addChild(bone)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {return}
        let location = touch.location(in: self);
        dog.run(SKAction.move(to: location, duration: 1));
        
    }
    
    override func sceneDidLoad() {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        let textures:Array<SKTexture> =
        [dogTexture1, dogTexture2, dogTexture3, dogTexture4];
        
        dog.texture = dogTexture1;
        dog.position = CGPoint(x:200, y:200);
        dog.zPosition = 1;
        dog.name = "Name"
        addChild(dog);
        dog.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1)));
        
        bone.texture = boneTexture;
        bone.size = bone.texture!.size()
        bone.position = CGPoint(x:400, y:400);
        bone.zPosition = 1;
        bone.name = "Bone";
        addChild(bone);
    
        
        let textures2:Array<SKTexture> =
        [officerTexture1, officerTexture2, officerTexture3, officerTexture4];
        
        officer.texture = officerTexture1;
        officer.position = CGPoint(x:600, y:600);
        officer.zPosition = 1;
        officer.name = "Officer"
        addChild(officer);
        officer.run(SKAction.repeatForever(SKAction.animate(with: textures2, timePerFrame: 0.2)));
        
//        if lives <= 0 && !playerDead {
//            playerDead = true
//        }
//
//        let gameOverScene = GameOverScene(size: size, gameOver: false)
//        gameOverScene.scaleMode = scaleMode
//
//        view?.presentScene(gameOverScene)
    }
    
    var background = SKSpriteNode(imageNamed: "yard background");
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
//        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
//        addChild(background)
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(spawnBone), SKAction.wait(forDuration: 3.0)])))
        
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
