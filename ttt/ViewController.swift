//
//  ViewController.swift
//  ttt
//
//  Created by David Rothschild on 1/7/16.
//  Copyright © 2016 Dave Rothschild. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // 0 = gray; 1 = red; 2 = blue
    var fillColor = 0
    
    // move indicated red or green
    // red is 5, blue is 6
    var red_blue = 5
    
    // track how many moves; 8 total...0 to 8
    var gameCount = 0

    @IBOutlet weak var boxPressed: UIButton!
    @IBOutlet weak var showMsg: UILabel!
    @IBAction func resetButton(sender: UIButton) {
         reset()
    }
    
    @IBOutlet var boxCollection: [UIButton]!
    @IBAction func boxPressed(sender: UIButton) {
        print("here is sender tag \(sender.tag)")
        if gameCount == 10 {
            reset()
        }
        if gameState[sender.tag] == 0 {
            if red_blue == 5 {
                sender.backgroundColor = UIColor.redColor()
                gameState[sender.tag] = 5
                red_blue = 6
                gameCount++
                print("in first if, red(5) 0: \(gameState)")
            } else {
                gameState[sender.tag] = 6
                sender.backgroundColor = UIColor.blueColor()
                red_blue = 5
                gameCount++
                print("in first if, blue(6) : \(gameState)")
            }
        }
        if gameCount == 9 {
            showMsg.text = "No winner, it is a draw"
            gameCount = 10
        }
        for combo in winningCombinations {
            if gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]] {
                if red_blue == 5 {
                    showMsg.text = "Blue Wins!"
                    gameCount = 10
                } else {
                    showMsg.text = "Red Wins!"
                    gameCount = 10
                }
            }
            
        }
    }
    
    
    func reset() {
        showMsg.text = "Start your engines!"
        red_blue = 5
        gameCount = 0
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        // change all colors to gray
        for box in boxCollection {
            box.backgroundColor = UIColor.grayColor()
        }
        
        // start game with red first
        red_blue = 5
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //boxPressed.backgroundColor = UIColor.blueColor()
        showMsg.text = "Start your engines!"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
