//
//  DiceeViewController.swift
//  Dicee-programmatically
//
//  Created by Sebastian Sciuba on 16/12/2020.
//

import UIKit

class DiceViewController : UIViewController {
    
    let backgroudnImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "newbackground") )
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let diceeView : DiceView = {
        let view = DiceView()
        view.configureViewComponents()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        configureViewComponents()
    }
    
    func configureViewComponents() {
        
        view.addSubview(backgroudnImage)
        backgroudnImage.translatesAutoresizingMaskIntoConstraints = false
        backgroudnImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backgroudnImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroudnImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroudnImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
//        backgroudnImage.addSubview(diceeView)
//        diceeView.translatesAutoresizingMaskIntoConstraints = false
//        diceeView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        diceeView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        diceeView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        diceeView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
}
