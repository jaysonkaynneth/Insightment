//
//  FeedbackModalView.swift
//  Insightment
//
//  Created by Jason Kenneth on 26/07/22.
//

import SwiftUI

struct FeedbackModalView: View {
    @Environment(\.managedObjectContext) var moc
    
    var locationName = ["Start", "Stop", "Continue"]
    
    @Binding var showModal: Bool
    @State private var feedbacktext: String = ""
    @State private var locations = "Start"
    @State private var isShowing = false
    @State private var amount = 0.0
    
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
                        Spacer()
                    Picker("", selection: $locations) {
                                    ForEach(locationName, id: \.self) {
                                        Text($0)
                                    }
                    }.pickerStyle(.menu)
                            .frame(width: 100, height: 32)
                            .foregroundColor(.red)
                        
                            .background(.white)
                            .cornerRadius(6)
                            .shadow(radius: 3)
                            .padding()
                }
                    
                }.listStyle(.inset)
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


