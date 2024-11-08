
//
//  CircularProgressBar.swift
//  iosApp
//
//  Created by Vitaly on 20220721.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

/**
 # ``CircularProgressBar`` is a circle shaped progress bar.
  ``progress``  progress value with a range from 0 to 1
  ``text``  text that displayed inside of the circle

 # Example of usage:
 ```swift
     CircularProgressBar(progress: $progress, text: $text)
 ```
 */

struct CircularProgressBar: View {

    @Binding var progress: Double
    
    let text: String

    var body: some View {
        ZStack {
            CircularTimer(interval: 60, progress: progress)

            Text(text)
                .foregroundColor(Constants.textColor)
                .font(Constants.font)
        }
        .frame(width: Constants.frameSize, height: Constants.frameSize)
    }
}

private enum Constants {
    static let textColor = Color(hex: 0xFF011e41)
    static let font = Font.custom("MetricLight", size: 46)
    static let frameSize: CGFloat = 234.0
}
