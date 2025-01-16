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
                store.send()
            }
            .font(.largeTitle)
            .frame(width: 50,height: 50)
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
