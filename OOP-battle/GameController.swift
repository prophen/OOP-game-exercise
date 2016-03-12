//
//  GameController.swift
//  OOP-battle
//
//  Created by Nikema Prophet on 3/10/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit



class GameController {
    
    
//    Sword Slash Attack Copyright 2013 Iwan Gabovitch, CC-BY3 license.
//    Blood and gore FX performance 1 Copyright 2012 Slave2theLight, CC-BY3 license.
    
    var bgMusic: AVAudioPlayer!
    var player1attack: AVAudioPlayer!
    var player2attack: AVAudioPlayer!

    
    func setupAudio() {
        
        let path = NSBundle.mainBundle().pathForResource("bgMusic", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
    
        do {
            try bgMusic = AVAudioPlayer(contentsOfURL: soundUrl)
            bgMusic.prepareToPlay()
            } catch let err as NSError {
            print(err.debugDescription)
        }
        bgMusic.numberOfLoops = -1
        bgMusic.play()
        
        let attack1path = NSBundle.mainBundle().pathForResource("melee", ofType: "mp3")
        let attack1Url = NSURL(fileURLWithPath: attack1path!)
        
        do {
            try player1attack = AVAudioPlayer(contentsOfURL: attack1Url)
            player1attack.prepareToPlay()
                } catch let err as NSError {
                print(err.debugDescription)
            }
        
        let attack2path = NSBundle.mainBundle().pathForResource("sword", ofType: "mp3")
        let attack2Url = NSURL(fileURLWithPath: attack2path!)
        
        do {
            try player2attack = AVAudioPlayer(contentsOfURL:attack2Url)
            player2attack.prepareToPlay()
            } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    func startGame(){
        self.setupAudio()
        
    }
    
    func attackSound(player: Int) {
        if player == 1 {
            player1attack.play()
        } else {
            player2attack.play()
        }
    }
    
    func gameOver(){
        bgMusic.stop()
        
        
    }
        

    }

        
            
    

    



