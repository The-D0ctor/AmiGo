//
//  QuizzListView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 29/10/2024.
//

import SwiftUI

struct QuizzesListView: View {
    let quizzes: [ActivityGuess]
    
    @Binding var selectedQuizz: ActivityGuess
    @Binding var showModal: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(quizzes.indices, id: \.self) { indice in
                    RoundedCornerBorderButton(text: quizzes[indice].theme, backgroundColor: indice % 2 == 0 ? .creme : .lightTurquoise, strokeColor: indice % 2 == 0 ? .accent : .turquoise) {
                        selectedQuizz = quizzes[indice]
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
                    QuizzModalView(quizz: $selectedQuizz, showModal: $showModal)
                        .presentationDetents([.fraction(0.8)])
                        .padding(30)
                }
            }
        }
    }
}

#Preview {
    QuizzesListView(quizzes: [ActivityGuess(question: "Les chauves-souris vampires se nourrissent exclusivement de sang. Vrai ou faux ?", answers: [
        ActivityGuessAnswer(answer: "Vrai", isCorrect: true),
        ActivityGuessAnswer(answer: "Faux", isCorrect: false)
    ], solution: "Il existe 3 espèces de chauves-souris vampires et elles se  nourrissent exclusivement de sang. On les trouve uniquement en Amérique centrale et en Amérique du Sud. Ces animaux peuvent transmettre la rage par morsure.", theme: "Chauves-Souris")], selectedQuizz: .constant(ActivityGuess(question: "Les chauves-souris vampires se nourrissent exclusivement de sang. Vrai ou faux ?", answers: [
        ActivityGuessAnswer(answer: "Vrai", isCorrect: true),
        ActivityGuessAnswer(answer: "Faux", isCorrect: false)
    ], solution: "Il existe 3 espèces de chauves-souris vampires et elles se  nourrissent exclusivement de sang. On les trouve uniquement en Amérique centrale et en Amérique du Sud. Ces animaux peuvent transmettre la rage par morsure.", theme: "Chauves-Souris")), showModal: .constant(false))
}
