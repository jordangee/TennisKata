import Foundation

class Game {
    let players: [Player]
    
    init(_ firstPlayer: Player, _ secondPlayer: Player) {
        self.players = [firstPlayer, secondPlayer]
    }
    
    func scorePoint() {
        let playerIndex = Int(arc4random_uniform(2))
        players[playerIndex].addPoint()
    }
    
    func getScore() -> [Int] {
        return [players[0].points, players[1].points]
    }
}
