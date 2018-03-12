import XCTest
@testable import TennisKata

class TennisKataTests: XCTestCase {
    let firstPlayer = Player()
    let secondPlayer = Player()
    
    override func setUp() {
        super.setUp()
    }

    func testScorePoint() {
        let game = Game(firstPlayer, secondPlayer)
        game.scorePoint()
        
        let firstPlayerScore = firstPlayer.points
        let secondPlayerScore = secondPlayer.points

        XCTAssertTrue((firstPlayerScore == 0 && secondPlayerScore == 1) || (firstPlayerScore == 1 && secondPlayerScore == 0))
    }
}
