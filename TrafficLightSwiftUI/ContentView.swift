//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Eugenie Tyan on 12.09.2022.
//

import SwiftUI

enum TrafficColor {
    case red
    case yellow
    case green
}

struct ContentView: View {
    @State private var redOpacity = 1.0
    @State private var yellowOpacity = 0.3
    @State private var greenOpacity = 0.3
    @State private var isFirstPressed = true
    @State private var buttonValue = "Start"
    @State private var currentColor: TrafficColor = .red
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            trafficLight
        }
    }
    
    private var trafficLight: some View {
        VStack {
            Circle()
                .foregroundColor(.red)
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .opacity(redOpacity)
            Circle()
                .foregroundColor(.yellow)
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .opacity(yellowOpacity)
            Circle()
                .foregroundColor(.green)
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .opacity(greenOpacity)
            Spacer()
            buttonStart
        }
        .padding()
    }
    
    private var buttonStart: some View {
        Button(action: {
            if isFirstPressed {
                self.buttonValue = "Next"
                self.isFirstPressed = false
            }
            switch currentColor {
            case .red:
                switchColor(currentOpacity: &redOpacity, nextOpacity: &yellowOpacity)
                currentColor = .yellow
            case .yellow:
                switchColor(currentOpacity: &yellowOpacity, nextOpacity: &greenOpacity)
                currentColor = .green
            case .green:
                switchColor(currentOpacity: &greenOpacity, nextOpacity: &redOpacity)
                currentColor = .red
            }
        }) {
            Text(buttonValue)
                .font(.title)
                .foregroundColor(.white)
            
        }
        .frame(width: 100, height: 50)
        .background(.blue)
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(.white, lineWidth: 4))
    }
    
    private func switchColor(currentOpacity: inout Double, nextOpacity: inout Double) {
        currentOpacity = 0.3
        nextOpacity = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
