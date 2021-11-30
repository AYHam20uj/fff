//
//  search.swift
//  final
//
//  Created by Ayham on 2021-11-29.
//

import SwiftUI
struct SearchView: View {
    var engine : EngineModel
    @State var games : [GameModel] = []
    var body: some View {
        List{

            ForEach(games){game in
                HStack{
                    ImageView(stringUrl: game.thumbnail,isIcon: true)
                    Text(game.title)
                }
            }
            Button {
                
                engine.AddGames()
                games=engine.games
            } label: {
                Text("See More")
            }
            
        }
        .onAppear(perform: {
            games=engine.getgames ?? []
        })
        
        
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(engine : EngineModel())
    }
}
