//
//  ViewController.swift
//  CoordinatorPattern
//
//  Created by Mariam Latsabidze on 11.12.21.
//

import UIKit

class ViewController: UIViewController, Coordnating {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Home"
    }


}

