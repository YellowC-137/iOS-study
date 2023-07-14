//
//  DetailView.swift
//  scrumding
//
//  Created by 황준성 on 2023/07/11.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum : Daily
    @State private var editScrum = Daily.emptyScrum
    @State private var isPresentingEditView = false
    var body: some View {
        List{
            Section(header: Text("Info")){
                NavigationLink(destination: ContentView(scrum: $scrum)){
                    Label("Meeting",systemImage: "timer").font(.headline).foregroundColor(.accentColor)
                }
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
            Section(header: Text("Attend")){
                ForEach(scrum.attendees){
                    attend in
                    Label(attend.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar{
            Button("Edit"){
                isPresentingEditView = true
                editScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView){
            NavigationStack{
                DetailEdit(scrum: $editScrum).navigationTitle(scrum.title)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            Button("exit"){
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            Button("finish"){
                                isPresentingEditView = false
                                scrum = editScrum
                            }
                        }
                    }
            }
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(scrum: .constant(Daily.sampleData[0]))
          }
    }
}
