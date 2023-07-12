//
//  DetailEdit.swift
//  scrumding
//
//  Created by 황준성 on 2023/07/12.
//

import SwiftUI

struct DetailEdit: View {
    @State private var scrum = Daily.emptyScrum
    @State private var newAttend = ""
    
    var body: some View {
        Form{
            Section(header: Text("Info")){
                TextField("Title",text: $scrum.title)
                HStack{
                    Slider(value: $scrum.lengthInDoubleMinutes,in: 5...60,step: 1){
                        Text("Time")
                    }.accessibilityValue("\(scrum.lengthInMinutes) miutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) min").accessibilityHidden(true)
                    }
            }
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees){
                    attend in Text(attend.name)
                }
                .onDelete{
                    indexs in
                    scrum.attendees.remove(atOffsets: indexs)
                }
                HStack{
                    TextField("New Attend",text: $newAttend)
                    Button(action: {
                        withAnimation{
                            let attendee = Daily.Attendees(name: newAttend)
                            scrum.attendees.append(attendee)
                            newAttend = ""
                        }
                    }){
                        Image(systemName: "plus.circle").accessibilityLabel("Add attend")
                    }
                    .disabled(newAttend.isEmpty)
                }
            }
        }
    }
}

struct DetailEdit_Previews: PreviewProvider {
    static var previews: some View {
        DetailEdit()
    }
}
