//
//  ContentView.swift
//  scrumding
//
//  Created by 황준성 on 2023/07/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            //기본 정렬은 center 이고 leading,trailing으로 좌우 정렬
            HStack{
                VStack(alignment: .leading){
                    Text("Elapsed")
                    Label("3000",systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing)
                {Text("Remained")
                    Label("0",systemImage: "hourglass.bottomhalf.fill")
                }
                
            }.accessibilityElement(children: .ignore)
                .accessibilityLabel("Reamin Time")
                .accessibilityValue("50 minutes")
            
            Circle().strokeBorder(lineWidth: 24)
            
            HStack{
                Text("1 / 3")
                Spacer()
                Button(action : {}){
                    Image(systemName: "forward.fill")
                }
            }
            .accessibilityLabel("NEXT")
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
