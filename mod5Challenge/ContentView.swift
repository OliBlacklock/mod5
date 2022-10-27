//
//  ContentView.swift
//  mod5Challenge
//
//  Created by Oliver on 27/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model: Model
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(model.videos) {video in
                    
                    Text(video.title)
                }
            }
            .environment(\.defaultMinListRowHeight, 80)
            .navigationTitle("Videos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: Model())
    }
}
