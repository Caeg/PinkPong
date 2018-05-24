//
//  GameScene.swift
//  PinkPong
//
//  Created by Christian Caeg on 5/23/2018
//


import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    
    var ball = SKSpriteNode()
    var main = SKSpriteNode()
    var enemy = SKSpriteNode()
    var score = [Int]()
    var TopLabel = SKLabelNode()
    var BottomLabel = SKLabelNode()
    
    
    override func didMove(to view: SKView)
    {
        startGame()
        
        TopLabel = self.childNode(withName: "TopLabel") as! SKLabelNode
        BottomLabel = self.childNode(withName: "BottomLabel") as! SKLabelNode
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        main = self.childNode(withName: "main") as! SKSpriteNode
        main.position.y = (-self.frame.height / 2) + 50
        
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        enemy.position.y = (self.frame.height / 2) - 50
        
        ball.physicsBody?.applyImpulse(CGVector(dx : 10, dy: 10))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
        
        
    }
    
    func startGame()
    {
        score = [0,0]
        TopLabel.text = "\(score[1])"
        BottomLabel.text = "\(score[0])"
        ball.physicsBody?.applyImpulse(CGVector(dx: 10 , dy: 10))
    }
    
    func addScore(PlayerWhoWon : SKSpriteNode)
    {
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if PlayerWhoWon == main
        {
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx : 10, dy: 10))
        }
            
        else if PlayerWhoWon == enemy{
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx : -10, dy: -10))
        }
        
        TopLabel.text = "\(score[1])"
        BottomLabel.text = "\(score[0])"
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if currentGameType == .player2 {
                if location.y > 0 {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y < 0 {
                    
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                    
                }
                
            }
            else{
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if currentGameType == .player2 {
                if location.y > 0 {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y < 0 {
                    
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                    
                }
                
            }
            else{
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
        switch currentGameType {
        case .computer:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
            break
        case .player2:
            
            break
        }
        
    
        if ball.position.y <= main.position.y - 30 {
            addScore(PlayerWhoWon: enemy)
        }
        else if ball.position.y >= enemy.position.y + 30 {
            addScore(PlayerWhoWon: main)
        }
    }
}
