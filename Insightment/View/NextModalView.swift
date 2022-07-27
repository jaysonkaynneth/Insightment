//
//  NextModalView.swift
//  Insightment
//
//  Created by Jason Kenneth on 26/07/22.
//

import SwiftUI

struct NextModalView: View {
    var location = ["Start", "Stop", "Continue"]
    
    @Binding var showModal: Bool
    @State private var nextStep: String = ""
    @State private var locations = "Start"
    
    var body: some View {
        NavigationView {
            VStack {
                    List{
                        HStack {
                        Text("Next Step")
                            TextField("", text: $nextStep).textFieldStyle(.roundedBorder)
                        }
                    }.listStyle(.inset)
                    .padding(.top, 44)
                
                
                Spacer()
                
            }.navigationTitle(Text("Add Next Step"))
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
                            self.showModal.toggle()
                        } label: {
                            Text("Add")
                                .foregroundColor(Color(red: 251/255, green: 80/255, blue: 18/255))
                        }
                    }

            }
        }
    }
}

struct NextModalView_Previews: PreviewProvider {
    static var previews: some View {
        NextModalView(showModal: .constant(true))
    }
}


