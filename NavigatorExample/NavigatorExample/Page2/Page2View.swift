//
//  Page2View.swift
//  NavigatorExample
//
//  Created by dehrom on 12.07.2021.
//

import SwiftUI

struct Page2View: View {
    var body: some View {
        ZStack {
            Color
                .red
                .opacity(0.7)
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                Button(action: { navigator?.popToRoot() }) {
                    Text("Go to Start")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding()
                }
                .background(Color.white)
                .clipShape(Capsule())
                .shadow(color: .blue, radius: 7, x: 0.0, y: 0.0)
                
                Button(action: { navigator?.popLast() }) {
                    Text("Go to previous page")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.purple.opacity(0.6))
                .clipShape(Capsule())
                .shadow(color: .white, radius: 4, x: 0.0, y: 0.0)
            }
        }
    }
    
    @Environment(\.navigator) var navigator
}

struct Page2View_Previews: PreviewProvider {
    static var previews: some View {
        Page2View()
    }
}
