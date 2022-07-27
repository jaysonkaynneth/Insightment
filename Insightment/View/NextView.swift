//
//  NextView.swift
//  Insightment
//
//  Created by Jason Kenneth on 25/07/22.
//

import SwiftUI

struct NextView: View {
    @State private var showModal = false
    
    var body: some View {
        NavigationView{
            VStack{
                    List {
                        Text("Hi")
                    }.listStyle(.inset)
                        .padding(.top, 25)
            }
            .navigationTitle(Text("Next Steps"))
            .toolbar {
                Button {
                    print("Add tapped!")
                    self.showModal.toggle()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color(red: 251/255, green: 80/255, blue: 18/255))
                }
                .sheet(isPresented: $showModal) {
                    NextModalView(showModal: self.$showModal)
                }
            }
        }
    }
}

