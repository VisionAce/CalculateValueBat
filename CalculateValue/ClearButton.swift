//
//  ClearButton.swift
//  CalculateValue
//
//  Created by 褚宣德 on 2023/10/12.
//

import SwiftUI
struct ClearButton: ViewModifier {
    @Binding var value: Int

    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            if !(value == 1) {
                Button {
                    self.value = 1
                } label: {
                    Image(systemName: "delete.left")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }
                .padding(.trailing, 8)
            }
        }
    }
}
