//
//  SwiftUIView extracte.swift
//  AmiGo
//
//  Created by Apprenant173 on 30/10/2024.
//

import SwiftUI

struct LlamaView: View {

    var llama: String
    var information: String
    var image: String
    var petitText:String
var body: some View {
        VStack{
            Image(.logoAmiGo)
            Spacer()
            ZStack{
                Image(llama)
                    .resizable()
                    .frame(width: 300, height: 300)
            }
            
            Text(information)
            .font(.title2)
            .italic()
            .frame(width: 300)
            Spacer()
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 100,height:100)
            Spacer()
            Text(petitText)
        
        }
    }
}
