//
//  MessagesView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 28/10/2024.
//

import SwiftUI

struct MessagesView: View {
    @State var message = ""
    @State var isClosed = true
    @State var isOpened = false
    
    //l'objet d'état est le propriétaire de l'objet
    @StateObject var allMessages = Messageries()
    var body: some View {
        NavigationStack{
            ZStack {
                Color.offWhite.ignoresSafeArea(edges: [.top, .horizontal])
                VStack {
                    //ZStack {
                    HStack {
                        Image("myAvatar8")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .foregroundColor(.black)
                        Text("Jules")
                            .fontWeight(.bold)
                        
                        Text("Active")
                            .font(.caption)
                        
                        NavigationLink(destination: ProfileView()) {
                            Image(systemName: "gear")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.accentColor)
                                .padding(.all)
                        }
                        .foregroundColor(.black)
                        
                    }
                    
                    .padding(.all)
                    
                    VStack {
                        // affichage d'un message
                        ScrollView(.vertical, showsIndicators: false, content:{
                            ScrollViewReader{ reader in
                                VStack(spacing: 20) {
                                    ForEach(allMessages.messageries) { msg in
                                        // Bulles de Chat...
                                        ChatBulle(msg: msg)
                                        
                                        
                                    }
                                }
                                .padding([.horizontal, .bottom])
                                .padding(.top, 25)
                            }
                        })
                        
                        HStack (spacing: 15){
                            
                            HStack(spacing: 15) {
                                
                                
                                TextField("message", text: self.$message)
                                
                                Button(action: {}, label: {
                                    Image(systemName: "paperclip.circle.fill")
                                        .font(.system(size:22))
                                        .foregroundColor(.gray)
                                })
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .background(Color(Color.black.opacity(0.06)))
                            .clipShape(Capsule())
                            
                            // Send Button...
                            // Hidding view
                            
                            if message != ""{
                                Button(action: {
                                    //ajout d'un message...
                                    allMessages.messageries.append(Messagerie(id: Date(),mssge: message, myMsg: true, photo: nil , profilePic: "myAvatar"))
                                    message = ""
                                    
                                }, label: {
                                    Image(systemName: "paperplane.fill")
                                        .font(.system(size: 22))
                                        .foregroundColor(Color("AccentColor"))
                                    //rotating the image...
                                        .rotationEffect(.init(degrees: 45))
                                    // adjusting padding shape
                                    
                                        .padding(.vertical,60)
                                        .padding(.leading,12)
                                        .padding(.trailing, 17)
                                    
                                        .background(Color.black.opacity(0.10))
                                        .clipShape(Circle())
                                    
                                })
                                
                            }
                        }
                        .padding(.horizontal)
                    }
                    .background(Color("AccentColor").opacity(0.07))
                    .clipShape(RoundedShape())
                    .padding()
                    HStack {
                        Button() {
                            isOpened = true
                        } label : {
                            Text("Bravo tu as retrouvé ton amigo")
                                .frame(width: 150, height: 60)
                                .padding(10)
                                .background(Color("Turquoise"))
                                .cornerRadius(15)
                                .foregroundColor(.white)
                        }
                        //
                        
                        
                        
                        .fullScreenCover(isPresented: $isOpened) {
                            FelcitationView(isOpened: $isOpened)
                        }
                        .sheet(isPresented: $isOpened) { // Afficher la modale avec
                            FelcitationView(isOpened: $isOpened) // Vue modale à afficher
                        }
                        
                        
                        .fullScreenCover(isPresented: $isClosed) {
                            ModalView(isClosed: $isClosed)
                        }
                        NavigationLink(destination: NotationView(clickimage: "", llamaface: "")) {
                            Text("Le voyage est terminé")
                                .font(.system(size: 15))
                                .frame(width: 150, height: 60)
                                .padding(10)
                                .background(Color("AccentColor"))
                                .cornerRadius(15)
                                .foregroundColor(.white)
                            
                            
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal){
                    Image("LogoAmiGo")
                        .resizable()
                        .scaledToFit()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}




// Bubble Arrow
struct BubbleArrow: Shape {
    var myMsg: Bool
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: myMsg ?[.topLeft,.bottomLeft, .bottomRight] : [.topRight, .bottomLeft, .bottomRight] , cornerRadii: CGSize(width: 10, height: 10))
        return Path(path.cgPath)
    }
}
struct ChatBulle : View {
    var msg: Messagerie
    var body: some View {
        HStack(alignment: .top,spacing: 10) {
            if msg.myMsg {
                // pousser le message vers la gauche
                
                // espace minimum ...
                Spacer(minLength: 25)
                Text(msg.mssge)
                    .padding(.all)
                    .background(Color.black.opacity(0.10))
                    .clipShape(BubbleArrow(myMsg: msg.myMsg))
                // Image de profile
                
                Image(msg.profilePic)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
            }
            else{
                // pousser le message à droite...
                // Image de profile ...
                Image(msg.profilePic)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                Text(msg.mssge)
                    .foregroundColor(.white)
                    .padding(.all)
                    .background(Color("AccentColor"))
                    .clipShape(BubbleArrow(myMsg: msg.myMsg))
                
                Spacer(minLength: 25)
                
            }
            
        }
    }
}

// forme arrondie personnalisée
struct RoundedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}
// données de modèle pour le message

struct Messagerie: Identifiable {
    var id: Date
    var mssge: String
    var myMsg: Bool
    var photo: Data?
    var profilePic: String
    
}

class Messageries : ObservableObject {
    @Published var messageries: [Messagerie] = []
    //  Exemple de données(message)
    init() {
        let strings = ["Hii","Hello!!!","Grâce à Amigo, on sait maintenant qu’on partage la même ligne de transport,  Ça te dit qu’on fasse un peu connaissance en attendant la prochaine station ?", "Hello ! Oui, on dirait bien ! Tu as découvert Amigo depuis longtemps ?","Non, récemment"]
        for i in 0..<strings.count{
            // logique pour une vue des messages sur les côtés ...
            messageries.append(Messagerie(id: Date(), mssge: strings[i], myMsg: i % 2 == 0 ? true : false, profilePic: i % 2 == 0 ? "myAvatar" : "myAvatar8"))
        }
    }
    func writeMessage(id: Date, msg: String, photo: Data?, myMsg: Bool, profilePic: String) {
        messageries.append(Messagerie(id: id, mssge: msg, myMsg: myMsg, photo: photo, profilePic: profilePic))
    }
}

#Preview {
    MessagesView(isClosed: false )
}



struct ModalView: View{
    @Binding var isClosed: Bool
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
                    isClosed = false
                }
            }
        }
        
    }
    
}

struct FelcitationView: View{
    @Binding var isOpened: Bool
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
                
                
                Text("Bravo! Tu as trouvé ton amiGo, place au fun !")
                    .font(.title2)
                    .italic()
                    .frame(width: 300)
                Spacer()
                Image(.handThumbsup)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height:100)
                Button("fermer") {
                    isOpened = false
                }
                
            }
        }
    }
}



