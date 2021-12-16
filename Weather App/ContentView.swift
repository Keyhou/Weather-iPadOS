//
//  ContentView.swift
//  Weather App
//
//  Created by Keyhan Mortezaeifar on 06/12/21.
//

import SwiftUI

// Not even intagrating the real datas from AccuWeather in this project since it's not finished in time

struct ContentView: View {
    
    var body: some View {

        GeometryReader { proxy in
            let topEdge = proxy.safeAreaInsets.top

            Home(topEdge: topEdge)
                .ignoresSafeArea(.all, edges: .top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
