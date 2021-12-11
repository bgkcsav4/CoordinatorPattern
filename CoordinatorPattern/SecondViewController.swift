//
//  SecondViewController.swift
//  CoordinatorPattern
//
//  Created by Mariam Latsabidze on 11.12.21.
//

import UIKit

class SecondViewController: UIViewController, Coordnating {
    var coordinator: Coordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "view"
        view.backgroundColor = .blue

        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 255))
        view.addSubview(button)
        button.backgroundColor = .systemPink
        button.center = view.center
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setTitle("Tap Button", for: .normal)
        
    }
    
    @objc func didTapButton() {
        coordinator?.eventOccured(with: .buttonTapped)
    }
}
