//
//  ProfileView.swift
//  Landmarks
//
//  Created by 황준성 on 1/16/25.
//

import SwiftUI
import WebKit

struct ProfileView: View {
    
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            ProfileDetailView(profile: draftProfile)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
