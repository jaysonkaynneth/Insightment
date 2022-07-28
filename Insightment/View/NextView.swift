//
//  NextView.swift
//  Insightment
//
//  Created by Jason Kenneth on 25/07/22.
//

import SwiftUI

struct NextView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var nextSteps: FetchedResults<NextStep>
    @State private var showModal = false
    @State private var tapped = false
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(nextSteps) { nextstep in
                        HStack{
                            Text(nextstep.nextstep ?? "no feedback")
                            Spacer()
                            Button {
                                nextstep.done.toggle()
                                try? moc.save()
                            } label: {
                                Image(systemName: nextstep.done ? "checkmark" : "")
                                    .foregroundColor(Color(red: 251/255, green: 80/255, blue: 18/255))
                            }

                        }
                            .onTapGesture {
                                print("Tapped cell")
                                
                    }
                            
                            
                    }.onDelete(perform: deleteItems)
                     

                    
                    
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
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { nextSteps[$0] }.forEach(moc.delete)

            do {
                try moc.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

