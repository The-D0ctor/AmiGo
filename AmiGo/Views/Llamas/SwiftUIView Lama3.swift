//
//  SwiftUIView Lama3.swift
//  AmiGo
//
//  Created by Apprenant173 on 29/10/2024.
//

import SwiftUI

struct SwiftUIView_Lama3: View {
    var body: some View {
        ZStack {
            Color.offWhite.ignoresSafeArea(edges: .top)
            VStack{
                Image(.logoAmiGo)
                Spacer()
                ZStack{
                    Image(.llamaSleepy)
                        .resizable()
                        .frame(width: 300, height: 300)
                }
                
                
             Text("Les amiGos ne sont pas sortis pour le moment ")
                
                    .font(.title2)
                    .italic()
                    .frame(width: 300)
                    Spacer()
                Image(.hourglass)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height: 100)
                Spacer()
                Text("Soyez-informé des qu'ils seront là")
                    .font(.title3)
                
                
                
            }
        }

    }
}

#Preview {
    SwiftUIView_Lama3()
}
