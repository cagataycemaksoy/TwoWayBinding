//
//  ContentView.swift
//  TwoWayBinding
//
//  Created by Cem Aksoy on 8.11.2025.
//

import SwiftUI

struct ContentView: View {
  @State private var chargePercent = 0.0
  @State private var scaleFactor = 0.0
  @State private var isCharged = false
  
  var body: some View {
    GeometryReader { geo in
      VStack {
        Spacer()
        RoundedRectangle(cornerRadius: 60)
          .fill(.appBlue)
          .frame(width: geo.size.width, height: geo.size.height * scaleFactor)
          .overlay(RoundedRectangle(cornerRadius: 60)
            .stroke(.appBrown, lineWidth: 2)
            .overlay(Text(isCharged ? "Fully Charged!" : "")
              .font(.title)
              .fontWeight(.semibold)
              .foregroundStyle(.white)
            )
          )
          .animation(.easeInOut, value: scaleFactor)
        
        
        VStack {
          Text("Charged to %\(chargePercent.formatted())")
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(.appBrown)
          Button("Charge!") {
            if chargePercent >= 99 {
              chargePercent = 100
              isCharged = true
            } else {
              chargePercent += 5.88
            }
            if scaleFactor < 0.85 {
              scaleFactor += 0.05
            }
            
          }
          .font(.headline)
          .fontWeight(.semibold)
          .buttonStyle(.borderedProminent)
          .tint(.appBlue)
          .overlay(Capsule().stroke(.appBrown, lineWidth: 2))
        }
        .padding()
      }
      
    }
    .padding()
  }
}

#Preview {
    ContentView()
}
