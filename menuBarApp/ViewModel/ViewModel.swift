import Foundation
import Combine
import SwiftUI

class DateViewModel: ObservableObject {
    
    @Published var currentPeriodInfo: String = ""
    @Published var countdownInfo: String = ""
    @Published var progressValue: CGFloat = 0.0
    @Published var showProgressBar: Bool = false
    
    var isTesting: Bool = true
    
    private var timer: Timer?
    
    let weekdaySchedules = ScheduleData.weekdaySchedules
    
    var currentDaySchedule: DailySchedule? {
        let weekdayValue = isTesting ? 2 : Calendar.current.component(.weekday, from: Date())
        guard let weekday = Weekday(rawValue: weekdayValue) else { return nil }
        return weekdaySchedules.first { $0.weekday == weekday }
    }
    
    var scheduleSegments: [ScheduleSegment] {
        guard let periods = currentDaySchedule?.classPeriods else { return [] }
        var segments = [ScheduleSegment]()
        
        if let first = periods.first {
            segments.append(
                ScheduleSegment(title: first.subject,
                                startTime: first.startTime,
                                endTime: first.endTime)
            )
        }
        
        for i in 1..<periods.count {
            let previous = periods[i - 1]
            let current = periods[i]
            
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
        let weekdayValue = isTesting ? 2 : Calendar.current.component(.weekday, from: Date())
        
        if !isTesting && (weekdayValue == 1 || weekdayValue == 7) {
            currentPeriodInfo = "주말입니다"
            countdownInfo = ""
            progressValue = 0
            showProgressBar = false
            return
        }
        
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
            showProgressBar = true
        } else {
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
            showProgressBar = false
        }
    }
}
