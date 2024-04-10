//
//  Coordinator.swift
//  SwiftUIChallenge
//
//  Created by Nikita Batrakov on 31.03.2024.
//

import SwiftUI
import Observation

protocol Coordinator: AnyObject {

    var path: NavigationPath { get }
    
    func push<Item: Hashable>(_ item: Item)
    func pop()
}

@Observable
final class MainCoordinator: Coordinator {
    
    var path = NavigationPath()
    
    func push<Item: Hashable>(_ item: Item) {
        path.append(item)
    }
    
    func pop() {
        path.removeLast()
    }
}
