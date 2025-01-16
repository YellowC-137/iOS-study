//
//  CounterFeature.swift
//  TCA
//
//  Created by 황준성 on 1/16/25.
//

import Foundation
import ComposableArchitecture

//상태 정의
@Reducer
struct CounterFeature {
    
    //상태 저장 , SwiftUI가 관찰하기 위함
    @ObservableState
    struct State {
        var count = 0
        var fact: String?
        var isLoading: Bool = false
    }
    
    //액션 정의
    enum Action {
        case decreaseButtonTapped
        case increaseButtonTapped
        case factButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce {
            state, action in
            switch action {
            case .decreaseButtonTapped:
                print("-- decreaseButtonTapped")
                state.count -= 1
                state.fact = nil
                return .none
            case .increaseButtonTapped:
                print("++ increaseButtonTapped")
                state.count += 1
                state.isLoading = true
                return .none
            case .factButtonTapped:
                state.fact = nil
                state.isLoading = true
                
                let (data, _) = try await URLSession.shared
                  .data(from: URL(string: "http://numbersapi.com/\(state.count)")!)
                // 🛑 'async' call in a function that does not support concurrency
                // 🛑 Errors thrown from here are not handled
                
                state.fact = String(decoding: data, as: UTF8.self)
                state.isLoading = false
                
                return .none
            }
        }
    }

}
