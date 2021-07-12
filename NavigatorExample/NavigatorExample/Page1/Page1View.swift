//
//  Page1View.swift
//  NavigatorExample
//
//  Created by dehrom on 12.07.2021.
//

import SwiftUI

struct Page1View: View {
    var body: some View {
        ZStack {
            Color
                .blue
                .opacity(0.7)
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                Button(action: viewModel.moveForward) {
                    Text("Go to next page")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.green.opacity(0.6))
                .clipShape(Capsule())
                .shadow(color: .gray, radius: 4, x: 0.0, y: 3.0)
                
                Button(action: { navigator?.popLast() }) {
                    Text("Go to previous page")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.purple.opacity(0.6))
                .clipShape(Capsule())
                .shadow(color: .gray, radius: 4, x: 0.0, y: 3.0)
            }
        }
        .onReceive(viewModel.$nextView) {
            navigator?.push($0)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @Environment(\.navigator) private var navigator
    @StateObject private var viewModel = Page1ViewModel()
}

struct Page1View_Previews: PreviewProvider {
    static var previews: some View {
        Page1View()
    }
}
