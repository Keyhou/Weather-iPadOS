//
//  WeatherDataView.swift
//  Weather App
//
//  Created by Keyhan Mortezaeifar on 12/12/21.
//

import SwiftUI

struct WeatherDataView: View {
    
    @State private var showingSheet = false
    var body: some View {
        
        VStack(spacing: 8) {
            
            CustomStackView {
                Label {
                    Text("AIR QUALITY")
                } icon: {
                    Image(systemName: "aqi.medium")
                }
            } contentView: {
                VStack(alignment: .leading, spacing: 10) {
                    Text("95 - Moderately Polluted")
                        .font(.title3.bold())
                    Text("May cause breathing discomfort for people with lung disease such as asthma and discomfort for people with heart disease, children and older adults.")
                        .fontWeight(.semibold)
                    Capsule()
                        .fill(.linearGradient(.init(colors: [.blue,.green,.yellow,.orange,.red,.purple]), startPoint: .leading, endPoint: .trailing))
                        .frame(height: 4, alignment: .center)
                }
                .foregroundStyle(.white)
            }
        
            CustomStackView {
                Label {
                    Text("10-DAY FORECAST")
                } icon: {
                    Image(systemName: "calendar")
                }
            } contentView: {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(forecast) { cast in
                        VStack {
                            HStack(spacing: 55) {
                                Text(cast.day)
                                    .font(.title3.bold())
                                    .foregroundStyle(.white)
                                // max widht...
                                    .frame(width: 110, alignment: .leading)
                                Image(systemName: cast.image)
                                    .font(.title3)
                                    .symbolVariant(.fill)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.white, .yellow)
                                    .frame(width: 30)
                                Text("\(Int(cast.celsius - 8))˚")
                                    .font(.title3.bold())
                                    .foregroundStyle(.secondary)
                                    .foregroundStyle(.white)
                                
                                // Progress Bar....
                                ZStack(alignment: .leading) {
                                    Capsule()
                                        .fill(.tertiary)
                                        .foregroundStyle(.white)
                                    // for width...
                                    GeometryReader { proxy in
                                        Capsule()
                                            .fill(.linearGradient(.init(colors: [.blue,.gray]), startPoint: .leading, endPoint: .trailing))
                                            .frame(width: (cast.celsius / 10) * proxy.size.width)
                                    }
                                }
                                .frame(height: 4)
                                Text("\(Int(cast.celsius))˚")
                                    .font(.title3.bold())
                                    .foregroundStyle(.white)
                            }
                            Divider()
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            

            
            HStack {
                CustomStackView {
                    Label {
                        Text("UV INDEX")
                    } icon: {
                        Image(systemName: "sun.min")
                    }
                } contentView: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("0")
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("Low")
                            .font(.title)
                            .fontWeight(.semibold)
                        Capsule()
                            .fill(.linearGradient(.init(colors: [.blue,.green,.yellow,.orange,.red,.purple]), startPoint: .leading, endPoint: .trailing))
                            .frame(height: 4, alignment: .center)
                        Text("Low levels all day.")
                            .font(.subheadline)
                            .fontWeight(.regular)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
                }
                
                CustomStackView {
                    Label {
                        Text("WINTRY MIX")
                    } icon: {
                        Image(systemName: "cloud.hail.fill")
                    }
                } contentView: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("4 mm")
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("in last 6h")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("7 mm expected in next 24h.")
                            .font(.subheadline)
                            .fontWeight(.regular)
                        
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
                }
                
                CustomStackView {
                    Label {
                        Text("FEELS LIKE")
                    } icon: {
                        Image(systemName: "thermometer")
                    }
                } contentView: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("-7°")
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("Wind is making it feel colder.")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
                }
                
                CustomStackView {
                    Label {
                        Text("SUNRISE")
                    } icon: {
                        Image(systemName: "sunrise.fill")
                    }
                } contentView: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("07:18")
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("Sunset: 16:35")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
                }
            }
            .frame(maxHeight: .infinity)
            
            HStack {
                CustomStackView {
                    Label {
                        Text("Humidity")
                    } icon: {
                        Image(systemName: "humidity")
                    }
                } contentView: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("80%")
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("The dew point is -4° right now.")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
                }
                
                CustomStackView {
                    Label {
                        Text("VISIBILITY")
                    } icon: {
                        Image(systemName: "eye.fill")
                    }
                } contentView: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("402 m")
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("Visibility is moderate.")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
                }
                
                CustomStackView {
                    Label {
                        Text("WIND")
                    } icon: {
                        Image(systemName: "wind")
                    }
                } contentView: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("11 km/h")
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("South West")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
                }
                
                CustomStackView {
                    Label {
                        Text("PRESSURE")
                    } icon: {
                        Image(systemName: "gauge")
                    }
                } contentView: {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("1021 hPa")
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("Going up.")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
                }
            }
            .frame(maxHeight: .infinity)
            
            Spacer()
            
            // Manual Icon changing... who cares
            
            Button("Manual App Icon 🤦") {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        AppIconView()
                    }
                    .foregroundColor(.white)
            


        }
    }
}

struct WeatherDataView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
