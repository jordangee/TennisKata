import XCTest
@testable import TennisKata

class TennisKataTests: XCTestCase {
    let firstPlayer = Player()
    let secondPlayer = Player()
    
    override func setUp() {
        firstPlayer.points = 0
        secondPlayer.points = 0
        super.setUp()
    }

    func testScorePoint() {
        let game = Game(firstPlayer, secondPlayer)
        game.scorePoint()
        
        let firstPlayerScore = firstPlayer.points
        let secondPlayerScore = secondPlayer.points

        XCTAssertTrue((firstPlayerScore == 0 && secondPlayerScore == 1) || (firstPlayerScore == 1 && secondPlayerScore == 0))
    }
    
    func testGetScore() {
        let game = Game(firstPlayer, secondPlayer)
        
        var score = game.getScore()
        XCTAssert(score == [0,0])
        
        game.scorePoint()
        score = game.getScore()
        XCTAssert((score == [0,1]) || (score == [1,0]))
    }
    
    func testScorePointWhen40WinsGame() {
        let game = Game(firstPlayer, secondPlayer)
        while !firstPlayer.winner && !secondPlayer.winner {
            game.scorePoint()
        }
        if firstPlayer.winner {
            XCTAssertEqual(firstPlayer.points, 3)
            XCTAssertEqual(secondPlayer.winner, false)
        } else {
            XCTAssertEqual(secondPlayer.points, 3)
            XCTAssertEqual(firstPlayer.winner, false)
        }
    }
    
    func testScorePointWhenDeuceDoesNotWin() {
        let game = Game(firstPlayer, secondPlayer)
        firstPlayer.points = 3
        secondPlayer.points = 3
        game.scorePoint()
        let score = game.getScore()
        XCTAssert((score == [3,4]) || (score == [4,3]))
        XCTAssertEqual(firstPlayer.winner, false)
        XCTAssertEqual(secondPlayer.winner, false)
    }
    
    func testScorePointAfter40WinsByTwo() {
        let game = Game(firstPlayer, secondPlayer)
        firstPlayer.points = 3
        secondPlayer.points = 3
        
        while abs(firstPlayer.points - secondPlayer.points) < 2 {
            game.scorePoint()
        }
        
        XCTAssert(firstPlayer.winner || secondPlayer.winner)
        let firstPlayerScore = firstPlayer.points
        let secondPlayerScore = secondPlayer.points
        if firstPlayer.winner {
            XCTAssertEqual(secondPlayer.winner, false)
            XCTAssert(firstPlayerScore - secondPlayerScore > 1)
        } else {
            XCTAssertEqual(firstPlayer.winner, false)
            XCTAssert(secondPlayerScore - firstPlayerScore > 1)
        }
    }
}
