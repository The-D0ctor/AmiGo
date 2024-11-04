//
//  RiddlesListView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 29/10/2024.
//

import SwiftUI

struct RiddlesListView: View {
    let riddles: [ActivityGuess]
    
    @Binding var selectedRidle: ActivityGuess
    @Binding var showModal: Bool
    //@Binding var random: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(riddles.indices, id: \.self) { indice in
                    RoundedCornerBorderButton(text: riddles[indice].theme, backgroundColor: indice % 2 == 0 ? .creme : .lightTurquoise, strokeColor: indice % 2 == 0 ? .accent : .turquoise) {
                        selectedRidle = riddles[indice]
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
                    RiddleModalView(riddle: $selectedRidle, showModal: $showModal)
                        .presentationDetents([.medium])
                        .padding(30)
                }
            }
            /*.onChange(of: random) {
                print(random)
                if random {
                    showModal = true
                    random = false
                }
            }*/
        }
    }
}

#Preview {
    RiddlesListView(riddles: [
        ActivityGuess(question: "Quelle est la plus basse note de musique ?", answers: [], solution: "Fa, parce qu’elle est sous le sol.", theme: "Musique")], selectedRidle: .constant(ActivityGuess(question: "Quelle est la plus basse note de musique ?", answers: [], solution: "Fa, parce qu’elle est sous le sol.", theme: "Musique")), showModal: .constant(false))
}
