//
//  CircularTimerViewModel.swift
//  iosApp
//
//  Created by Mohamed Alwakil on 2022-10-18.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import Combine

typealias ProgressTimer = Publishers.Autoconnect<Timer.TimerPublisher>

class CircularTimerViewModel: ObservableObject {

    struct Time {

        let hours: Int
        let minutes: Int
        let seconds: Int

        var interval: TimeInterval {
            TimeInterval((hours * 3600) + (minutes * 60) + seconds)
        }
    }

    @Published var progress: CGFloat = 0
    @Published var timerDurationLeft: TimeInterval

    let timer: ProgressTimer
    private let timeStep = 0.25
    private let stepProgress: CGFloat

    var cancellable: Cancellable?

    init(interval: TimeInterval, progress: CGFloat) {

        self.progress = progress
        self.stepProgress = timeStep / CGFloat(interval)

        self.timerDurationLeft = interval * (1 - progress)

        timer = Timer.publish(every: timeStep, on: .main, in: .common).autoconnect()

        cancellable = timer.upstream.connect()
        
        timer
            .receive(on: DispatchQueue.main)
            .compactMap { [weak self] _ in

                guard let self = self
                else { return 0 }

                if self.progress >= 1.0 || self.timerDurationLeft <= 0 {

                    self.cancellable?.cancel()
                    return 1.0
                } else {

                    self.timerDurationLeft -= self.timeStep
                    let newProgress = (interval - self.timerDurationLeft) / interval
                    print("progress \(newProgress)")
                    return newProgress
                }
            }
            .removeDuplicates()
            .assign(to: &$progress)
    }

    func textFromTimeInterval() -> String? {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = [.default]
        return formatter.string(from: timerDurationLeft)
    }
}
