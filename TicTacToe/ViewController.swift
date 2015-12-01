//
//  ViewController.swift
//  TicTacToe
//
//  Created by Mbusi Hlatshwayo on 3/12/15.
//  Copyright (c) 2015 Mbusi Hlatshwayo. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    func isEven(turn: Int) ->Bool {
        if turn%2 == 0 {
            return true
        } else {
            return false
        }
    }
    
    // 0 = empty 1 = o 2 = cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var winner = 0
    var turnNumber = 1
    var clearBoard = false

    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var button0: UIButton!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!

    
    @IBAction func newGame(sender: AnyObject) {
        
        winner = 0
        turnNumber = 1
        winnerLabel.center = CGPointMake(winnerLabel.center.x - 400, winnerLabel.center.y)
        winnerLabel.hidden = true
        gameState = [0,0,0,0,0,0,0,0,0]
        
        /*crashes program?
        for var i = 0; i < 9; i++ {
            var button : UIButton = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal)
        }
        */
        
    
        button0.setImage(nil, forState: .Normal)
        button1.setImage(nil, forState: .Normal)
        button2.setImage(nil, forState: .Normal)
        button3.setImage(nil, forState: .Normal)
        button4.setImage(nil, forState: .Normal)
        button5.setImage(nil, forState: .Normal)
        button6.setImage(nil, forState: .Normal)
        button7.setImage(nil, forState: .Normal)
        button8.setImage(nil, forState: .Normal)
    
        
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
            if (gameState[sender.tag] == 0 && winner == 0) {
            let Ximage = UIImage(named: "ticTacX.png")
            let Oimage = UIImage(named: "ticTackO.png")
        
            if isEven(turnNumber) {
            
                sender.setImage(Ximage, forState: .Normal)
                gameState[sender.tag] = 2
    
            } else {
            
                sender.setImage(Oimage, forState: .Normal)
                gameState[sender.tag] = 1
                
            }
        
            for combination in winningCombinations {
                
                if (gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[0]] != 0) {
                    winner = gameState[combination[0]]
                }
            }
            
            if (winner != 0) {
                winnerLabel.hidden = false
                print(winner)
                if (winner == 1) {
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.winnerLabel.center = CGPointMake(self.winnerLabel.center.x + 400, self.winnerLabel.center.y)
                    })
                    winnerLabel.text = "O won!!"
                } else {
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.winnerLabel.center = CGPointMake(self.winnerLabel.center.x + 400, self.winnerLabel.center.y)
                    })
                    winnerLabel.text = "X won!!"
                }
            }
            turnNumber++
        }
    } 
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        winnerLabel.hidden = true
        winnerLabel.center = CGPointMake(winnerLabel.center.x - 400, winnerLabel.center.y)
    }

}

