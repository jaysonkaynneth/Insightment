//
//  FeedbackModalView.swift
//  Insightment
//
//  Created by Jason Kenneth on 26/07/22.
//

import SwiftUI

struct FeedbackModalView: View {
    @Environment(\.managedObjectContext) var moc
    
    var location = ["Start", "Stop", "Continue"]
    
    @Binding var showModal: Bool
    @State private var feedbacktext: String = ""
    @State private var locations = "Start"
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    Text("Feedback")
                
                    ZStack{
                        TextEditor(text: $feedbacktext).frame(minHeight: 150, maxHeight: 150)
                    }.shadow(radius: 1)
                    
                    HStack{
                    Text("Location")
                    Picker("", selection: $locations) {
                                    ForEach(location, id: \.self) {
                                        Text($0)
                                    }
                                }
                    }
                    
                }.listStyle(.inset)
                Text("You selected: \(locations)")
            }.navigationTitle(Text("Add Feedback"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("Add tapped!")
                        self.showModal.toggle()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color(red: 251/255, green: 80/255, blue: 18/255))
                        Text("Cancel")
                            .foregroundColor(Color(red: 251/255, green: 80/255, blue: 18/255))
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            print("Add tapped!")
                            let feedback = Feedback(context: moc)
                            
                            feedback.feedback = (feedbacktext)
                            feedback.location = (locations)
                            self.showModal.toggle()
                            try? moc.save()
                        } label: {
                            Text("Add")
                                .foregroundColor(Color(red: 251/255, green: 80/255, blue: 18/255))
                        }
                    }

            }
        }
    }

}

struct FeedbackModalView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackModalView(showModal: .constant(true))
    }
}


