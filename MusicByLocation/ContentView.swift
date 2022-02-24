//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Tcheng, James (BJH) on 24/02/2022.
//

import SwiftUI

struct ContentView: View {
    let locationHandler = LocationHandler()
    var body: some View {
        VStack{
            Text("Hello, world!")
                .padding()
            Spacer()
            Button("Find Music", action: {})
        }.onAppear(perform: {
            locationHandler.requestAuthorisation()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
