// Playground - noun: a place where people can play

import UIKit

//Peer programming game
class player {
    var name: String
    var attackPower: Int=10
    var health: Int = 100
    
    init (playerName: String){
        self.name = playerName
        self.attackPower = 5
    }
    func Attack() ->Int{
        return self.attackPower
    }
    func takeDamage(attackPower: Int){
        self.health -= attackPower
    }
    
    func isAlive() -> Bool {
        return self.health > 0
    }
}
class goodPlayer : player {
    override init(playerName: String) {
        super.init(playerName: playerName)
        self.attackPower = 10
}
class badPlayer : player{
    override init(playerName: String) {
        super.init(playerName: playerName)
        self.attackPower = 2
}
class Match {
    var player1: player
    var player2: player
    
    init(player1: player, player2: player){
        self.player1 = player1
        self.player2 = player2
    }
    
    func playGame() -> String {
        var attackPower: Int
        while goodPlayer.isAlive() && badPlayer.isAlive() {
            attackPower = badPlayer.attackPower()
            badPlayer.takeDamage(attackPower)
        }
        if goodPlayer.isAlive() {
            return goodPlayer.name
        } else {
            return badPlayer.name
        }
    }
}
//create names
var a = goodPlayer(name:"Megan")
var b = badPlayer(name: "Mike")var round1 = Match(goodPlayer: a, badPlayer: b)println(round1.playGame())
