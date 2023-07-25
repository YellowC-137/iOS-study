//
//  MeetingHeaderView.swift
//  scrumding
//
//  Created by 황준성 on 2023/07/14.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    var skipAction: ()->Void
    
    private var totalSeconds : Int{
        secondsElapsed + secondsRemaining
    }
    
    private var progress : Double{
        guard totalSeconds > 0 else {return 1}
        return Double(secondsElapsed) / Double(secondsRemaining)
    }
    
    private var minutesRemaining : Int {
        secondsElapsed / 60
    }
    
    var body: some View {
        VStack
        {
            ProgressView(value: progress).progressViewStyle(ScrumProgressViewStyle(theme: theme))
        //기본 정렬은 center 이고 leading,trailing으로 좌우 정렬
        HStack{
            VStack(alignment: .leading){
                Text("Elapsed")
                Label("\(secondsElapsed)",systemImage: "hourglass.tophalf.fill")
            }
            
            Spacer()
            Button(action: skipAction){
                
                Image(systemName: "forward.fill")
            }
            VStack(alignment: .trailing)
            {Text("Remained")
                Label("\(secondsRemaining)",systemImage: "hourglass.bottomhalf.fill").labelStyle(.trailingIcon)
            }
            
        }
        
    }.accessibilityElement(children: .ignore)
            .accessibilityLabel("Remain Time")
            .accessibilityValue("\(minutesRemaining) minutes")
            .padding([.top,.horizontal])
            .padding([.bottom,.horizontal])
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180,theme: .magenta, skipAction: {})
                   .previewLayout(.sizeThatFits)
    }
}
