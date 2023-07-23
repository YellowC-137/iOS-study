//
//  ContentView.swift
//  scrumding
//
//  Created by 황준성 on 2023/07/07.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @Binding var scrum : Daily
    @StateObject var scrumTimer = ScrumTimer()
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20.0).fill(scrum.theme.mainColor)
        VStack {
            MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
           
            Circle().strokeBorder(lineWidth: 24)
            MeetingFooterView(spearks: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            HStack{
                Text("1 / 3")
                Spacer()
                Button(action : {}){
                    Image(systemName: "forward.fill")
                }
            }
            .accessibilityLabel("NEXT")
            
        }.padding()
    }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear{
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees),
            scrumTimer.startScrum()
        }
        .onDisappear{
            scrumTimer.stopScrum()
            }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(scrum: .constant(Daily.sampleData[0]))
    }
}
