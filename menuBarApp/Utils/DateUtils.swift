//
//  DateUtils.swift
//  menuBarApp
//
//  Created by 박성민 on 3/29/25.
//

import Foundation

struct DateUtils {
    static func dateFromTimeString(_ timeString: String) -> Date? {
        let today = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: today)
        let timeParts = timeString.split(separator: ":")
        if timeParts.count == 2,
           let hour = Int(timeParts[0]),
           let minute = Int(timeParts[1]) {
            var newComponents = DateComponents()
            newComponents.year = components.year
            newComponents.month = components.month
            newComponents.day = components.day
            newComponents.hour = hour
            newComponents.minute = minute
            return calendar.date(from: newComponents)
        }
        return nil
    }
    
    static func formatTimeInterval(_ interval: TimeInterval) -> String {
        let totalSeconds = Int(interval)
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
}
