//
//  ViewController.swift
//  SpecialOfferApp
//
//  Created by Alexey Koleda on 06.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let customView = MainView()
    override func loadView() { self.view = customView }
    
    let timerVC = TimerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.setupView()
        addChildrenVC()
    }
    
    private func addChildrenVC() {
        addChild(timerVC)
        view.addSubview(timerVC.view)
        customView.timerView.addChildSubviewByPinningEdges(timerVC.view)
    }
}

