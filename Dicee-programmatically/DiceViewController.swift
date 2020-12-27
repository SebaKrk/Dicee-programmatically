//
//  DiceeViewController.swift
//  Dicee-programmatically
//
//  Created by Sebastian Sciuba on 16/12/2020.
//

import UIKit
import Instructions

class DiceViewController : UIViewController {
    
    let coachMarksController = CoachMarksController()
    
    let pointOfInterest = DiceView()
    
    let diceeView : DiceView = {
        let view = DiceView()
        view.configureViewComponents()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 77/255, green: 86/255, blue: 0/255, alpha: 1)
        configureViewComponents()
        
        self.coachMarksController.dataSource = self
        self.coachMarksController.delegate = self
        
        let skipView = CoachMarkSkipDefaultView()
        skipView.setTitle("Skip", for: .normal)

        self.coachMarksController.skipView = skipView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.coachMarksController.start(in: .viewController(self))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        viewWillDisappear(animated)
        self.coachMarksController.stop(immediately: true)
    }
    
    func configureViewComponents() {
        
        view.addSubview(diceeView)
        diceeView.translatesAutoresizingMaskIntoConstraints = false
        diceeView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        diceeView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        diceeView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        diceeView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
}
// MARK: - Instructions

extension DiceViewController : CoachMarksControllerDataSource, CoachMarksControllerDelegate {
    
    func numberOfCoachMarks(for coachMarksController: CoachMarksController) -> Int {
        return 3
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkAt index: Int) -> CoachMark {
        
        switch index {
        case 0:
            return coachMarksController.helper.makeCoachMark(for: pointOfInterest.firstDiceImage)
        case 1:
            return coachMarksController.helper.makeCoachMark(for: pointOfInterest.secondDiceImage)
        case 2:
            return coachMarksController.helper.makeCoachMark(for: pointOfInterest.rollButton)
        default:
            return coachMarksController.helper.makeCoachMark()
        }
        
    }
    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: CoachMark) -> (bodyView: (UIView & CoachMarkBodyView), arrowView: (UIView & CoachMarkArrowView)?) {
        
        let coachViews = coachMarksController.helper.makeDefaultCoachViews(withArrow: true,  arrowOrientation: coachMark.arrowOrientation)
        
        switch index {
        case 0:
            coachViews.bodyView.hintLabel.text = "First Dice Image"
            coachViews.bodyView.nextLabel.text = "OK"
            
        case 1:
            coachViews.bodyView.hintLabel.text = "Second Dice Image"
            coachViews.bodyView.nextLabel.text = "OK"
            
        case 2:
            coachViews.bodyView.hintLabel.text = "press ROLL to roll the dice"
            coachViews.bodyView.nextLabel.text = "Done"
            
        default:
            break
        }
        return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController, didEndShowingBySkipping skipped: Bool) {
        AppManager.setUserSeenAppInstructions()
    }
}


