//
//  DiceeView.swift
//  Dicee-programmatically
//
//  Created by Sebastian Sciuba on 16/12/2020.
//

import UIKit

class DiceView: UIView {

    let topContainerView = UIView()
    let centerContainerView = UIView()
    let bottomContainerView = UIView()
    
    var logoImage : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "diceeLogo"))
//        image.backgroundColor = .white
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    let firstDiceImage : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "dice1"))
//        image.backgroundColor = .red
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    let secondDiceImage : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "dice2"))
//        image.backgroundColor = .blue
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    let rollButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ROOL", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 120/255, green: 31/255, blue: 21/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return button
    }()
    
//    MARK: - OBJC func
    
    @objc func handleButton() {
        print("Roll")
        let diceArray = [#imageLiteral(resourceName: "dice1"),#imageLiteral(resourceName: "dice2"),#imageLiteral(resourceName: "dice3"),#imageLiteral(resourceName: "dice4"),#imageLiteral(resourceName: "dice5"),#imageLiteral(resourceName: "dice6")]
        
        firstDiceImage.image = diceArray.randomElement()
        secondDiceImage.image = diceArray.randomElement()
    }
    
//    MARK: INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViewComponents()
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViewComponents(){
        

//        topContainerView.backgroundColor = .blue
        addSubview(topContainerView)
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.33).isActive = true
        
        topContainerView.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        logoImage.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
//        centerContainerView.backgroundColor = .green
        addSubview(centerContainerView)
        centerContainerView.translatesAutoresizingMaskIntoConstraints = false
        centerContainerView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        centerContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        centerContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        centerContainerView.heightAnchor.constraint(equalTo: heightAnchor ,multiplier: 0.33).isActive = true
        
        let centerStackView = UIStackView(arrangedSubviews: [firstDiceImage,secondDiceImage])
        
        centerContainerView.addSubview(centerStackView)
        centerStackView.translatesAutoresizingMaskIntoConstraints = false
        centerStackView.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        centerStackView.centerYAnchor.constraint(equalTo: centerContainerView.centerYAnchor).isActive = true
        centerStackView.distribution = .fillEqually
        centerStackView.axis = .horizontal
        centerStackView.setCustomSpacing(20, after: firstDiceImage)
        
        firstDiceImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        firstDiceImage.heightAnchor.constraint(equalToConstant: 100).isActive = true

        secondDiceImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        secondDiceImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        

//        bottomContainerView.backgroundColor = .yellow
        addSubview(bottomContainerView)
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        bottomContainerView.topAnchor.constraint(equalTo: centerContainerView.bottomAnchor).isActive = true
        bottomContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.33).isActive = true
        
        
        bottomContainerView.addSubview(rollButton)
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        rollButton.centerYAnchor.constraint(equalTo: bottomContainerView.centerYAnchor).isActive = true
        rollButton.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor).isActive = true
        rollButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        rollButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
}
