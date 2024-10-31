//
//  ProfileView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 28/10/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.offWhite.ignoresSafeArea(edges: .top)
            VStack (spacing : 40){
                Image(.logoAmiGo)
                
                ZStack{
                    
                    VStack {
                        Text ("Ton AmiGo")
                            .font(.title)
                            .bold()
                        Image(.myAvatar)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .scaledToFit()
                            .clipShape(Circle())
                        Text("Camille")
                            .font(.title2)
                            .italic()
                        
                        Text("Hobbies: Sport , Voyages")
                 
                            .bold()
                        Text("Nombre de trajets: 5")
                  
                            .bold()
                        Text("Stations préférés: \rSaint Lazare - La Muette")

                            .bold()
                            .foregroundColor(Color.darkOrange)
                    }
                    
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.turquoise,lineWidth: 1)
                        .frame(width: 300, height : 350))
                    .padding()
                }
            
                ZStack {
                        
                    HStack(spacing:40 ){
                        VStack{
                            Image("RATP")
                                .resizable()
                                .frame(width: 90,height: 90)
                                .padding()
                            
                            ZStack {
                                Color(.systemOrange)
                                    .frame (width: 100, height: 50)
                                    .cornerRadius(100)
                                    .opacity(0.4)
                                Text("3117")
                                    .font(.title3)
                                    .bold()
                            }
                        }
                    
                        VStack{
                            ZStack {
                                SpeechBubble(radius: 20)
                                    .fill(Color.white)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(width:150, height:50 )
                                    .padding(.horizontal)
                                    
                                Text("En cas de besoin")
                                    .multilineTextAlignment(.leading)
                                    .font(.custom("Poppins", size: 16))
                                    .fontWeight(.light)
                                    .padding()
                            }
                            Image ("LlamaSmile")
                                .resizable()
                                .frame(width: 120, height: 120)
                                .rotationEffect(.degrees(-25))
                        }
                    }.overlay(RoundedRectangle(cornerRadius: 30 )
                        .stroke(Color.turquoise,lineWidth: 1)
                        .frame(width: 360, height : 250))
                }
                
            }
        }
    }
}
#Preview {
    ProfileView( )
}

                   
