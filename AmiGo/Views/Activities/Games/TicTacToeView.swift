//
//  TicTacToeView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 05/11/2024.
//

import SwiftUI

struct TicTacToeView: View {
    @State var board: [[String]] = [
        [
            "", "", ""
        ],
        [
            "", "", ""
        ],
        [
            "", "", ""
        ]
    ]
    
    @State var player: TicTacToePlayer = .playerOne
        
    var body: some View {
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            ForEach(board.indices, id: \.self) { row in
                GridRow {
                    ForEach(board[row].indices, id: \.self) { column in
                        Button {
                            board[row][column] = player.rawValue
                            player = .playerTwo
                            makeMove(board: board)
                        } label: {
                            Image(board[row][column])
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding()
                        }
                        .border(3, edges: {
                            var edges: [Edge] = []
                            if row != 0 {
                                edges.append(.top)
                            }
                            if (row != board.count - 1) {
                                edges.append(.bottom)
                            }
                            if (column != 0) {
                                edges.append(.leading)
                            }
                            if (column != board[row].count - 1) {
                                edges.append(.trailing)
                            }
                            return edges
                        }(), color: .black)
                        .disabled(!board[row][column].isEmpty || player != .playerOne)
                    }
                }.frame(width: 100, height: 100)
            }
        }
    }
    
    func isMoveLeft(board: [[String]]) -> Bool {
        for row in board {
            for col in row {
                if (col.isEmpty) {
                    return true
                }
            }
        }
        return false
    }

    func evaluateBoard(board: [[String]]) -> Int {
        var firstDiag: [String] = []
        var secondDiag: [String] = []
        
        for row in 0..<board.count {
            if (board[row].allSatisfy {
                $0 == TicTacToePlayer.playerTwo.rawValue
            }) {
                return 100
            } else if (board[row].allSatisfy {
                $0 == TicTacToePlayer.playerOne.rawValue
            }) {
                return -100
            }
            
            let colArray = board.map { $0[row] }
            if (colArray.allSatisfy {
                $0 == TicTacToePlayer.playerTwo.rawValue
            }) {
                return 100
            } else if (colArray.allSatisfy {
                $0 == TicTacToePlayer.playerOne.rawValue
            }) {
                return -100
            }
            
            firstDiag.append(board[row][row])
            secondDiag.append(board[row][board.count - row - 1])
        }
        
        if (firstDiag.allSatisfy {
            $0 == TicTacToePlayer.playerTwo.rawValue
        }) {
            return 100
        } else if (firstDiag.allSatisfy {
            $0 == TicTacToePlayer.playerOne.rawValue
        }) {
            return -100
        }
        
        if (secondDiag.allSatisfy {
            $0 == TicTacToePlayer.playerTwo.rawValue
        }) {
            return 100
        } else if (secondDiag.allSatisfy {
            $0 == TicTacToePlayer.playerOne.rawValue
        }) {
            return -100
        }
        
        return 0
    }

    func minimax(board: [[String]], depth: Int, isMax: Bool) -> Int {
        let score = evaluateBoard(board: board)
        var board = board
        
        if (score == 100) {
            return 100 - depth
        }
        
        if (score == -100) {
            return -100 + depth
        }
        
        if (!isMoveLeft(board: board)) {
            return 0
        }
        
        if (isMax) {
            var best = -1000
            for i in 0..<board.count {
                for j in 0..<board[i].count {
                    if (board[i][j] == "") {
                        board[i][j] = TicTacToePlayer.playerTwo.rawValue
                        best = max(best, minimax(board: board, depth: depth + 1, isMax: !isMax))
                        board[i][j] = ""
                    }
                }
            }
            return best
        } else {
            var best = 1000
            for i in 0..<board.count {
                for j in 0..<board[i].count {
                    if (board[i][j] == "") {
                        board[i][j] = TicTacToePlayer.playerOne.rawValue
                        best = min(best, minimax(board: board, depth: depth + 1, isMax: !isMax))
                        board[i][j] = ""
                    }
                }
            }
            return best
        }
    }
    
    func makeMove(board: [[String]]) {
        var board = board
        
        var bestVal = -1000
        var bestMove: (Int, Int) = (0, 0)
        
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if (board[i][j] == "") {
                    board[i][j] = TicTacToePlayer.playerTwo.rawValue
                    let moveVal = minimax(board: board, depth: 0, isMax: false)
                    board[i][j] = ""
                    
                    if (moveVal > bestVal) {
                        bestVal = moveVal
                        bestMove = (i, j)
                    }
                }
            }
        }
        
        print("The value of the best move is : \(bestMove)")
        print(bestVal)
        self.board[bestMove.0][bestMove.1] = TicTacToePlayer.playerTwo.rawValue
        self.player = .playerOne
    }
}

#Preview {
    TicTacToeView()
}
