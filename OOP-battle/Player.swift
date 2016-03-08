//
//  Player.swift
//  OOP-battle
//
//  Created by Nikema Prophet on 3/8/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//

import Foundation

class Player {
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    private var _name: String = ""
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(name: String, startingHp: Int, attackPwr: Int) {
        self._name = name
        self._hp = startingHp
        self._attackPwr = attackPwr
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {
        let randomNum = Int(arc4random_uniform(25))
        self._hp -= attackPwr + randomNum
        return true
    }
}