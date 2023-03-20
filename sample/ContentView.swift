//
//  ContentView.swift
//  sample
//
//  Created by Sabiq Sabry on 04/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack{
                cityNameView(cityName: "London, UK")
                
                mainWeatherStatusWindowView(imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",
                                            temperature: isNight ? 2 : 7)
                
                HStack(spacing: 30){
                    WeatherDayView(dayofWeek: "Tue",
                                   imageName: "cloud.sun.fill",
                                   temperature: 8)
                    WeatherDayView(dayofWeek: "Wed",
                                   imageName: "cloud.sun.fill",
                                   temperature: 6)
                    WeatherDayView(dayofWeek: "Thu",
                                   imageName: "cloud.sun.fill",
                                   temperature: 10)
                    WeatherDayView(dayofWeek: "Fri",
                                   imageName: "cloud.sun.fill",
                                   temperature: 11)
                    WeatherDayView(dayofWeek: "Sat",
                                   imageName: "cloud.sun.fill",
                                   temperature: 7)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton1(title: "Change Day/Time",
                                   textColor: isNight ? .black: .blue,
                                   bgColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayofWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayofWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.white, .yellow)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct cityNameView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct mainWeatherStatusWindowView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 0){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


