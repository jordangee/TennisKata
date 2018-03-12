import Foundation

class Game {
    let players: [Player]
    
    init(_ firstPlayer: Player, _ secondPlayer: Player) {
        self.players = [firstPlayer, secondPlayer]
    }
    
    func scorePoint(){
        let playerIndex = Int(arc4random_uniform(2))
        print("point to player: \(playerIndex + 1)")
        print("current score is: 1: \(players[0].points), 2: \(players[1].points)")
        
        let player = players[playerIndex]
        player.addPoint()
        if (player.points >= 3) && (abs(players[0].points - players[1].points) > 1) {
            player.winner = true
        }
        print("now the score is: 1: \(players[0].points), 2: \(players[1].points)")
        print("winner status: 1: \(players[0].winner), 2: \(players[1].winner)")
    }
    
    func getScore() -> [Int] {
        return [players[0].points, players[1].points]
    }
}
