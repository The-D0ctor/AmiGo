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
            VStack{
                Image(.logoAmiGo)
                Text ("Ton AmiGo")
                    .font(.title)
                    .bold()
                //Spacer()
                
                VStack {
                    Image(.myAvatar)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaledToFit()
                        .clipShape(Circle())
                    Text("Camille")
                        .font(.title2)
                        .italic()
                
                    Text("Hobbies: Sport , Voyages")
                        .font(.title2)
                        .bold()
                    Text("Nombre de trajets: 5")
                        .font(.title2)
                        .bold()
                    Text("Stations préférés: \rSaint Lazare - La Muette")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color.red)
                      }
                
                .border(.darkOrange)
                .frame(width: 350, height: 350)
                HStack{
                    VStack{
                        Image("RATP")
                            .resizable()
                            .frame(width: 80,height: 80)
                        
                        Color(.systemOrange)
                            .frame (width: 100, height: 50)
                            .cornerRadius(100)
                    }
                      Spacer()
                        VStack{
                            Spacer()
                            Image("message")
                                .resizable()
                                .frame(width: 100, height: 80)
                            Image("LlamaSmile")
                                .resizable()
                            .frame(width: 150, height: 150) }
                    
                    .padding()
                }
                
            }
        }
    }
}
#Preview {
        ProfileView( )
    }
