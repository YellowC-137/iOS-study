//
//  CardView.swift
//  scrumding
//
//  Created by 황준성 on 2023/07/11.
//

import SwiftUI

struct CardView: View {
    let scrum: Daily
    var body: some View {
        VStack(){
            Text(scrum.title).font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack{
                Spacer()
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
                Spacer()
            }
            .font(.largeTitle)
        }
        .foregroundColor(scrum.theme.accentColor)
    }
}



struct CardView_Previews: PreviewProvider {
    static var scrum = Daily.sampleData[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
