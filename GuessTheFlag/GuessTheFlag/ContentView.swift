//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Umut Can Ertürk on 6.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Turkey","Azerbaijan", "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...3)
    @State private var score = 0
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .blue, .indigo]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                VStack {
                    Text("Tap the flag of:")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    
                    Text("\(countries[correctAnswer])")
                        .foregroundStyle(.white)
                        .font(.largeTitle.weight(.semibold))
                    
                    HStack (spacing: 15) {
                        
                        VStack {
                            
                            
                            ForEach(0...1, id: \.self) { number in
                                Button {
                                    flagTapped(number)
                                } label: {
                                    Image(countries[number])
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(CGSize(width: 2, height: 1), contentMode: .fit)
                                        .shadow(radius: 5)
                                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                                        .offset(x: 3)
                                    
                                }
                                
                            }
                            
                        }
                        
                        VStack {
                            ForEach(2...3, id: \.self) { number in
                                Button {
                                    flagTapped(number)
                                } label: {
                                    Image(countries[number])
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(CGSize(width: 2, height: 1), contentMode: .fit)
                                        .shadow(radius: 5)
                                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                                        .offset(x: -3)
                                    
                                }
                            }
                            
                            
                        }
                        
                    }
                    
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .preferredColorScheme(.dark)
                .clipShape(RoundedRectangle(cornerRadius: 20))
               
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .font(.title.weight(.bold))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            
            
            
        }
        
        
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("\(alertMessage)")
        }
    }
    
    func flagTapped(_ number: Int) {
        print()
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            countries.shuffle()
            correctAnswer = Int.random(in: 0...3)
        } else {
            scoreTitle = "Wrong"
            showingScore = true
            alertMessage = "That's flag of \(countries[number])"
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...3)
        score = 0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
