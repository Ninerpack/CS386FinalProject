//
//  Model.swift
//  1010
//
//  Created by Spencer Conley on 4/29/21.
//

import Foundation

struct tenTenModel{
    var gameBoard: [[gameSqr]] = []
    
    struct gameSqr: Identifiable{
        var id: Int
        var colorM: Int
    }
    
    mutating func createGameBoard(){
        var id = 0
        for i in 0...9{
            gameBoard.append([])
            for _ in 0...9{
                gameBoard[i].append(gameSqr(id: id, colorM: 0))
                id += 1
            }
        }
    }
    
}
