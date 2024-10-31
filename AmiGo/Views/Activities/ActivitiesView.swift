//
//  ActivitiesView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 28/10/2024.
//

import SwiftUI

struct ActivitiesView: View {
    
    @State private var quiZz: Bool = false
    @State private var deVinettes: Bool = false
    @State private var miniJeux: Bool = false
    @State private var sujConv: Bool = false
    @State private var textAide: String = ""
    @State private var bulleAide: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.offWhite.ignoresSafeArea(edges: .top)
                VStack {
                    //VStack pour les 4 Bouttons
                    VStack {
                        
                        HStack {
                            BouttonJeuxExtractedView(activite: "Quizz", imageLamaBoutton: "LlamaQuizz", jeuColor: .accentColor)
                            BouttonJeuxExtractedView(activite: "Devinettes", imageLamaBoutton: "LlamaRiddle", jeuColor: .turquoise)
                        }
                        .padding(.horizontal, 5)
                        HStack {
                            BouttonJeuxExtractedView(activite: "Jeux", imageLamaBoutton: "LlamaGames", jeuColor: .turquoise)
                            BouttonJeuxExtractedView(activite: "Conversation", imageLamaBoutton: "LlamaConv", jeuColor: .accentColor)
                        }
                        .padding(.horizontal, 5)
                        //BOUTTON POUR Laisser Alpago choisir
                        
                        Button {
                            //Action
                        } label : {
                            ZStack {
                                Text("Laisse Alpago choisir")
                                    .padding(15)
                                    .multilineTextAlignment(.center)
                                    .shadow(radius: 5, x: 10, y: 10)
                                
                                    .font(.custom("Poppins", size: 20))
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                                    .background(Color.gray.opacity(0.5))
                                    .clipShape(.capsule)
                                    .frame(width: 200, height: 120)
                            }
                        }
                        AideLama(textAide: "Amuse-toi avec ton AmiGo", bulleAide: bulleAide, imageLamaBoutton: "LlamaSunglasses")
                            .frame(width : 350, height: 60)
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("LogoAmiGo")
                    
                                    }
                                }
                }
            }
        }
        #Preview {
            ActivitiesView()
        }
    
struct BouttonJeuxExtractedView: View {
            
        @State var activite: String
        @State var imageLamaBoutton: String
        @State var jeuColor: Color
            
var body: some View {
                Button {
                    //Action
        }
                label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(jeuColor))
                            .opacity(0.5)
                           // .frame(width: 180, height: 170)
                        
                        VStack(spacing: 0) {
                            
                            Text(activite)
                                .font(.custom("Poppins", size: 20))
                                .foregroundStyle(.white)
                            Image(imageLamaBoutton)
                                .resizable()
                                .scaledToFit()
                                .padding([.horizontal, .bottom], 5)
                        }
    
                    }
                    
                    
                }
            }
        }
        
