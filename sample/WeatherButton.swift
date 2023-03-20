//
//  WeatherButton.swift
//  sample
//
//  Created by Sabiq Sabry on 19/03/2023.
//

import SwiftUI

struct WeatherButton1: View {
    
    var title: String
    var textColor: Color
    var bgColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 225, height: 50)
            .background(bgColor)
            .foregroundColor(textColor)
            .font(.system(size: 18, weight: .bold, design: .default))
            .cornerRadius(10.0)
    }
}
