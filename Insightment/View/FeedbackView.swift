//
//  FeedbackView.swift
//  Insightment
//
//  Created by Jason Kenneth on 25/07/22.
//

import SwiftUI


struct FeedbackView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var feedbacks: FetchedResults<Feedback>
    @State private var selectedIndex = "Start"
    @State private var showModal = false
    
    
    var body: some View {
        NavigationView{
            VStack{
                Picker("Favorite Color", selection: $selectedIndex, content: {
                    Text("Start").tag("Start")
                    Text("Stop").tag("Stop")
                    Text("Continue").tag("Continue")
                })
                .pickerStyle(SegmentedPickerStyle())
                .padding(.top, 25)
                
                if selectedIndex == "Start" {
                    List{
                        ForEach(feedbacks.filter{
                            $0.location == "Start"
                        }) { feedback in
                        
                                Text(feedback.feedback ?? "no feedback")
                            
                        }.onDelete(perform: deleteItems)

                    }.listStyle(.inset)
                        .padding(.top, 25)
                    
         
                    
                } else if selectedIndex == "Stop" {
                    List{
                        ForEach(feedbacks.filter{
                            $0.location == "Stop"
                        }) { feedback in
                        
                                Text(feedback.feedback ?? "no feedback")
                            
                        }.onDelete(perform: deleteItems)

                    }.listStyle(.inset)
                        .padding(.top, 25)
                    
                } else {
                    List{
                        ForEach(feedbacks.filter{
                            $0.location == "Continue"
                        }) { feedback in
                           
                                Text(feedback.feedback ?? "no feedback")
                            
                        }.onDelete(perform: deleteItems)

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
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { feedbacks[$0] }.forEach(moc.delete)

            do {
                try moc.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

