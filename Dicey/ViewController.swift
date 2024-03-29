//
//  ViewController.swift
//  Dicey
//
//  Created by Peter Nguyen on 10/1/19.
//  Copyright © 2019 Peter Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var leftDiceIndex : Int = 0
    var rightDiceIndex : Int = 0
    var score : Int = 0

    @IBOutlet weak var leftDice: UIImageView!
    

    
    @IBOutlet weak var rightDice: UIImageView!
    
    @IBOutlet weak var scoreCounter: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDice()
    }

    
    @IBAction func rollDIce(_ sender: UIButton) {
        updateDice()
    }
    
    func updateDice() {
        leftDiceIndex = Int(arc4random_uniform(6) + 1 )
        rightDiceIndex = Int(arc4random_uniform(6) + 1)

        leftDice.image = UIImage(named: "dice\(leftDiceIndex)")
        rightDice.image = UIImage(named: "dice\(rightDiceIndex)")
        calculateScore()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDice()
    }
    
    func calculateScore() {
        if leftDiceIndex < rightDiceIndex {
            score += 1
            scoreCounter.text = String(score)
        }
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        scoreCounter.text = "0"
        
    }
    
    
}

