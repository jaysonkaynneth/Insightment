//
//  NextModalView.swift
//  Insightment
//
//  Created by Jason Kenneth on 27/07/22.
//

import SwiftUI

struct NextModalView: View {
    var location = ["Start", "Stop", "Continue"]
    
    @Binding var showModal: Bool
    @State private var feedback: String = ""
    @State private var locations = "Start"
    
    var body: some View {
        VStack {
            HStack(alignment: .top){
                
                Button {
                    print("Add tapped!")
                    self.showModal.toggle()
                } label: {
                    Image(systemName: "chevron.left")      .foregroundColor(Color(red: 251/255, green: 80/255, blue: 18/255))
                    Text("Cancel")
                        .foregroundColor(Color(red: 251/255, green: 80/255, blue: 18/255))
                }
                Spacer()
                    Button("Add") {
                        self.showModal.toggle()
                    }.foregroundColor(Color(red: 251/255, green: 80/255, blue: 18/255))
            }.padding()
            List{
                Text("Next Step")
                ZStack{
                    TextEditor(text: $feedback).frame(minHeight: 150, maxHeight: 150)
                }.shadow(radius: 1)
                
            }.listStyle(.inset)
        }
    }
}

struct NextModalView_Previews: PreviewProvider {
    static var previews: some View {
        NextModalView(showModal: .constant(true))
    }
}
