//
//  MeetingFooterView.swift
//  scrumding
//
//  Created by jsh on 2023/07/22.
//

import SwiftUI

struct MeetingFooterView: View {
    let spearks : [ScrumTimer.Speaker]
    var skipAction : () -> Void
    
    private var speakerNumber : Int? {
        guard let index = spearks.firstIndex(where: {!$0.isCompleted}) else {return nil}
        
        return index+1
    }
    
    private var isLastSpeaker : Bool {
        return spearks.dropLast().allSatisfy(
            {$0.isCompleted})
    }
    
    private var spearkText : String {
        guard let speakerNumber = speakerNumber else {return "No one" }
        return "Spealer \(speakerNumber) of \(spearks.count)"
    }
    
    var body: some View {
        VStack{
            HStack{
                if isLastSpeaker{
                    Text("END")
                }
                else{
                    Text(spearkText)
                    Spacer()
                    Button(action:skipAction){
                        Image(systemName: "arrowshape.bounce.forward")
                    }.accessibilityLabel("NEXT")
                }
            }
        }.padding([.bottom,.horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(spearks: Daily.sampleData[0].attendees.speakers, skipAction: {}).previewLayout(.sizeThatFits)
    }
}
