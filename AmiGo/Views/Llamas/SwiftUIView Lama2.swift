//
//  SwiftUIView Lama2.swift
//  AmiGo
//
//  Created by Apprenant173 on 29/10/2024.
//

import SwiftUI

struct SwiftUIView_Lama2: View {
    var body: some View {
        
        ZStack {
            Color.offWhite.ignoresSafeArea(edges: .top)
            VStack(alignment:.center){
                Image(.logoAmiGo)
                Spacer()
                ZStack{
                    Image(.llamaWink)
                        .resizable()
                        .frame(width: 300, height: 300)
                }
                
                
    Text("Félicitations ta demanda de amiGo à été aceptée")
                    .font(.title2)
                    .italic()
                    .frame(width: 300)
                    Spacer()
                
                Image(.handsClap)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height:100)
                
                
            }
        }
    
    }
}

#Preview {
    SwiftUIView_Lama2()
}
