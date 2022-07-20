//
//  ContentView.swift
//  A Simple Game of War
//
//  Created by Peter Sekesan on 7/20/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    
    
    var body: some View {
        
        ZStack{
            Image("background")
                .resizable(resizingMode: .stretch)
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack{
                Spacer()
                Image("WAR")
                
                
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    
                    //Generate random number between 2 and 14
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    //update cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    //update score
                    
                    if playerRand > cpuRand {
                        playerScore += 1
                    } else if cpuRand > playerRand {
                        cpuScore += 1
                        
                    }
                    
                    
                    
                }, label: {
                    Image("DEAL")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                })
                
                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Button {
                    cpuScore = 0
                    playerScore = 0
                    
                } label: {
                    Image("reset")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                }.padding()
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
