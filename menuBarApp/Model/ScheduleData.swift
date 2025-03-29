//
//  ScheduleData.swift
//  menuBarApp
//
//  Created by 박성민 on 3/29/25.
//

import Foundation

struct ScheduleData {
    static let weekdaySchedules: [DailySchedule] = [
        DailySchedule(weekday: .monday, classPeriods: [
            ClassPeriod(periodNumber: 1, subject: "자율", startTime: "08:40", endTime: "09:30"),
            ClassPeriod(periodNumber: 2, subject: "프로젝트", startTime: "09:40", endTime: "10:30"),
            ClassPeriod(periodNumber: 3, subject: "프로젝트", startTime: "10:40", endTime: "11:30"),
            ClassPeriod(periodNumber: 4, subject: "성직", startTime: "11:40", endTime: "12:30"),
            ClassPeriod(periodNumber: 5, subject: "프로젝트", startTime: "13:40", endTime: "14:30"),
            ClassPeriod(periodNumber: 6, subject: "정보통신", startTime: "14:40", endTime: "15:30"),
            ClassPeriod(periodNumber: 7, subject: "정보통신", startTime: "15:50", endTime: "16:30"),
            ClassPeriod(periodNumber: 8, subject: "방과후", startTime: "16:40", endTime: "18:10"),
            ClassPeriod(periodNumber: 9, subject: "야자", startTime: "19:10", endTime: "20:30")
        ]),
        DailySchedule(weekday: .tuesday, classPeriods: [
            ClassPeriod(periodNumber: 1, subject: "응프", startTime: "08:40", endTime: "09:30"),
            ClassPeriod(periodNumber: 2, subject: "응프", startTime: "09:40", endTime: "10:30"),
            ClassPeriod(periodNumber: 3, subject: "응프", startTime: "10:40", endTime: "11:30"),
            ClassPeriod(periodNumber: 4, subject: "스생", startTime: "11:40", endTime: "12:30"),
            ClassPeriod(periodNumber: 5, subject: "정보과학", startTime: "13:40", endTime: "14:30"),
            ClassPeriod(periodNumber: 6, subject: "정보과학", startTime: "14:40", endTime: "15:30"),
            ClassPeriod(periodNumber: 7, subject: "정보과학", startTime: "15:50", endTime: "16:30"),
            ClassPeriod(periodNumber: 8, subject: "방과후", startTime: "16:40", endTime: "18:10"),
            ClassPeriod(periodNumber: 9, subject: "야자", startTime: "19:10", endTime: "20:30")
        ]),
        DailySchedule(weekday: .wednesday, classPeriods: [
            ClassPeriod(periodNumber: 1, subject: "응프", startTime: "08:40", endTime: "09:30"),
            ClassPeriod(periodNumber: 2, subject: "응프", startTime: "09:40", endTime: "10:30"),
            ClassPeriod(periodNumber: 3, subject: "응프", startTime: "10:40", endTime: "11:30"),
            ClassPeriod(periodNumber: 4, subject: "프로젝트", startTime: "11:40", endTime: "12:30"),
            ClassPeriod(periodNumber: 5, subject: "프로젝트", startTime: "13:40", endTime: "14:30"),
            ClassPeriod(periodNumber: 6, subject: "스생", startTime: "14:40", endTime: "15:30"),
            ClassPeriod(periodNumber: 7, subject: "방과후", startTime: "15:50", endTime: "18:10"),
            ClassPeriod(periodNumber: 8, subject: "야자", startTime: "19:10", endTime: "20:30")
        ]),
        DailySchedule(weekday: .thursday, classPeriods: [
            ClassPeriod(periodNumber: 1, subject: "빅데이터", startTime: "08:40", endTime: "09:30"),
            ClassPeriod(periodNumber: 2, subject: "빅데이터", startTime: "09:40", endTime: "10:30"),
            ClassPeriod(periodNumber: 3, subject: "진로", startTime: "10:40", endTime: "11:30"),
            ClassPeriod(periodNumber: 4, subject: "성직", startTime: "11:40", endTime: "12:30"),
            ClassPeriod(periodNumber: 5, subject: "프로젝트", startTime: "13:40", endTime: "14:30"),
            ClassPeriod(periodNumber: 6, subject: "프로젝트", startTime: "14:40", endTime: "15:30"),
            ClassPeriod(periodNumber: 7, subject: "프로젝트", startTime: "15:50", endTime: "16:30"),
            ClassPeriod(periodNumber: 8, subject: "방과후", startTime: "16:40", endTime: "18:10"),
            ClassPeriod(periodNumber: 9, subject: "야자", startTime: "19:10", endTime: "20:30")
        ]),
        DailySchedule(weekday: .friday, classPeriods: [
            ClassPeriod(periodNumber: 1, subject: "빅데이터", startTime: "08:40", endTime: "09:30"),
            ClassPeriod(periodNumber: 2, subject: "빅데이터", startTime: "09:40", endTime: "10:30"),
            ClassPeriod(periodNumber: 3, subject: "빅데이터", startTime: "10:40", endTime: "11:30"),
            ClassPeriod(periodNumber: 4, subject: "정보통신", startTime: "11:40", endTime: "12:30"),
            ClassPeriod(periodNumber: 5, subject: "동아리", startTime: "13:40", endTime: "14:30")
        ])
    ]
}
