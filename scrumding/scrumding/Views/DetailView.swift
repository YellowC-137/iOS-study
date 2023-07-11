//
//  DetailView.swift
//  scrumding
//
//  Created by 황준성 on 2023/07/11.
//

import SwiftUI

struct DetailView: View {
    let scrum : Daily
    var body: some View {
        List{
            Section(header: Text("Info")){
                Label("Meeting",systemImage: "timer").font(.headline).foregroundColor(.accentColor)
                HStack{
                    Label("Time",systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) min")
                }.accessibilityElement(children: .combine)
                HStack {
                                   Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                                        .padding(4)
                                        .foregroundColor(scrum.theme.accentColor)
                                        .background(scrum.theme.mainColor)
                                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
              DetailView(scrum: Daily.sampleData[0])
          }
    }
}
