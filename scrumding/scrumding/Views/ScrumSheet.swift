//
//  ScrumSheet.swift
//  scrumding
//
//  Created by 황준성 on 2023/07/25.
//

import SwiftUI

struct ScrumSheet: View {
    @State private var newScrum = Daily.emptyScrum
    @Binding var isPresentingScrumView : Bool
    
    var body: some View {
        NavigationStack{
            DetailEdit(scrum: $newScrum)
        }
    }
}

struct ScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        ScrumSheet(isPresentingScrumView: .constant(true))
    }
}
