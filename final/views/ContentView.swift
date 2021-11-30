//
//  ContentView.swift
//  final
//
//  Created by Ayham on 2021-11-29.
//

import SwiftUI
import CoreData
struct ContentView: View {
    @StateObject var engine=EngineModel()
    @State var state = 0
    @State var move = false
    var body: some View {
        NavigationView{
            ZStack{
                NavigationLink(isActive: $move) {
                    if state==1{
                        SearchView(engine : engine)

                    }
                    }label: {
                        EmptyView()
                    }
                VStack{
                    Button(action: {
                        state=1
                        move=true
                    }) {
                        Text("search")
                    }
                    Button(action: {
                        
                    }) {
                        Text("rate")
                    }
                    Button(action: {
                        
                    }) {
                        Text("search")
                    }
                }
            }


        }
        .onAppear(perform: {
            engine.remote.fetch()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
