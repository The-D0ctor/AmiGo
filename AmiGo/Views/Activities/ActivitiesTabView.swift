//
//  ActivitiesTabView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 29/10/2024.
//

import SwiftUI

struct ActivitiesTabView: View {
    @State var selectedActivity: Activity = .riddle
    
    var body: some View {
        ZStack {
            Color.offWhite.ignoresSafeArea(edges: .top)
            VStack {
                ActivityPicker(selection: $selectedActivity)
                    .frame(maxHeight: .infinity)
                Button {
                    selectedActivity = Activity.allCases.randomElement()!
                } label: {
                    Text("On choisit pour toi")
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.darkOrange)
                        .clipShape(.rect(cornerRadius: 10))
                }.padding(.bottom)
            }
        }
    }
}

#Preview {
    ActivitiesTabView()
}
