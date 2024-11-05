//
//  SearchView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 28/10/2024.
//

import SwiftUI

struct SearchView: View {
    
    @State var departureStation: String = ""
    @State var arrivalStation: String = ""
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color.offWhite.ignoresSafeArea(edges: .top)
                
                VStack {
                    
                    VStack(alignment:.leading){
                        
                        Text("Départ")
                            .font(.custom("Poppins", size: 20))
                        
                        ExtractedTextField(departArrivee : "Depart", station2 : $departureStation)
                        
                        Text("Arrivée")
                            .font(.custom("Poppins", size: 20))
                        
                        ExtractedTextField(departArrivee : "Arrivée", station2 : $arrivalStation)
                        
                    }.padding()
                    
                    
                    NavigationLink(destination: SearchResultView(departureStation:$departureStation , arrivalStation: $arrivalStation, bulleAide: true)) {
                        Text("Go")
                        
                    }
                    .padding()
                    .foregroundStyle(Color.white)
                    .background(Color.darkOrange)
                    .fontWeight(.bold)
                    .font(.custom("Poppins", size:20))
                    .cornerRadius(10)
                    .disabled(departureStation.isEmpty || arrivalStation.isEmpty)
                    
                    Spacer()
                    
                    AideLama(textAide:"Hola!\rDonne plus d'infos sur\rton trajet et je vais t'aider à trouver des AmiGOs ! ", bulleAide: true, imageLamaBoutton: "LlamaHappy")
                        .frame(width : 360, height: 130)
                    
                }.padding()
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("LogoAmiGo")
                        .resizable()
                        .scaledToFit()
                }
            }
            .navigationTitle("Recherche")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    SearchView()
}

struct ExtractedTextField: View {
    
    var departArrivee : String = "Depart"
    @Binding var station2 : String
    
    var body: some View {
        
        TextField(departArrivee, text: $station2)
            .padding()
            .frame(width:350, height :30 )
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.turquoise, lineWidth: 1)
            )
    }
}
