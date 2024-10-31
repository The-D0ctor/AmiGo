//
//  ProfileView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 28/10/2024.
//

import SwiftUI

struct NotationView: View {
    @State private var buttonSad = false
    @State private var buttonBof = false
    @State private var buttonHappy = false
    @State private var buttonWink = false
    @State var clickimage: String
    @State var llamaface: String
    
    var body: some View {
        
        ZStack {
            Color.offWhite.ignoresSafeArea(edges: .top)
            
            VStack(alignment: .center){
                Image(.logoAmiGo)
                Spacer()
                Text("Merci d'avoir voyagé avec AmiGo")
                    .font(.custom("Poppins", size: 25))
                    .fontWeight(.semibold)
                    .padding(.top)
                    .multilineTextAlignment(.center)
                Spacer()
                
                
                Image(.myAvatar)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180) // Ajuste la taille de l'image
                    .clipShape(Circle())
                Spacer()
                
                
                Text("Comment s'est passé ton expérience ?")
                    .font(.custom("Poppins", size: 25))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Spacer()
                
                
                
                
                VStack{
                    Spacer()
                    HStack(spacing: 10){
                        
                        NotationExtractedView(buttonSad: $buttonSad, llamaface: "LlamaSad", clickimage: "hand.thumbsdown.fill" )
                        
                        NotationExtractedView(buttonSad: $buttonBof, llamaface: "LlamaSmile", clickimage: "smiley.fill" )
                        
                        NotationExtractedView(buttonSad: $buttonHappy, llamaface: "LlamaHappy", clickimage: "hand.thumbsup.fill" )
                        
                        NotationExtractedView(buttonSad: $buttonWink, llamaface: "LlamaWink", clickimage: "hands.and.sparkles.fill" )


                    }
                    Spacer()
                    
                    Button {
                        //centralSymbol = "smiley"
                    } label: {
                        Text("Signaler cet Amigo ?")
                            .frame(width: 150, height: 60)
                            .background(Color("AccentColor"))
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .padding()

                    }
                    
                }
            }
        }
    }
}

#Preview {
    NotationView(clickimage:"hands.thumbsup.fill", llamaface: "LlamaSad")
}




struct NotationExtractedView: View {
    @Binding var buttonSad: Bool
    var llamaface: String
    var clickimage: String
    var body: some View {
        ZStack{
            
            Button {
                buttonSad.toggle()
            } label: {
                    Image(llamaface)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)

                
            }
            
            if  buttonSad {
                
                Circle()
                    .frame(width: 80, height: 80)
                    .opacity(0.4)
                Image(systemName: clickimage)
                    .foregroundStyle(.orange)
                    .font(.title)
                
                
            }
            
            
        }
    }
}
