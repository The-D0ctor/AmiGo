//
//  QuizzListView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 29/10/2024.
//

import SwiftUI

struct QuizzesListView: View {
    let quizzes: [ActivityGuess] = [
        ActivityGuess(question: "Les chauves-souris vampires se nourrissent exclusivement de sang. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: true),
            ActivityGuessAnswer(answer: "Faux", isCorrect: false)
        ], solution: "Il existe 3 espèces de chauves-souris vampires et elles se  nourrissent exclusivement de sang. On les trouve uniquement en Amérique centrale et en Amérique du Sud. Ces animaux peuvent transmettre la rage par morsure.", theme: "Chauves-Souris"),
        ActivityGuess(question: "Les gorilles et les humains partagent plus de 98% du patrimoine génétique. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: true),
            ActivityGuessAnswer(answer: "Faux", isCorrect: false)
        ], solution: "Le gorille est une espèce de singe proche des humains avec un taux de ressemblance génétique de plus de 98,5% mais le bonobo et le chimpanzé sont encore plus proches des humains à presque 99%.", theme: "Gorilles"),
        ActivityGuess(question: "Lorsqu'il fait du bruit, on dit que l'éléphant vagit. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: false),
            ActivityGuessAnswer(answer: "Faux", isCorrect: true)
        ], solution: "Un éléphant barrit et fait des barrissements. Ce sont les lièvres ou les crocodiles qui vagissent.", theme: "Éléphants"),
        ActivityGuess(question: "Il a été prouvé que tous les ours polaires sont des gauchers. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: false),
            ActivityGuessAnswer(answer: "Faux", isCorrect: true)
        ], solution: "C'est une fausse information qui a longtemps circulé à propos des ours polaires, mais ces animaux utilisent leurs pattes gauches et droites de manière égale, on peut donc dire qu'ils sont ambidextres.", theme: "Ours polaires"),
        ActivityGuess(question: "Le toucan possède la particularité d'avoir un très petit bec comparé à sa taille. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: false),
            ActivityGuessAnswer(answer: "Faux", isCorrect: true)
        ], solution: "C'est l'inverse, le toucan est réputé pour son grand bec généralement coloré.", theme: "Toucans"),
        ActivityGuess(question: "Une tortue marine peut rester sous l'eau pendant 7 heures sans reprendre d'oxygène. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: true),
            ActivityGuessAnswer(answer: "Faux", isCorrect: false)
        ], solution: "Lorsque les tortues dorment, elles dépensent très peu d’oxygène, elles peuvent alors rester sous l’eau pendant 4 à 7h.", theme: "Tortues marine"),
        ActivityGuess(question: "Le chat ayant vécu le plus longtemps est mort à l'âge de 38 ans. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: true),
            ActivityGuessAnswer(answer: "Faux", isCorrect: false)
        ], solution: "Ce chat nommé Cream Puff a vécu 38 ans de 1967 à 2005, rapporté à l'âge humain, cela correspond à 169 ans. En moyenne les chats vivent 12 à 14 ans.", theme: "Chats"),
        ActivityGuess(question: "Le yack est un animal qui vit en Amérique du Sud. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: false),
            ActivityGuessAnswer(answer: "Faux", isCorrect: true)
        ], solution: "Le yack est un animal que l'on trouve dans toute la région himalayenne du Gilgit-Baltistan (Cachemire, Pakistan), au Népal, sur le plateau tibétain et jusqu'en Mongolie et en Sibérie au nord. Il n'est donc pas naturellement présent en Amérique du Sud.", theme: "Yacks"),
        ActivityGuess(question: "Chez les lucioles, seuls les mâles brillent dans la nuit pour attirer les femelles. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: false),
            ActivityGuessAnswer(answer: "Faux", isCorrect: true)
        ], solution: "Les mâles et les femelles lucioles brillent. Les femelles brillent même davantage que les mâles pour les attirer.", theme: "Lucioles"),
        ActivityGuess(question: "Les guêpes sont des insectes généralement plus longs que les abeilles. Vrai ou faux ?", answers: [
            ActivityGuessAnswer(answer: "Vrai", isCorrect: true),
            ActivityGuessAnswer(answer: "Faux", isCorrect: false)
        ], solution: "L'abeille est petite et trapue alors que la guêpe est plus profilée, longue et possède un abdomen séparé du thorax d'où l'expression « avoir une taille de guêpe ».", theme: "Guêpes"),
    ]
    
    @State var showModal: Bool = false
    @State private var selectedQuizz: ActivityGuess
    
    init() {
        self.selectedQuizz = quizzes[0]
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(quizzes) { quizz in
                    RoundedCornerBorderButton(text: quizz.theme) {
                        selectedQuizz = quizz
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
    QuizzesListView()
}
