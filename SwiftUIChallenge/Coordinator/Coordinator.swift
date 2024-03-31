//
//  Coordinator.swift
//  SwiftUIChallenge
//
//  Created by Nikita Batrakov on 31.03.2024.
//

import SwiftUI
import Observation

protocol Coordinator: AnyObject {
    
    associatedtype Item: Hashable
    
    var path: NavigationPath { get }
    
    func push(_ item: Item)
    func pop()
}

@Observable
final class MainCoordinator<Item: Hashable>: Coordinator {
    
    var path = NavigationPath()
    
    func push(_ item: Item) {
        path.append(item)
    }
    
    func pop() {
        path.removeLast()
    }
}
