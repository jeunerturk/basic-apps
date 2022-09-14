//
//  ContentView.swift
//  WarCardGame
//
//  Created by Umut Can Ertürk on 11.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private  var playerCard = "card14"
    @State private  var cpuCard = "card14"
    @State private  var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button {
                    let playerRandom = Int.random(in: 2...14)
                    let cpuRandom = Int.random(in: 2...14)
                    playerCard = "card\(playerRandom)"
                    cpuCard = "card\(cpuRandom)"
                    
                    if playerRandom > cpuRandom{
                         playerScore += 1
                    } else if cpuRandom > playerRandom {
                        cpuScore += 1
                    }
                } label: {
                    Image("dealbutton")
                }

                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
            }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
