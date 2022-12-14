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
    @IBOutlet weak var lblSets: UILabel!
    

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

    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if currentSet > lastSet {
            return endGame()
        }
        
        createDiceValues()
        
    }
    
    
    
    func afterSet(dice1 : Int, dice2 : Int){
        if playerTurn == 1 {
            
            playerPoints.player1Points = dice1 + dice2
            lblCurrentScore1.text = String(playerPoints.player1Points)
            lblCurrentScore1.sizeToFit()
            lblCurrentScore2.text = "0"
            
            imgPlayer1Turn.image = UIImage(named: "bekle")
            imgPlayer2Turn.image = UIImage(named: "onay")
            
            playerTurn = 2
            
            
        } else {
            playerPoints.player2Points = dice1 + dice2
            lblCurrentScore2.text = String(playerPoints.player2Points)
            lblCurrentScore2.sizeToFit()
            
            imgPlayer1Turn.image = UIImage(named: "onay")
            imgPlayer2Turn.image = UIImage(named: "bekle")
            
            playerTurn = 1
            
            if playerPoints.player1Points > playerPoints.player2Points {
                
                playerScores.player1Score += 1
                lblScore1.text = String(playerScores.player1Score)
                
                lblResults.textColor = UIColor.systemRed
                lblResults.text = "Player 1 Won!"
                
                lblSets.text = "Set : \(currentSet)"
                lblSets.sizeToFit()
                lblSets.isHidden = false
                
                
                currentSet += 1
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    self.lblResults.text = "Shake for Roll!"
                    self.lblResults.textColor = UIColor.black
                }
                
            } else if playerPoints.player1Points == playerPoints.player2Points {
                
                lblResults.textColor = UIColor.black
                lblResults.text = "Draw!"
                
                lblSets.text = "Set : \(currentSet)"
                lblSets.sizeToFit()
                lblSets.isHidden = false
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    self.lblResults.text = "Shake for Roll!"
                    self.lblResults.textColor = UIColor.black
                }
                
                
            } else {
                
                playerScores.player2Score += 1
                lblScore2.text = String(playerScores.player2Score)
                
                lblResults.textColor = UIColor.systemIndigo
                lblResults.text = "Player 2 Won!"
                
                lblSets.text = "Set : \(currentSet)"
                lblSets.sizeToFit()
                lblSets.isHidden = false
                
                currentSet += 1
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    self.lblResults.text = "Shake for Roll!"
                    self.lblResults.textColor = UIColor.black
                }
                
            }
        }
        
        
    }
    
    
    
    func createDiceValues() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            let dice1 = arc4random_uniform(6) + 1
            let dice2 = arc4random_uniform(6) + 1
            
            self.imgPlayer1Dice.image = UIImage(named: String(dice1))
            self.imgPlayer2Dice.image = UIImage(named: String(dice2))
            

            
            self.afterSet(dice1: Int(dice1), dice2: Int(dice2))
        }
        
        imgPlayer1Dice.image = UIImage(named: "bilinmeyenZar")
        imgPlayer2Dice.image = UIImage(named: "bilinmeyenZar")
        imgPlayer1Dice.shake(1)
        imgPlayer2Dice.shake(1)
        
    }
    
    func endGame() {
        
        lblResults.textColor = UIColor.black
        
        if playerScores.player1Score > playerScores.player2Score {
            
            lblCurrentScore1.text = "0"
            lblCurrentScore2.text = "0"
            
            lblResults.text = "Player 1 Won The GAME!"
            lblSets.isHidden = true
        
        } else {
            
            lblCurrentScore1.text = "0"
            lblCurrentScore2.text = "0"
            
            lblResults.text = "Player 2 Won The GAME!"
            lblSets.isHidden = true
        
        }
    }
    
    

}

extension UIView {
    func shake(_ duration: Double? = 0.4) {
        self.transform = CGAffineTransform(translationX: 40, y: 20)
        UIView.animate(withDuration: duration ?? 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
}
