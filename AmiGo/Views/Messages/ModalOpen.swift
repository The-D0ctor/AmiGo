//
//  ModalOpen.swift
//  AmiGo
//
//  Created by ALEX on 05/11/2024.
//
import SwiftUI
struct ModalOpen: View {
    
   @Binding var dismissModal1 : Bool
    
    var body: some View {
            ZStack {
                Color.white.ignoresSafeArea(edges: .top)
                VStack(alignment:.center){
                    Image(.logoAmiGo)
                    Spacer()
                    ZStack{
                        Image(.llamaWink)
                            .resizable()
                            .frame(width: 300, height: 300)
                    }
                    
                    
        Text("Félicitations ta demande de amiGo à été aceptée")
                        .font(.title2)
                        .italic()
                        .frame(width: 300)
                        Spacer()
                    Button("fermer") {
                                   dismissModal1 = false
                                }
                              
                    
                    
                    
                    
                }
            }

        }
    
    }
#Preview{
    ModalOpen(dismissModal1 : .constant(true))
}
