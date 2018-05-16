//
//  GameScene.swift
//  Pong2
//
//  Created by Christian Caeg on 4/21/18.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene
{
   
    var ball = SKSpriteNode()
    var main = SKSpriteNode()
    var second = SKSpriteNode()
    
    
    var topLbl = SKLabelNode()
    var btmLbl = SKLabelNode()
    
    var score = [Int]()
    
    override func didMove(to view: SKView)
    {
 
        topLbl = self.childNode(withName: "topLabel") as! SKLabelNode
        btmLbl = self.childNode(withName: "btmLabel") as! SKLabelNode
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        
        print(self.view?.bounds.height)
        
        second = self.childNode(withName: "second") as! SKSpriteNode
        second.position.y = (self.frame.height / 2) - 50
        
        main = self.childNode(withName: "main") as! SKSpriteNode
        main.position.y = (-self.frame.height / 2) + 50
        
        let border  = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
        startGame()
    }
    
    func startGame()
    {
        score = [0,0]
        topLbl.text = "\(score[1])"
        btmLbl.text = "\(score[0])"
        ball.physicsBody?.applyImpulse(CGVector(dx: 10 , dy: 10))
    }

    func addScore(playerWhoWon : SKSpriteNode)
    {
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if playerWhoWon == main
        {
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))
        }
        else if playerWhoWon == second
        {
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -10, dy: -10))
        }
        
        topLbl.text = "\(score[1])"
        btmLbl.text = "\(score[0])"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        for touch in touches
        {
            let location = touch.location(in: self)
            
            if currentGameType == .player2
            {
                if location.y > 0
                {
                    second.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y < 0
                {
                    
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                    
                }
                
            }
            else
            {
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }

            
        }
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let location = touch.location(in: self)
            
            if currentGameType == .player2
            {
                if location.y > 0
                {
                    second.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y < 0
                {
                    
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                    
                }

            }
            else
            {
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
        }
    }
    
    override func update(_ currentTime: TimeInterval)
    {
    
        
        switch currentGameType
        {
        case .computer:
            second.run(SKAction.moveTo(x: ball.position.x, duration: 1.3))
            break
        case .player2:
            
            break
        }
        
        
        
        if ball.position.y <= main.position.y - 30
        {
            addScore(playerWhoWon: second)
        }
        else if ball.position.y >= second.position.y + 30
        {
            addScore(playerWhoWon: main)
        }
    }
}







