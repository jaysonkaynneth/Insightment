//
//  MainView.swift
//  Insightment
//
//  Created by Jason Kenneth on 25/07/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
        FeedbackView()
                .tabItem {
                    Label("Feedback", systemImage: "face.smiling")
                }
            
        NextView()
                .tabItem {
                    Label("Next Steps", systemImage: "arrow.right.square")

                }
        }.accentColor(Color(red: 251/255, green: 80/255, blue: 18/255))
    } 
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

