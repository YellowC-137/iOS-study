//
//  ScrumsView.swift
//  scrumding
//
//  Created by 황준성 on 2023/07/11.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums : [Daily]
    @State private var isPresentingNewScrumView = false
    
    var body: some View {
        NavigationStack{
            
            List($scrums){
                $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }.listRowBackground(scrum.theme.mainColor)
            }.navigationTitle("SCRUM").toolbar{
                Button(action: {
                    isPresentingNewScrumView = true
                }){
                    Image(systemName: "plus")
                }.accessibilityLabel("New Scrum")
        }
            .sheet(isPresented: $isPresentingNewScrumView){
                
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(Daily.sampleData))
    }
}
