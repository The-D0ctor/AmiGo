//
//  PierreFeuilleCiseaux.swift
//  AmiGo
//
//  Created by Carole TREM on 31/10/2024.
//

import SwiftUI

struct PierreFeuilleCiseauxView: View {
    
    @State var amiGO1 = ""
    @State var amiGO2 = ""
    var choix : [String] = ["✊", "👋", "✌️"]
    @State var scoreAmiGO1 = 0
    @State var scoreAmiGO2 = 0
    @State var showModal = false
    @State var winner = ""
    @State var result: String = "C'est parti!"
    
    func generateChoice() -> String {
        return choix.randomElement()!
    }
    
    func resultat () {
        result =
        if amiGO1 == "" && amiGO2 == "" {
            "C'est parti !"
        }
        else if amiGO1 == amiGO2 {
            "Egalité"
        }else if amiGO1 == "✊" && amiGO2 == "👋" || amiGO1 == "👋" && amiGO2 == "✌️" || amiGO1 == "✌️" && amiGO2 == "✊" {
            " Bravo AmiGO 2 !"
        } else {
            " Bravo AmiGO 1 ! "
        }
    }
    
    func score () {
    
        if amiGO1 == amiGO2 {
        } else if amiGO1 == "✊" && amiGO2 == "👋" || amiGO1 == "👋" && amiGO2 == "✌️" || amiGO1 == "✌️" && amiGO2 == "✊" {
            scoreAmiGO2 += 1
        } else {
            scoreAmiGO1 += 1
        }
    }
    
    func decideWinner () {
        if scoreAmiGO1 == 3{
            winner = "AmiGO 1"
            showModal.toggle()
        }
        else if scoreAmiGO2 == 3{
            winner = "AmiGO 2"
            showModal.toggle()
        }
    }
    
    func lancerJeu() {
        amiGO1 = generateChoice()
        amiGO2 = generateChoice()
        score()
        decideWinner()
        resultat()
    }
    
    var body: some View {
        
        ZStack{
            Color.offWhite.ignoresSafeArea()
            
            VStack (spacing:30){
                
                VStack{
                    
                    Text(" AmiGO 1 \rscore : \(scoreAmiGO1)")
                        .font(.custom("Poppins", size: 22))
                    Text(amiGO1)
                        .padding()
                        .font(.custom("Poppins-bold", size: 70))
                        .animation(.easeInOut, value: amiGO1)
                        .frame(width: 100, height: 100)
                }
                
                Text(result)
                    .font(.custom("Poppins-bold", size: 24))
                    .foregroundStyle(.turquoise)
                    .animation(.easeInOut, value: result)
                    
                
                VStack {
                    Text(amiGO2)
                        .padding()
                        .font(.custom("Poppins-bold", size: 70))
                        .animation(.easeInOut, value: amiGO2)
                        .frame(width: 100, height: 100)
                    Text(" AmiGO 2 \rscore : \(scoreAmiGO2)")
                        .font(.custom("Poppins", size: 22))
                }
                
                Button {
                    lancerJeu()
                    
                } label:{
                    Text("Jouer")
                        .font(.custom("Poppins-bold", size: 24))
                        .padding()
                        .background(Color.darkOrange)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                    
                }
            }
        }
        .sheet(isPresented: $showModal) {ModalPFC(dissmissModal: $showModal, winner: $winner, scoreAmiGO1: $scoreAmiGO1, scoreAmiGO2: $scoreAmiGO2)
        }
    }
    
}

#Preview {
    PierreFeuilleCiseauxView()
}
