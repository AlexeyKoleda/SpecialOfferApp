//
//  ViewController.swift
//  SpecialOfferApp
//
//  Created by Alexey Koleda on 06.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let customView = MainView()
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.setupView()
    }
}

