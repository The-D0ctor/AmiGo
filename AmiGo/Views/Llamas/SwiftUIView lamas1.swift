//
//  SwiftUIView lamas.swift
//  AmiGo
//
//  Created by Apprenant173 on 29/10/2024.
//

import SwiftUI

struct SwiftUIView_lamas: View {
    
    var body: some View {
        ZStack {
            Color.offWhite.ignoresSafeArea(edges: .top)
            VStack{
                Image(.logoAmiGo)
                Spacer()
                ZStack{
                    Image(.llamaSpeaking)
                        .resizable()
                        .frame(width: 300, height: 300)
                }
    
                Text("Tu n'as pas encore trouve ton AmiGo,choisis en 3 parmi la liste ")
                    .font(.title2)
                    .italic()
                    Spacer()
                Image(.handRays)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height:100)
                
                
            }
        }
    }
}
#Preview {
    SwiftUIView_lamas()
}
