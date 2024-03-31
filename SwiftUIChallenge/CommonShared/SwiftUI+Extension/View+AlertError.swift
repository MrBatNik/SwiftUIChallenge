//
//  View+AlertError.swift
//  SwiftUIChallenge
//
//  Created by Nikita Batrakov on 31.03.2024.
//

import SwiftUI

extension View {
    
    func alert<E: Error>(error: Binding<E?>, title: LocalizedStringKey? = nil, action: (() -> Void)? = nil) -> some View {
        modifier(
            ItemErrorAlertModifier(
                error: error,
                title: title,
                action: action
            )
        )
    }
}

struct ItemErrorAlertModifier<E: Error>: ViewModifier {
    
    @Binding var error: E?
    
    let title: LocalizedStringKey?
    let action: (() -> Void)?
    
    @Binding private var isPresented: Bool
    
    init(error: Binding<E?>, title: LocalizedStringKey?, action: (() -> Void)?) {
        self._error = error
        self.title = title
        self.action = action
        
        self._isPresented = Binding<Bool>(
            get: {
                error.wrappedValue != nil
            },
            set: {
                if $0 {
                    error.wrappedValue = nil
                }
            }
        )
    }

    func body(content: Content) -> some View {
        content
        .alert(
            title ?? "Error",
            isPresented: $isPresented,
            actions: { Button("Retry", action: { action?() }) },
            message: { Text(error?.localizedDescription ?? "An error has occurred") }
        )
    }
}
