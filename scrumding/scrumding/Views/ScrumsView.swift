//
//  ScrumsView.swift
//  scrumding
//
//  Created by 황준성 on 2023/07/11.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums : [Daily]
    
    var body: some View {
        NavigationStack{
            
            List($scrums){
                $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }.listRowBackground(scrum.theme.mainColor)
            }.navigationTitle("SCRUM").toolbar{
                Button(action: {}){
                    Image(systemName: "plus")
                }.accessibilityLabel("New Scrum")
        }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(Daily.sampleData))
    }
}
