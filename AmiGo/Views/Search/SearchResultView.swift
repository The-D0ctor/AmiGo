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
    
    @State var showModal1 : Bool = true
    @State var showModal2 : Bool = false

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
                    
                        .onChange(of:nbAmiGos) {
                            if nbAmiGos >= 3 {showModal2 = true
                            }
                        }

                
                    ScrollView{
                        
                        ForEach(usersTrip) { eachUserTrip in
                            AmiGoResults(userTrip: eachUserTrip, nbAmiGos: $nbAmiGos, showModal2: $showModal2)
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
        .sheet(isPresented: $showModal1) {
            
            LamaModal(llama: "LlamaSmile", information: "Tu n'as pas encore trouvé ton AmiGo,choisis en 3 parmi la liste", image: "hand.rays", dissmissModal: $showModal1)
        }
        .sheet(isPresented: $showModal2) {
            
            LamaModal(llama: "LlamaSpeaking", information: "Les AmiGos ont reçu ta demande. \r Attendons leur retour ...", image: "hourglass", dissmissModal: $showModal2)
        }
    }
}

#Preview {
    
    SearchResultView(departureStation: .constant("nation"), arrivalStation: .constant("CDG"), bulleAide: false)
}

struct AmiGoResults: View {
    
    var userTrip : Trip
    @Binding var nbAmiGos : Int
    @Binding var showModal2 : Bool
    
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
                
                Button {
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

