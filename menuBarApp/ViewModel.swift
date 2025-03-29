import Foundation
import Combine
import SwiftUI

class DateViewModel: ObservableObject {
    @Published var currentPeriodInfo: String = ""
    @Published var countdownInfo: String = ""
    
    @Published var progressValue: CGFloat = 0.0
    
    private var timer: Timer?
    
    let classPeriods: [ClassPeriod] = [
        ClassPeriod(periodNumber: 1, subject: "1교시", startTime: "08:40", endTime: "09:30"),
        ClassPeriod(periodNumber: 2, subject: "2교시", startTime: "09:40", endTime: "10:30"),
        ClassPeriod(periodNumber: 3, subject: "3교시", startTime: "10:40", endTime: "11:30"),
        ClassPeriod(periodNumber: 4, subject: "4교시", startTime: "11:40", endTime: "12:30"),
        ClassPeriod(periodNumber: 5, subject: "5교시", startTime: "13:40", endTime: "14:30"),
        ClassPeriod(periodNumber: 6, subject: "6교시", startTime: "14:40", endTime: "15:30"),
        ClassPeriod(periodNumber: 7, subject: "7교시", startTime: "15:50", endTime: "16:30"),
        ClassPeriod(periodNumber: 8, subject: "방과후", startTime: "16:40", endTime: "18:10"),
        ClassPeriod(periodNumber: 9, subject: "야자", startTime: "19:10", endTime: "20:30")
    ]
    
    var scheduleSegments: [ScheduleSegment] {
        var segments = [ScheduleSegment]()
        
        if let first = classPeriods.first {
            segments.append(
                ScheduleSegment(title: first.subject,
                                startTime: first.startTime,
                                endTime: first.endTime)
            )
        }
        
        for i in 1..<classPeriods.count {
            let previous = classPeriods[i - 1]
            let current = classPeriods[i]
            
            let breakStart = previous.endTime
            let breakEnd = current.startTime
            
            var breakTitle = "쉬는시간"
            if previous.periodNumber == 4 && current.periodNumber == 5 {
                breakTitle = "점심시간"
            } else if previous.subject == "방과후" && current.subject == "야자" {
                breakTitle = "저녁시간"
            }
            
            segments.append(
                ScheduleSegment(title: breakTitle,
                                startTime: breakStart,
                                endTime: breakEnd)
            )
            
            segments.append(
                ScheduleSegment(title: current.subject,
                                startTime: current.startTime,
                                endTime: current.endTime)
            )
        }
        
        return segments
    }
    
    init() {
        updateTime()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.updateTime()
        }
    }
    
    func updateTime() {
        let now = Date()
        let segments = scheduleSegments
        
        var currentSegment: ScheduleSegment? = nil
        
        for segment in segments {
            guard let segStart = DateUtils.dateFromTimeString(segment.startTime),
                  let segEnd = DateUtils.dateFromTimeString(segment.endTime) else { continue }
            
            if now >= segStart && now < segEnd {
                currentSegment = segment
                break
            }
        }
        
        if let current = currentSegment {
            currentPeriodInfo = "\(current.title)\n\(current.startTime) ~ \(current.endTime)"
            
            if let segStart = DateUtils.dateFromTimeString(current.startTime),
               let segEnd = DateUtils.dateFromTimeString(current.endTime) {
                
                let remaining = segEnd.timeIntervalSince(now)
                let total = segEnd.timeIntervalSince(segStart)
                
                if remaining > 0 {
                    countdownInfo = "\(current.title) 종료까지 남은 시간: " + DateUtils.formatTimeInterval(remaining)
                } else {
                    countdownInfo = ""
                }
                
                let fraction = remaining / total
                progressValue = CGFloat(max(0, min(1, fraction)))
                
            } else {
                progressValue = 0
            }
        }
        else {
            if let first = segments.first,
               let firstStart = DateUtils.dateFromTimeString(first.startTime),
               now < firstStart {
                currentPeriodInfo = "수업 전"
                let remaining = firstStart.timeIntervalSince(now)
                countdownInfo = "다음 시작까지 남은 시간: " + DateUtils.formatTimeInterval(remaining)
            } else if let last = segments.last,
                      let lastEnd = DateUtils.dateFromTimeString(last.endTime),
                      now >= lastEnd {
                currentPeriodInfo = "수업 종료"
                countdownInfo = ""
            }
            progressValue = 0
        }
    }
}
