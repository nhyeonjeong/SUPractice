//
//  BlueButton.swift
//  SUPractice
//
//  Created by 남현정 on 2024/04/18.
//

import SwiftUI

struct BlueButton: View {
    var body: some View {
        Button("동의하기") {
            
        }
        .foregroundStyle(.primary)
        .padding()
        .frame(maxWidth: .infinity)
        .background(.blue)
        .cornerRadius(16)
        .padding(.bottom, 16)
    }
}

#Preview {
    BlueButton()
}
