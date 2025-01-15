//
//  SwiftUIView.swift
//  Landmarks
//
//  Created by 황준성 on 1/13/25.
//

import SwiftUI

struct SwiftUIView: View {
    
    var body: some View {
        LandmarkList()
    }

}

#Preview {
    //Model Object 추가, 서브뷰들에 오브젝트 사용가능하게함
    SwiftUIView().environment(ModelData())
}
