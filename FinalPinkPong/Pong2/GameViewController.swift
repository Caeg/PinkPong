//
//  GameViewController.swift
//  Pong2
//
//  Created by Christian Caeg on 4/21/18.
//  Copyright © 2018 Christian Caeg. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


var currentGameType = gameType.computer


class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
           
            if let scene = SKScene(fileNamed: "GameScene") {
                
                scene.scaleMode = .aspectFill
                
                scene.size = view.bounds.size
                
               
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
