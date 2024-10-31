//
//  ActivityPicker.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 30/10/2024.
//

import SwiftUI

struct ActivityPicker: View {
    private let selection: Binding<Activity>
    
    init(selection: Binding<Activity>) {
        self.selection = selection
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Activity.allCases, id: \.self) { activity in
                    Button {
                        selection.wrappedValue = activity
                    } label: {
                        Text(activity.rawValue)
                            .padding()
                            .background(selection.wrappedValue == activity ? Color.darkOrange : .gray)
                            .clipShape(.rect(cornerRadius: 10))
                            .foregroundStyle(.white)
                            .font(.custom("Poppins", size: 14))
                    }
                }
            }.padding(.horizontal)
            TabView(selection: selection) {
                RiddlesListView().tag(Activity.riddle)
                QuizzListView().tag(Activity.quizz)
                GamesListView().tag(Activity.game)
                SubjectConvsView().tag(Activity.subjectConv)
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .animation(.easeInOut, value: selection.wrappedValue)
        }
    }
}

#Preview {
    ActivityPicker(selection: .constant(.quizz))
}
