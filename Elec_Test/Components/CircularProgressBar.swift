
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

    @Binding var progress: Float
    @Binding var text: String

    var body: some View {
        ZStack {
            CircularTimer(interval: 60, progress: 0.5)

            Text(text)
                .foregroundColor(Color(hex: 0xFF011e41))
                .font(.custom("MetricLight", size: 46))
        }
        .frame(width: 234.0, height: 234.0)
    }
}
