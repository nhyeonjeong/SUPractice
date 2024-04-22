//
//  EditSectionView.swift
//  SUPractice
//
//  Created by 남현정 on 2024/04/22.
//

import SwiftUI

struct EditSectionView: View {
    let image: Image
    @Binding var title: String
    var body: some View {
        VStack {
            Text("daslfkas;df")
            image
            TextField(text: $title) {
                Text(title)
            }
        }
    }
}
//
//#Preview {
//    EditSectionView(image: Image(), title: .constant(""))
//}
