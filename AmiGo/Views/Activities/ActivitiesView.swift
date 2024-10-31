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

@State private var path: [Activity] = []

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.offWhite.ignoresSafeArea(edges: .top)
                VStack {
                    //VStack pour les 4 Bouttons
                    VStack {
                        
                        HStack {
                            BouttonJeuxExtractedView(activite: .riddle, imageLamaBoutton: "LlamaRiddle", jeuColor: .creme)
                            BouttonJeuxExtractedView(activite: .quizz, imageLamaBoutton: "LlamaQuizz", jeuColor: .lightTurquoise)
                        }
                        .padding(.horizontal, 5)
                        HStack {
                            BouttonJeuxExtractedView(activite: .game, imageLamaBoutton: "LlamaGames", jeuColor: .lightTurquoise)
                            BouttonJeuxExtractedView(activite: .subjectConv, imageLamaBoutton: "LlamaConv", jeuColor: .creme)
                        }
                        .padding(.horizontal, 5)
                        //BOUTTON POUR Laisser Alpago choisir
                        
                        Button {
                            path.append(Activity.allCases.randomElement()!)
                        } label: {
                            ZStack {
                                Text("Laisse Alpago choisir")
                                    .padding(15)
                                    .multilineTextAlignment(.center)
                                
                                    .font(.custom("Poppins", size: 20))
                                
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                                    .background(Color.accentColor)
                                    .cornerRadius(10)
                                    .frame(width: 200, height: 120)
                                    .shadow(radius: 8, x: 8, y: 8)
                                
                            }
                        }
                        AideLama(textAide: "Amuse-toi avec ton AmiGo", bulleAide: bulleAide, imageLamaBoutton: "LlamaSunglasses")
                            .frame(width : 350, height: 60)
                    }
                }
                .padding()
                .navigationDestination(for: Activity.self) { activity in
                    ActivitiesTabView(selectedActivity: activity)
                }
            }
            .padding(.top, 40)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("LogoAmiGo")
                        .resizable()
                        .scaledToFit()
                }
            }
            .navigationTitle("Activités")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    ActivitiesView()
}

struct BouttonJeuxExtractedView: View {
    
    @State var activite: Activity
    @State var imageLamaBoutton: String
    @State var jeuColor: Color
    
    var body: some View {
        NavigationLink(value: activite) {
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(jeuColor))
                    .shadow(radius: 5, x: 10, y: 10)
                   // .opacity(0.5)
                // .frame(width: 180, height: 170)
                
                VStack(spacing: 0) {
                    
                    Text(activite.rawValue)
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

