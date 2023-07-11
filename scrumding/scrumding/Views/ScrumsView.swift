//
//  ScrumsView.swift
//  scrumding
//
//  Created by 황준성 on 2023/07/11.
//

import SwiftUI

struct ScrumsView: View {
    let scrums : [Daily]
    
    var body: some View {
        List(scrums,id: \.title){
            scrum in
            CardView(scrum: scrum).listRowBackground(scrum.theme.mainColor)
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: Daily.sampleData)
    }
}
