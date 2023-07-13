//
//  ThemeView.swift
//  scrumding
//
//  Created by 황준성 on 2023/07/12.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
    

        Text(theme.name)
            .padding(8)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(4)
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .bubblegum)
    }
}
