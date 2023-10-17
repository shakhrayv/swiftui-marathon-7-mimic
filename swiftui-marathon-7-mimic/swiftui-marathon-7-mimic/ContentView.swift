//
//  ContentView.swift
//  swiftui-marathon-7-mimic
//
//  Created by Vladislav Shakhray on 17/10/2023.
//

import SwiftUI

struct ExpandableButton<Content: View>: View {
    @Binding var isPresent: Bool
    @ViewBuilder let content: Content
    
    var body: some View {
        ZStack(alignment: isPresent ? .topLeading : .center) {
            Button {
                withAnimation {
                    isPresent.toggle()
                }
            } label: {
                Color.blue
                    .frame(
                        width: isPresent ? 300 : 100,
                        height: isPresent ? 400 : 54)
                    .clipShape(RoundedRectangle(cornerRadius: 12.0))
            }
            .allowsHitTesting(!isPresent)
            
            Button {
                withAnimation {
                    isPresent.toggle()
                }
            } label: {
                content
            }
            .foregroundStyle(.white)
            .padding()
            .allowsHitTesting(isPresent)
        }
    }
}

struct ContentView: View {
    @State private var isPresent = false
    var body: some View {
        ZStack(alignment: isPresent ? .center : .bottomTrailing) {
            Color.white
            
            ExpandableButton(isPresent: $isPresent) {
                Text("Open")
                .fontWeight(.medium)
            }
            .opacity(isPresent ? 0.0 : 1.0)
            
            ExpandableButton(isPresent: $isPresent) {
                HStack {
                    Image(systemName: "arrowshape.backward.fill")
                    Text("Back")
                }
                .foregroundStyle(.white)
                .fontWeight(.bold)
            }
            .opacity(isPresent ? 1.0 : 0.0)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
