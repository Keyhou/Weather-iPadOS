//
//  HourlyForecast.swift
//  Weather App
//
//  Created by Keyhan Mortezaeifar on 15/12/21.
//

import Foundation

struct ForecastView: Identifiable {
    var id = UUID().uuidString
    var time: String
    var celcius: String
    var image: String
}


var hourlyforcast = [

    ForecastView(time: "Now",celcius: "-3˚",image: "snowflake"),
    
    ForecastView(time: "06",celcius: "-2˚",image: "snowflake"),
    
    ForecastView(time: "07",celcius: "-2˚",image: "snowflake"),
    
    ForecastView(time: "07:18",celcius: "Sunrise",image: "sunrise.fill"),
    
    ForecastView(time: "08",celcius: "-1˚",image: "snowflake"),
    
    ForecastView(time: "09",celcius: "-1˚",image: "snowflake"),
    
    ForecastView(time: "10",celcius: "0˚",image: "cloud"),
    
    ForecastView(time: "11",celcius: "1˚",image: "cloud"),
    
    ForecastView(time: "12",celcius: "1˚",image: "cloud.sun"),
    
    ForecastView(time: "13",celcius: "1˚",image: "sun.min"),
    
    ForecastView(time: "14",celcius: "2˚",image: "sun.min"),

    ForecastView(time: "15",celcius: "1˚",image: "cloud.sun"),

    ForecastView(time: "16",celcius: "1˚",image: "cloud.sun"),

    ForecastView(time: "16:35",celcius: "1˚",image: "sunset.fill"),

    ForecastView(time: "17",celcius: "0˚",image: "moon.stars.fill"),

    ForecastView(time: "18",celcius: "0˚",image: "moon"),

    ForecastView(time: "19",celcius: "-1˚",image: "cloud.moon"),

    ForecastView(time: "20",celcius: "-1˚",image: "cloud.bolt"),

    ForecastView(time: "21",celcius: "-2˚",image: "cloud.rain"),

    ForecastView(time: "22",celcius: "0˚",image: "cloud.moon"),
    
    ForecastView(time: "23",celcius: "-1˚",image: "cloud.bolt"),

    ForecastView(time: "00",celcius: "-2˚",image: "cloud.rain"),

    ForecastView(time: "01",celcius: "-2˚",image: "cloud.rain"),

    ForecastView(time: "02",celcius: "0˚",image: "cloud.bolt"),

    ForecastView(time: "03",celcius: "-1˚",image: "cloud.bolt"),

    ForecastView(time: "04",celcius: "-2˚",image: "snowflake"),
    
    ]
