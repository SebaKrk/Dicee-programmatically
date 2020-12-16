//
//  DiceeViewController.swift
//  Dicee-programmatically
//
//  Created by Sebastian Sciuba on 16/12/2020.
//

import UIKit

class DiceViewController : UIViewController {
    
    let diceeView : DiceView = {
        let view = DiceView()
        view.configureViewComponents()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        configureViewComponents()
    }
    
    func configureViewComponents() {
        
        view.addSubview(diceeView)
        diceeView.translatesAutoresizingMaskIntoConstraints = false
        diceeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        diceeView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        diceeView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        diceeView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
}
