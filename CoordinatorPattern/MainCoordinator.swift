//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Mariam Latsabidze on 11.12.21.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationcontroller: UINavigationController?
    
    func eventOccured(with type: Event) {
        switch type {
        case .buttonTapped:
            var vc: UIViewController & Coordnating = SecondViewController()
            vc.coordinator = self
            navigationcontroller?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        var vc: UIViewController & Coordnating = ViewController()
        vc.coordinator = self
        navigationcontroller?.setViewControllers([vc], animated: false)

    }
    
}
