//
//  ContentView.swift
//  Elec_Test
//
//  Created by Jameel Shammr on 28/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress = 0.5
    
    var body: some View {
        VStack {
            Image(systemName: Constants.iconName)
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(Constants.titleText)
            CircularProgressBar(progress: $progress,
                                text: Constants.progressBarText)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private enum Constants {
    static let iconName: String = "globe"
    static let titleText: String = "Hello, world!"
    static let progressBarText: String = "TEST"
}
