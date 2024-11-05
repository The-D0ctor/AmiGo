//
//  ProfileView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 28/10/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.offWhite.ignoresSafeArea(edges: .top)
                VStack (spacing : 10){
                    ZStack{
                        
                        VStack {
                            Text ("Ton AmiGo")
                                .font(.title)
                                .bold()
                            Image(.myAvatar3)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                            Text("Camille")
                                .font(.title2)
                                .italic()
                            
                            Text("Hobbies: Sport , Voyages")
                            
                                .bold()
                            Text("Nombre de trajets: 5")
                            
                                .bold()
                            Text("Stations préférés: \nSaint Lazare - La Muette")
                            
                                .bold()
                                .foregroundColor(Color.darkOrange)
                                .multilineTextAlignment(.center)
                        }
                        
                        
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.turquoise,lineWidth: 1))
                    
                    ZStack {
                        
                        HStack(spacing:40 ){
                            VStack{
                                Image("RATP")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                Button {
                                    let url = URL(string: "tel://3117")
                                    UIApplication.shared.open(url!)
                                } label: {
                                    
                                    ZStack {
                                        Color(.red)
                                        .frame (width: 120, height: 50)
                                        .cornerRadius( 30 )
                                    Text("31 17")
                             //  .padding()
                             //            .background(Color.red)
                                            .font(.title)
                             //              .bold()
                                           .foregroundStyle(.white)
                            //         .clipShape(.capsule)
                                    }
                                    
                                }
                                Text("URGENCES RATP")
                                    .font(.caption)
                                    .foregroundStyle(.red)
                                
                            }
                            
                            VStack(spacing: 24){
                                ZStack {
                                    SpeechBubbleBottom(radius: 10)
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
                                    .scaledToFit()
                                    .rotationEffect(.degrees(-25))
                            }
                        }
                    }
                    .padding(7)
                    .overlay(RoundedRectangle(cornerRadius: 30 )
                        .stroke(Color.turquoise,lineWidth: 1))
                    .padding()
                    
                }
                    .padding(.top)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("LogoAmiGo")
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}
#Preview {
    ProfileView( )
}

                   
