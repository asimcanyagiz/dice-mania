//
//  ViewController.swift
//  Dice Mania
//
//  Created by Asım can Yağız on 5.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblScore1: UILabel!
    @IBOutlet weak var lblScore2: UILabel!
    
    @IBOutlet weak var lblCurrentScore1: UILabel!
    @IBOutlet weak var lblCurrentScore2: UILabel!
    
    @IBOutlet weak var imgPlayer1Turn: UIImageView!
    @IBOutlet weak var imgPlayer2Turn: UIImageView!
    
    @IBOutlet weak var imgPlayer1Dice: UIImageView!
    @IBOutlet weak var imgPlayer2Dice: UIImageView!
    
    @IBOutlet weak var lblResults: UILabel!
    
    

    var playerScores = (player1Score : 0, player2Score : 0)
    var playerPoints = (player1Points : 0, player2Points : 0)
    var playerTurn : Int = 1
    
    var lastSet : Int = 5
    var currentSet : Int = 1


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let arkaPlan = UIImage(named: "arkaPlan") {
            self.view.backgroundColor = UIColor(patternImage: arkaPlan)
        }
    }


}

