import Foundation

class Game {
    let players: [Player]
    
    init(_ firstPlayer: Player, _ secondPlayer: Player) {
        self.players = [firstPlayer, secondPlayer]
    }
    
    func scorePoint(){
        let playerIndex = Int(arc4random_uniform(2))
        print("playerIndex: \(playerIndex)")
        let player = players[playerIndex]
        if player.points == 3 {
            player.winner = true
        } else {
            player.addPoint()
        }
        
    }
    
    func getScore() -> [Int] {
        return [players[0].points, players[1].points]
    }
}
