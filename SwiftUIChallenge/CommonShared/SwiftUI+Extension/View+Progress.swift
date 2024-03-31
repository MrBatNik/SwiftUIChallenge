//
//  View+Progress.swift
//  SwiftUIChallenge
//
//  Created by Nikita Batrakov on 31.03.2024.
//

import SwiftUI

extension View {
    
    func progress(isPresented: Bool, backgroundColor: Color = Color.white.opacity(0.5), tintColor: Color = .black) -> some View {
        self
        .allowsHitTesting(!isPresented)
        .overlay {
            if isPresented {
                ZStack {
                    backgroundColor.ignoresSafeArea(edges: .all)

                    ProgressView()
                    .tint(tintColor)
                }
            }
        }
    }
}
