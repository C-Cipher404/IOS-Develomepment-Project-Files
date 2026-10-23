//
//  TopicDetailView.swift
//  Course3StudyGuide
//
//  Created by Cortney Anderson on 10/22/26.
//

import SwiftUI

struct TopicDetailView: View {

    let topic: Topic
    @Binding var studiedTopics: Set<String>

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Text(topic.summary)

                ForEach(topic.questions) { questionAnswer in
                    VStack(alignment: .leading, spacing: 8) {

                        Text(questionAnswer.question)
                            .font(.headline)
                            .bold()

                        Text(questionAnswer.answer)
                    }
                }

                Text("Example")
                    .font(.headline)
                    .bold()

                Text(topic.example)

                Button("Mark as Studied") {
                    studiedTopics.insert(topic.title)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle(topic.title)
    }
}

#Preview {
    TopicDetailView(
        topic: studyTopics[0],
        studiedTopics: .constant([])
    )
}
