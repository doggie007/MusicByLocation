//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Tcheng, James (BJH) on 24/02/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var state = StateController()
    var body: some View {
        VStack{
            Image(uiImage: UIImage(named: "AppIcon") ?? UIImage())
            Text("Music By Location")
                .foregroundColor(.blue)
                .bold()
                .font(.largeTitle)
//            Text(state.artistsByLocation)
//                .padding()
            List{
                ForEach(state.artistsByLocation, id: \.self){name in
                    Text(name)
                }
            }
            Spacer()
            Button("Find Music", action: {
                state.findMusic()
            })
                .padding()
                .background(Color(red: 0, green: 0, blue: 0.5))
                .foregroundColor(.white)
                .clipShape(Capsule())
                .padding()
        }.onAppear(perform: {
            state.requestAccessToLocationData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
