//
//  ModalSortie.swift
//  AmiGo
//
//  Created by ALEX on 05/11/2024.
//

import SwiftUI

struct ModalSortie : View{
    
    @Binding var dismissModal2: Bool
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(edges: .top)
            VStack{
                Image(.logoAmiGo)
                Spacer()
                ZStack{
                    Image(.llamaSunglasses)
                        .resizable()
                        .frame(width: 300, height: 300)
                }
                
                
                Text("Bravo! Tu as trouvé ton amiGO, place au fun !")
                    .font(.title2)
                    .italic()
                    .frame(width: 300)
                Spacer()
                Image(.handThumbsup)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height:100)
                Button("fermer") {
                    dismissModal2 = false
                }
                
            }
        }
    }
}




#Preview{
    ModalSortie(dismissModal2 : .constant(false))
}
