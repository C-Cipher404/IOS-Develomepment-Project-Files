//
//  ContentView.swift
//  Course3StudyGuide
//
//  Created by Cortney Anderson on 10/22/26.
//

import SwiftUI

struct ContentView: View {

    @State private var searchText = ""

    // Course 3 Concept: Set
    // Keeps track of which topics the user has marked as studied.
    @State private var studiedTopics: Set<String> = []

    var body: some View {
        NavigationStack {
            List(searchTopics(studyTopics, searchText: searchText)) { topic in
                NavigationLink {
                    TopicDetailView(
                        topic: topic,
                        studiedTopics: $studiedTopics
                    )
                } label: {
                    HStack {
                        Image(systemName: topic.icon)

                        Text(topic.title)

                        Spacer()

                        if studiedTopics.contains(topic.title) {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
            .navigationTitle("Course 3 Study Guide")
            .searchable(text: $searchText)
        }
    }

    // Course 3 Concept: Linear Search
    // Checks each topic one at a time to find a match.
    // Big-O: O(n)
    func searchTopics(_ topics: [Topic], searchText: String) -> [Topic] {

        if searchText.isEmpty {
            return topics
        }

        var results: [Topic] = []

        for topic in topics {

            if topic.title.lowercased().contains(searchText.lowercased()) {
                results.append(topic)
                continue
            }

            if topic.summary.lowercased().contains(searchText.lowercased()) {
                results.append(topic)
                continue
            }

            for question in topic.questions {
                if question.answer.lowercased().contains(searchText.lowercased()) {
                    results.append(topic)
                    break
                }
            }
        }

        return results
    }
}

#Preview {
    ContentView()
}
