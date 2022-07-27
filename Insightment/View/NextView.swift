//
//  NextView.swift
//  Insightment
//
//  Created by Jason Kenneth on 25/07/22.
//

import SwiftUI

struct NextView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Text("wazzap")
                    Text("What")
                }.listStyle(.inset)
                    .padding(.top, 25)

                
            }
            .navigationTitle(Text("Next Steps"))
            .toolbar {
                Button {
                    print("Add tapped!")
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}
