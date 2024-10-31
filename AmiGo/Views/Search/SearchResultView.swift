//
//  SearchResultView.swift
//  AmiGo
//
//  Created by Carole TREM on 29/10/2024.
//

import SwiftUI

struct SearchResultView: View {
    
    @Binding var departureStation: String
    @Binding var arrivalStation: String
    
    @State var nbAmiGos : Int = 0
    @State var bulleAide: Bool
    
    
    var body: some View {
        
        
        ZStack {
            
            Color.offWhite.ignoresSafeArea()
            
            VStack {
                VStack {
                    
                    DepartArrivee(icon: "mappin2", station: departureStation, iconArrow: "arrow.up", colorArrow: .turquoise)
                    DepartArrivee(icon: "mappin", station: arrivalStation, iconArrow: "arrow.down", colorArrow: .darkOrange)
                    
                }.padding(.horizontal, 20)
                
                VStack (alignment:.leading){
                    
                    Text(" \(usersTrip.count) AmiGos autour de toi: ")
                        .font(.custom("Poppins-bold", size:20))
                    
                    Text("\(nbAmiGos) AmiGos selectionnés")
                    
                    ScrollView{
                        
                        ForEach(usersTrip) { eachUserTrip in
                            AmiGoResults(userTrip: eachUserTrip, nbAmiGos: $nbAmiGos)
                        }
                    }
                }.padding()
                
                AideLama(textAide:"Choisis 3 AmiGos avec qui tu pourrais voyager", bulleAide: true, imageLamaBoutton: "LlamaHappy")
                
                    .frame(width : 360, height: 80)
            }.padding()
        } .toolbar {
            ToolbarItem(placement: .principal) {
                Image("LogoAmiGo")
                
            }
            
            
        }
        
        
    }
}

#Preview {
    
    SearchResultView(departureStation: .constant("nation"), arrivalStation: .constant("CDG"), bulleAide: false)
}

struct AmiGoResults: View {
    
    var userTrip : Trip
    @Binding var nbAmiGos : Int
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .foregroundColor(userTrip.user.gender == "female" ? .darkOrange : .turquoise)
                .opacity(0.25)
                .cornerRadius(5)
            
            HStack {
                Image(userTrip.user.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 60)
                ZStack{
                    Rectangle()
                        .opacity(0)
                    HStack{
                        VStack (alignment:.leading){
                            Text(userTrip.user.name)
                                .font(.custom("Poppins", size:16))
                                .fontWeight(.bold)
                            Text(userTrip.user.hobbies)
                                .font(.custom("Poppins", size:12))
                            Spacer()
                        }
                        Spacer()
                    }
                }
                ZStack {
                    Rectangle()
                        .opacity(0)
                        .frame(width:120)
                    VStack (alignment: .leading, spacing: 0){
                        Text("20 mins ensemble")
                        HStack{
                            Text("sur le")
                            Image(userTrip.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 20)
                        }
                        Text("jusqu'à " + userTrip.arrivalStation)
                        
                        Spacer()
                    }.font(.custom("Poppins", size:12))
                        .frame(height: 50)
                }
                
                Button{
                    nbAmiGos += 1
                }label:{
                    Text("Contacte ton AmiGo")
                        .frame(width: 70, height: 70)
                        .padding(5)
                        .background(userTrip.user.gender == "female" ? .darkOrange : .turquoise)
                        .font(.custom("Poppins-bold", size:13))
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                }
            }
        }.frame(width: 380, height: 80)
    }
}

struct DepartArrivee: View {
    var icon : String
    var station : String
    var iconArrow : String
    var colorArrow : Color
    
    var body: some View {
        HStack{
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            ZStack{
                Rectangle()
                    .frame(width: 350, height: 30)
                    .foregroundColor(.white)
                HStack {
                    Text("\(station)")
                        .font(.custom("Poppins-Light", size:16))
                    Spacer()
                }
                
            }
            Image(iconArrow)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(colorArrow)
        }
    }
}

//struct AideLamaExtractedView: View {
//
//    var textAide: String
//    @Binding var bulleAide: Bool
//    var imageLamaBoutton: String
//
//    var body: some View {
//        HStack {
//
//            if bulleAide {
//                ZStack {
//
//                    SpeechBubble(radius: 20)
//                        .fill(Color.white)
//                        .stroke(Color.gray, lineWidth: 3)
//                        .frame(maxWidth: .infinity)
//                        .padding(.horizontal)
//
//                    Text(textAide)
//                        .multilineTextAlignment(.leading)
//                        .font(.custom("Poppins", size: 14))
//                        .fontWeight(.light)
//                        .frame(width: 200, height: 100)
//                }
//            }
//            else {
//                Spacer()
//            }
//            Button {
//                bulleAide.toggle()
//            } label: {
//                Image(imageLamaBoutton)
//                    .resizable()
//                    .frame(width: 90, height: 90)
//                    .rotationEffect(.degrees(-25))
//            }
//        }.padding(.horizontal)
//    }
//}
//
//
//#Preview {
//    AideLamaExtractedView(textAide: "Aide-moi", bulleAide: .constant(true), imageLamaBoutton: "LlamaHappy")
//}
