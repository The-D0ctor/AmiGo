//
//  PierreFeuilleCiseaux.swift
//  AmiGo
//
//  Created by Carole TREM on 31/10/2024.
//

import SwiftUI


struct PierreFeuilleCiseauxView: View {
    
    @State var playerBot : [String] = ["✊","✌️","✋"]
    @State var player : [String] = ["✊","✌️","✋"]
    
    var body: some View {
        
        ZStack{
            Color.offWhite.ignoresSafeArea()
            VStack{
                Text("Pierre, Feuille, Ciseaux")
                    .font(.custom("Poppins", size: 20))
                ZStack{
                    Rectangle()
                        .opacity(0.1)
                        .padding()
                    
                    VStack{
                        
                        Text("✊")
                            .padding()
                            .font(.custom("Poppins-bold", size: 70))
                        
                        Text("Jouer")
                            .font(.custom("Poppins-bold", size: 30))
                            .padding()
                            .background(Color.darkOrange)
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                        Text("✌️")
                            .padding()
                            .font(.custom("Poppins-bold", size: 70))
                        
                    }
                }
            }
        }
    }
}

#Preview {
    PierreFeuilleCiseauxView()
}
