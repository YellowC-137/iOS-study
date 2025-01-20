//
//  CounterView.swift
//  TCA
//
//  Created by 황준성 on 1/16/25.
//

import SwiftUI
import ComposableArchitecture

struct CounterView: View {
    
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        VStack {
            Text("\(store.count)")
                .font(.largeTitle)
            HStack {
                Button("+") {
                    store.send(.increaseButtonTapped)
                }
                .font(.largeTitle)
                .frame(width: 50,height: 50)
                Button("-") {
                    store.send(.decreaseButtonTapped)
                }
                .font(.largeTitle)
                .frame(width: 50,height: 50)
            }
            
            Button("FACT"){
                store.send(.factButtonTapped)
            }
            .font(.largeTitle)
            .frame(width: 100,height: 50)
            
            Button(store.timeIsRunningOut ? "Stop Timer" : "Start Timer") {
                store.send(.toogleTimerButtonTapped)
            }
            .font(.largeTitle)
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)
            
            
        }
        if store.isLoading {
            ProgressView()
        }
        else if let fact = store.fact {
            Text(fact)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    CounterView(
      store: Store(initialState: CounterFeature.State()) {
        CounterFeature()
      }
    )
}
