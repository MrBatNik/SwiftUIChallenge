//
//  Placeholder.swift
//  SwiftUIChallenge
//
//  Created by Nikita Batrakov on 31.03.2024.
//

import SwiftUI

struct Placeholder: View {
    
    let image: String
    let mainText: String
    let subText: String
    
    init(
        image: String = "magnifyingglass",
        mainText: String = "Nothing to show at the moment.",
        subText: String = "Please be patient ☺️"
    ) {
        self.image = image
        self.mainText = mainText
        self.subText = subText
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Group {
                Image(systemName: image)
                
                Text(mainText)
            }
            .font(.title)
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            
            Text(subText)
            .font(.title3)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    Placeholder()
}
