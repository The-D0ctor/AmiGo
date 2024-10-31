//
//  SwiftUIView Lama4.swift
//  AmiGo
//
//  Created by Apprenant173 on 29/10/2024.
//

import SwiftUI

struct SwiftUIView_Lama4: View {
    var body: some View {
        
        ZStack {
            Color.offWhite.ignoresSafeArea(edges: .top)
            VStack{
                Image(.logoAmiGo)
                Spacer()
                ZStack{
                    Image(.llamaSunglasses)
                        .resizable()
                        .frame(width: 300, height: 300)
                }
                
                
        Text("Bravo! Tu as trouvé ton amiGo, place au fun !")
                    .font(.title2)
                    .italic()
                    .frame(width: 300)
                    Spacer()
                Image(.handThumbsup)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height:100)
                
                
            }
        }
        
    }
}

#Preview {
    SwiftUIView_Lama4()
}
