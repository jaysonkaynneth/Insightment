//
//  FeedbackModalView.swift
//  Insightment
//
//  Created by Jason Kenneth on 26/07/22.
//

import SwiftUI

struct FeedbackModalView: View {
    @Binding var showModal: Bool
    @State private var feedback: String = ""
    
    var body: some View {
        VStack {
            List{
                Text("Feedback").frame(width: 390
                                       , height: .infinity, alignment: .leading)
            
                ZStack{
                    TextEditor(text: $feedback).frame(minWidth: 0, minHeight: 150, maxHeight: 150)
                
                }.shadow(radius: 1)
            }.listStyle(.inset)
            
            
            
            Button("Dismiss") {
                self.showModal.toggle()
            }
        }
    }
}

struct FeedbackModalView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackModalView(showModal: .constant(true))
    }
}
