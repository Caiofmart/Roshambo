//
//  ContentView.swift
//  Roshambo
//
//  Created by Caio Feitoza Martins on 28/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shouldWin = Bool.random()
    @State private var cpuMove = Int.random(in: 0...2)
    @State private var scoreTotal = 0
    @State private var scoreTitle = ""
    @State private var roundCounter = 1
    @State private var gameOver = false
    let moves = ["Rock", "Paper", "Scissors"]
        
    var body: some View {
        VStack  {
            Text("Score: \(scoreTotal)")
            
            Text("CPU chose \(moves[cpuMove])")
            
            Text("You must \(shouldWin ? "Win" : "Lose"), so you pick...")
            
            ForEach(0..<3) { number in
                Button(action: {
                    self.playerMove(number)
                    playAgain()
                }, label: {
                    Text("\(moves[number])")
                })
            }
        }
        .alert(isPresented: $gameOver) {
            Alert(title: Text("Game Over"), message: Text("Your final score was \(scoreTotal)"), dismissButton: .default(Text("Play again")) {
                self.reset()
            })
        }
        
    }
    
    func playerMove (_ number: Int) {
        if shouldWin {
        if number == cpuMove + 1 || number == cpuMove - 2 {
            scoreTitle = "Correct"
            scoreTotal += 1
            }   else    {
                scoreTitle = "Wrong"
                scoreTotal -= 1
                }
       }   else{
        if number == cpuMove - 1 || number == cpuMove + 2 {
            scoreTitle = "Correct"
            scoreTotal += 1
        }   else{
            scoreTitle = "Wrong"
            scoreTotal -= 1
        }
       }
        
}
    func playAgain()  {
        
        if roundCounter == 11    {
            gameOver = true
            
        }   else    {
            roundCounter += 1
            shouldWin = Bool.random()
            cpuMove = Int.random(in: 0...2)
        }
        
    }
    
    func reset()    {
        cpuMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
        roundCounter = 0
        scoreTotal = 0
    }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
