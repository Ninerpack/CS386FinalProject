//
//  viewModel.swift
//  1010
//
//  Created by Spencer Conley on 4/29/21.
//

import Foundation
class tenTenViewModel:ObservableObject
{
    init(){
       createGame()
    }
    @Published var Model = tenTenModel()
    func createGame(){
        Model.createGameBoard()
}
}
