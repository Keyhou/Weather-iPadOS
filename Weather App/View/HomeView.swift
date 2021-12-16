//
//  Home.swift
//  Weather App
//
//  Created by Keyhan Mortezaeifar on 06/12/21.
//

import SwiftUI
import SpriteKit

public struct Home: View {
    
    @State var offset: CGFloat = 0
    var topEdge: CGFloat
    
    // to avoid early starting of landing animation
    @State var showSnow = false
    // were going to delay start it
    
    public var body: some View {
        
        ZStack {
            
            // Geometry Reader for getting height and width
            GeometryReader { proxy in
                
                Image("sky1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .ignoresSafeArea()
            // Blur Material...
            .overlay(.ultraThinMaterial)
            
            // Rain Fall View
            // May be its a bug
            // while scrolling it gets restarted
            
            // to avoid..
            GeometryReader {_ in
                SpriteView(scene: SnowFall(),options: [.allowsTransparency])
            }
            .ignoresSafeArea()
            .opacity(showSnow ? 1 : 0)
            
            // Main View
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    // Weather Data...
                    VStack(alignment: .center, spacing: 5) {
                        
                        Text("North Pole")
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                        
                        Text(" -1˚")
                            .font(.system(size: 85))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpactiy())
                        
                        Text("Snow Showers")
                            .foregroundStyle(.primary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpactiy())
                        
                        Text("High: 1˚ Low: -4˚")
                            .foregroundStyle(.primary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpactiy())
                    }
                    .offset(y: -offset)
                    // For Bototm Drag Effect...
                    .offset(y: offset > 0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)
                    .offset(y: getTitleOffset())
                    
                    // Custom Data View...
                    VStack(spacing: 8){
                        
                        // Custom Stack....
                        CustomStackView {
                            
                            // Label Here....
                            Label {
                                Text("HOURLY FORECAST")
                            } icon: {
                                Image(systemName: "clock")
                            }
                            
                            
                        } contentView: {
                            
                            // Content...
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack(spacing: 15) {
                                    
                                    ForEach(hourlyforcast) { hourly in
                                        VStack(spacing: 15) {
                                            
                                            Text(hourly.time)
                                                .font(.callout.bold())
                                                .foregroundStyle(.white)
                                            
                                            Image(systemName: hourly.image)
                                                .font(.title2)
                                            // MultiColor...
                                                .symbolVariant(.fill)
                                                .symbolRenderingMode(.palette)
                                                .foregroundStyle(.white, .yellow)
                                            // max Frame...
                                                .frame(height: 30)
                                            
                                            Text("\(hourly.celcius)")
                                                .font(.callout.bold())
                                                .foregroundStyle(.white)
                                        }
                                        .padding(.horizontal, 10)
                                    }
                                    
                                    
                                    
                                    
//                                    Group {
//
//                                        ForecastView(time: "Now",celcius: "-3˚",image: "snowflake")
//
//                                        ForecastView(time: "06",celcius: "-2˚",image: "snowflake")
//
//                                        ForecastView(time: "07",celcius: "-2˚",image: "snowflake")
//
//                                        ForecastView(time: "07:20",celcius: "Sunrise",image: "sunrise.fill")
//
//                                        ForecastView(time: "08",celcius: "-1˚",image: "snowflake")
//
//                                        ForecastView(time: "09",celcius: "-1˚",image: "snowflake")
//
//                                        ForecastView(time: "10",celcius: "0˚",image: "cloud")
//
//                                        ForecastView(time: "11",celcius: "1˚",image: "cloud")
//
//                                        ForecastView(time: "12",celcius: "1˚",image: "cloud.sun")
//
//                                        ForecastView(time: "13",celcius: "1˚",image: "sun.min")
//
//
//                                    }
                                    
//                                    Group {
//
//                                        ForecastView(time: "14",celcius: "2˚",image: "sun.min")
//
//                                        ForecastView(time: "15",celcius: "1˚",image: "cloud.sun")
//
//                                        ForecastView(time: "16",celcius: "1˚",image: "cloud.sun")
//
//                                        ForecastView(time: "16:36",celcius: "1˚",image: "sunset.fill")
//
//                                        ForecastView(time: "17",celcius: "0˚",image: "moon.stars.fill")
//
//                                        ForecastView(time: "18",celcius: "0˚",image: "moon")
//
//                                        ForecastView(time: "19",celcius: "-1˚",image: "cloud.moon")
//
//                                        ForecastView(time: "20",celcius: "-1˚",image: "cloud.bolt")
//
//                                        ForecastView(time: "21",celcius: "-2˚",image: "cloud.rain")
//
//                                        ForecastView(time: "22",celcius: "0˚",image: "cloud.moon")
//
//
//                                    }
//                                    ForecastView(time: "23",celcius: "-1˚",image: "cloud.bolt")
//
//                                    ForecastView(time: "00",celcius: "-2˚",image: "cloud.rain")
//
//                                    ForecastView(time: "01",celcius: "-2˚",image: "cloud.rain")
//
//                                    ForecastView(time: "02",celcius: "0˚",image: "cloud.bolt")
//
//                                    ForecastView(time: "03",celcius: "-1˚",image: "cloud.bolt")
//
//                                    ForecastView(time: "04",celcius: "-2˚",image: "snowflake")
                                    
                                }
                                
                            }
                        }
                        
                        WeatherDataView()
                        
                    }
                    .background(
                        GeometryReader{_ in
                            
                            SpriteView(scene: SnowFallLanding(),options: [.allowsTransparency])
                                .offset(y: UIScreen.main.bounds.height < 750 ? -12 : -10)
                            
                        }
                            .offset(y: -(offset + topEdge) > 90 ? -(offset + (90 + topEdge)) : 0)
                            .opacity(showSnow ? 1 : 0)
                        
                    )
                    .padding(.top,20)
                }
                .padding(.top,25)
                .padding(.top,topEdge)
                .padding([.horizontal,.bottom])
                // getting Offset....
                .overlay(
                    
                    // Using Geometry Reader....
                    GeometryReader{proxy -> Color in
                        
                        let minY = proxy.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            self.offset = minY
                            
                        }
                        
                        return Color.clear
                        
                    }
                )
            }
        }
        .onAppear {
            
            //            Delay of the SnowFall animation
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){
                withAnimation {
                    showSnow = true
                }
            }
        }
    }
    
    func getTitleOpactiy()->CGFloat{
        
        let titleOffset = -getTitleOffset()
        
        let progress = titleOffset / 20
        
        let opacity = 1 - progress
        
        return opacity
    }
    
    func getTitleOffset() -> CGFloat {
        
        // setting one max height for whole title...
        // consider max as 120....
        if offset < 0 {
            let progress = -offset / 120
            
            // since top padding is 25....
            let newOffset = (progress <= 1.0 ? progress : 1) * 20
            
            return -newOffset
        }
        
        return 0
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct ForecastView: View {
//    var time: String
//    var celcius: String
//    var image: String
//
//    var body: some View {
//        VStack(spacing: 15) {
//
//            Text(time)
//                .font(.callout.bold())
//                .foregroundStyle(.white)
//
//            Image(systemName: image)
//                .font(.title2)
//            // MultiColor...
//                .symbolVariant(.fill)
//                .symbolRenderingMode(.palette)
//                .foregroundStyle(.white, .yellow)
//            // max Frame...
//                .frame(height: 30)
//
//            Text("\(celcius)")
//                .font(.callout.bold())
//                .foregroundStyle(.white)
//        }
//        .padding(.horizontal, 10)
//    }
//}



// going to create Rain/Snow Effect Like iOS 15 Weather App....
// Sprite Kit Rain SCene...
class SnowFall: SKScene {
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        // anchor point..
        anchorPoint = CGPoint(x: 0.5, y: 1)
        
        // bg Color...
        backgroundColor = .clear
        
        // creating node and adding to scene...
        let node = SKEmitterNode(fileNamed: "SnowFall.sks")!
        addChild(node)
        
        // Full width...
        node.particlePositionRange.dx = UIScreen.main.bounds.width
        
    }
}

// Next Rain Fall Landing Scene...
class SnowFallLanding: SKScene {
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        // anchor point..
        let height = UIScreen.main.bounds.height
        // getting percentage by eminiationg postion range....
        anchorPoint = CGPoint(x: 0.5, y: (height - 5) / height)
        
        // bg Color...
        backgroundColor = .clear
        
        // creating node and adding to scene...
        let node = SKEmitterNode(fileNamed: "SnowFallLanding.sks")!
        addChild(node)
        
        
        // Removed for card padding...
        node.particlePositionRange.dx = UIScreen.main.bounds.width - 30
        
    }
}

//node.run(SKAction.repeatForever(<#T##action: SKAction##SKAction#>))
