//
//  ProfileView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 28/10/2024.
//

import SwiftUI

struct NotationView: View {
    @State private var buttonSad: Bool = false
    @State private var buttonBof: Bool = false
    @State private var buttonOk: Bool = false
    @State private var buttonHappy: Bool = false
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
                        
                        Button {
                            //centralSymbol = "smiley"
                        } label: {
                            Image("LlamaSad")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .padding(.bottom)
                            
                        }
                        Button {
                            //centralSymbol = "smiley"
                        } label: {
                            Image("LlamaSmile")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .padding(.bottom)
                            
                        }
                        Button {
                            //centralSymbol = "smiley"
                        } label: {
                            Image("LlamaHappy")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .padding(.bottom)
                            
                        }
                        Button {
                            //centralSymbol = "smiley"
                        } label: {
                            Image("LlamaWink")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .padding(.bottom)
                            
                        }
                        
                       
                    
                    }
                    Spacer()
                        
                    Button {
                        //centralSymbol = "smiley"
                    } label: {
                        Text("Signaler cet Amigo ?")
                            .background(Color("AccentColor"))
                            .foregroundColor(.white)
                            .padding()
                            .cornerRadius(20)
                            .shadow(radius: 5)
                           
                        
                    }
                        
                        
                        
                        
                    }
                }
            }
    
    }
}
    #Preview {
        NotationView()
    }

