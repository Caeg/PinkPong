//
//  MenuVC.swift
//  PinkPong
//
//  Created by Christian Caeg on 5/23/2018
//


import Foundation
import UIKit

enum gameType {
    case computer
    case player2
}

class MenuVC : UIViewController {
    
    
    @IBAction func Player2(_ sender: Any) {
        moveToGame(game: .player2)
    }
    
    @IBAction func Medium(_ sender: Any) {
        moveToGame(game: .computer)
        
    }
    
    func moveToGame(game : gameType) {
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType = game

        self.navigationController?.pushViewController(gameVC, animated: true)
    }
}
