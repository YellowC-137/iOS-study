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
        var timeIsRunningOut = false
    }
    
    //액션 정의
    enum Action {
        case decreaseButtonTapped
        case increaseButtonTapped
        case factButtonTapped
        case factResponse(String)
        case toogleTimerButtonTapped
        case timerTick
    }
    
    enum CancelID {
        case timer
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
                state.fact = nil
                return .none
                
            case .factButtonTapped:
                state.fact = nil
                state.isLoading = true
                
                //                //sideEffect를 위한 API 통신 추가
                //                let (data, _) = try await URLSession.shared
                //                  .data(from: URL(string: "http://numbersapi.com/\(state.count)")!)
                //                // 🛑 'async' call in a function that does not support concurrency
                //                // 🛑 Errors thrown from here are not handled
                //                state.fact = String(decoding: data, as: UTF8.self)
                //fetch data to string
                return .run { [count = state.count]
                    send in
                    let (data, _) = try await URLSession.shared
                        .data(from: URL(string: "http://numbersapi.com/\(count)")!)
                    let fact = String(decoding: data, as: UTF8.self)
                    await send(.factResponse(fact))
                }
                // 값 factos 추출을 위해 let 사용
            case let .factResponse(factos):
                state.fact = factos
                state.isLoading = false
                return .none
                
            case .toogleTimerButtonTapped:
                state.timeIsRunningOut.toggle()
                if state.timeIsRunningOut {
                    return .run {
                        send in
                        while true {
                            try await Task.sleep(for: .seconds(1))
                            await send(.timerTick)
                        }
                    }
                    .cancellable(id: CancelID.timer)
                }
            else {
                return .cancel(id: CancelID.timer)
            }
            
            case .timerTick:
                state.count += 1
                state.fact = nil
                return .none

                
            }
        }
    }

}
