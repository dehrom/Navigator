//
//  Page0View.swift
//  NavigatorExample
//
//  Created by dehrom on 12.07.2021.
//

import SwiftUI

struct Page0View: View {
    var body: some View {
        ZStack {
            Color
                .white
                .opacity(0.7)
                .ignoresSafeArea()
            
            Button(action: viewModel.moveForward) {
                Text("Go to next page")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color.purple)
            .clipShape(Capsule())
            .shadow(color: .gray, radius: 4, x: 0.0, y: 3.0)
        }
        .onReceive(viewModel.$nextView) {
            navigator?.push($0)
        }
    }
    
    @Environment(\.navigator) private var navigator
    @StateObject private var viewModel = Page0ViewModel()
}

struct Page0View_Previews: PreviewProvider {
    static var previews: some View {
        Page0View()
    }
}
