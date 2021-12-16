//
//  Forecast.swift
//  Weather App
//
//  Created by Keyhan Mortezaeifar on 12/12/21.
//

import SwiftUI

struct DayForecast: Identifiable{
    var id = UUID().uuidString
    var day: String
    var celsius: CGFloat
    var image: String
}

var forecast = [

    DayForecast(day: "Today", celsius: 7,image: "sun.min"),
    DayForecast(day: "Tuesday", celsius: 5,image: "cloud.sun"),
    DayForecast(day: "Wednesday", celsius: 7,image: "cloud.sun.bolt"),
    DayForecast(day: "Thursday", celsius: 4,image: "sun.max"),
    DayForecast(day: "Friday", celsius: 2,image: "cloud.sun"),
    DayForecast(day: "Saturday", celsius: 3,image: "cloud.sun"),
    DayForecast(day: "Sunday", celsius: 3,image: "sun.max"),
    DayForecast(day: "Monday", celsius: 4,image: "sun.max"),
    DayForecast(day: "Tuesday", celsius: 5,image: "cloud.sun.bolt"),
    DayForecast(day: "Wednesday", celsius: 5,image: "sun.min"),
]

