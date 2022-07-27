//
//  FeedbackView.swift
//  Insightment
//
//  Created by Jason Kenneth on 25/07/22.
//

import SwiftUI

struct Feedback: Identifiable {
    let id: UUID = UUID()
    let feedback: String
}

struct FeedbackView: View {
    @State private var selectedIndex = 0
    @State private var showModal = false
    
    let feedbacks = [
        Feedback(feedback: "You are cool"),
        Feedback(feedback: "You are not cool"),
        Feedback(feedback: "You are hot")
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                Picker("Favorite Color", selection: $selectedIndex, content: {
                    Text("Start").tag(0)
                    Text("Stop").tag(1)
                    Text("Continue").tag(2)
                })
                .pickerStyle(SegmentedPickerStyle())
                .padding(.top, 25)
                
                if selectedIndex == 0 {
                    List {
                        Text("Hi")
                    }.listStyle(.inset)
                        .padding(.top, 25)
                    
                } else if selectedIndex == 1 {
                    List {
                        Text("Beep")
                    }.listStyle(.inset)
                        .padding(.top, 25)
                    
                } else {
                    List {
                        Text("Boop")
                    }.listStyle(.inset)
                        .padding(.top, 25)
                }
                
            }
            .navigationTitle(Text("Feedbacks"))
            .toolbar {
                Button {
                    print("Add tapped!")
                    self.showModal.toggle()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color(red: 251/255, green: 80/255, blue: 18/255))
                }
                .sheet(isPresented: $showModal) {
                    FeedbackModalView(showModal: self.$showModal)
                }
            }
        }
    }
}

