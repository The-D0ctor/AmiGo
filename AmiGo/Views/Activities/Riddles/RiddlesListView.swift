//
//  RiddlesListView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 29/10/2024.
//

import SwiftUI

struct RiddlesListView: View {
    let riddles: [ActivityGuess] = [
        ActivityGuess(question: "Quelle est la plus basse note de musique ?", answers: [], solution: "Fa, parce qu’elle est sous le sol.", theme: "Musique"),
        ActivityGuess(question: "Pourquoi les plongeurs plongent-ils en arrière ?", answers: [], solution: "Parce que s’ils plongeaient en avant ils tomberaient dans le bateau.", theme: "Plongeur"),
        ActivityGuess(question: "Que se disent deux bonhommes de neige qui se croisent ?", answers: [], solution: "« Tu trouves pas que ça sent la carotte aujourd’hui ? »", theme: "Bonhomme de neige"),
        ActivityGuess(question: "Comment le boulanger range ses pains au chocolat ?", answers: [], solution: "Dans l’ordre des croissants.", theme: "Boulanger"),
        ActivityGuess(question: "Quatre éléphants sont dans une voiture. Lequel conduit ?", answers: [], solution: "Celui qui a le permis.", theme: "Éléphant"),
        ActivityGuess(question: "Qu'est ce qui a 118 yeux et 7 dents ?", answers: [], solution: "Un autobus rempli de personnes âgées.", theme: "Yeux et dents"),
        ActivityGuess(question: "Qu'est-ce qu'on trouve dans un nez bien propre ?", answers: [], solution: "Des empreintes digitales.", theme: "Nez"),
        ActivityGuess(question: "Combien de fois des gens se sont jetés du haut de la Tour Eiffel ?", answers: [], solution: "Une seule fois chacun.", theme: "Tour Eiffel"),
        ActivityGuess(question: "Pourquoi un fermier ne peut se marier avec une fille prénommée Claire ?", answers: [], solution: "Parce que la ferme tuerait Claire.", theme: "Fermier"),
        ActivityGuess(question: "Quel animal a trois bosses ?", answers: [], solution: "Un chameau qui s’est cogné.", theme: "Animal"),
    ]
    
    @State var showModal: Bool = false
    @State private var selectedRidle: ActivityGuess
    
    init() {
        self.selectedRidle = riddles[0]
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(riddles) { riddle in
                    RoundedCornerBorderButton(text: riddle.theme) {
                        selectedRidle = riddle
                        showModal = true
                    }
                }
            }
            .font(.custom("Poppins", size: 14))
            .fontWeight(.medium)
            .padding()
            .sheet(isPresented: $showModal) {
                ZStack {
                    Color.offWhite
                    RiddleModalView(riddle: $selectedRidle)
                        .presentationDetents([.medium])
                        .padding(50)
                }
            }
        }
    }
}

#Preview {
    RiddlesListView()
}
