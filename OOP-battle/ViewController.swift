//
//  ViewController.swift
//  OOP-battle
//
//  Created by Nikema Prophet on 3/7/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UpdateLbl: UILabel!
    @IBOutlet weak var player1Img: UIImageView!
    @IBOutlet weak var player2Img: UIImageView!
    @IBOutlet weak var player1HP: UILabel!
    @IBOutlet weak var player2HP: UILabel!
    @IBOutlet weak var player2AttackBtn: UIButton!
    @IBOutlet weak var player1AttackBtn: UIButton!
    
    var game: GameController!
    var player1: Player!
    var player2: Player!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        game = GameController()
        player1 = Player(name: "Green Face", startingHp: 300, attackPwr: 10, player: 1)
        player2 = Player(name: "Golden Pants", startingHp: 300, attackPwr: 10, player: 2)
        
        game.startGame()
        
        
    }

    @IBAction func onAttackBtnPressed(sender: AnyObject) {
        if sender.tag == 1 {
            attack(1)
        } else {
            attack(2)
        }
    }
    func enableAttackBtn() {
        
            player2AttackBtn.enabled = true
            player1AttackBtn.enabled = true
        
    }
    
    func attack(player: Int) {
        if player == 1 {
            game.attackSound(player)
            player2.takeAttackDmg(player1.attackPwr)
            player2HP.text = "\(player2.hp) HP"
            UpdateLbl.text = "\(player1.name) attacked!"
            player2AttackBtn.enabled = false
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "enableAttackBtn", userInfo:nil, repeats: false)
        } else {
            game.attackSound(player)
            player1.takeAttackDmg(player2.attackPwr)
            player1HP.text = "\(player1.hp) HP"
            UpdateLbl.text = "\(player2.name) attacked!"
            player1AttackBtn.enabled = false
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "enableAttackBtn", userInfo: nil, repeats: false)
        }
   }
}
