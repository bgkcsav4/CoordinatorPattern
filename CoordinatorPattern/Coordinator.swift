//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Mariam Latsabidze on 11.12.21.
//



import Foundation
import UIKit

enum Event{
    case buttonTapped
}

protocol Coordinator {
    var navigationcontroller : UINavigationController? {get set}
    
    func eventOccured(with type: Event)
    func start()
        
}

protocol Coordnating {
    var coordinator : Coordinator? { get set }
}
