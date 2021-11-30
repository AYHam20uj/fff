//
//  EngineModel.swift
//  final
//
//  Created by Ayham on 2021-11-30.
//

//
//  EngineModel.swift
//  final
//
//  Created by Ayham on 2021-11-29.
//

import Foundation
import Combine
// The following 24 lines of code was added by courtesy of Garrit Schaap
class EngineModel: ObservableObject {
    
    private var cancellableTask: AnyCancellable?
    private var anyCancellable: AnyCancellable?
    
    @Published var gameSet: [GameModel]?
    @Published var isLoading = false
    @Published var games : [GameModel] = []

    var start = 0
    var limit = 10
    let remote: Remote<[GameModel]>

    func AddGames(){
        if let gameSet = remote.data {
            let size = gameSet.count
            for i in (start..<limit+start){
                if i < size {
                    games.append(gameSet[i])
                }
            }
            start = limit+start
        }
    }
    
    var getgames: [GameModel]? {
        if let gameSet = remote.data {
            let size = gameSet.count
            for i in (start..<limit+start){
                if i < size {
                    games.append(gameSet[i])
                }
            }
            limit += 10
            return games
        } else {
            return nil
        }
    }
    
    init() {
        remote = Remote(url: URL(string: "https://www.mmobomb.com/api1/games")!)
        anyCancellable = remote.objectWillChange.sink(receiveValue: { [weak self] in
            self?.objectWillChange.send()
        })
    }
}
