//
//  NViewController.swift
//  HW_GuessNumber
//
//  Created by Zoey on 2016/11/1.
//  Copyright © 2016年 Zoey. All rights reserved.
//

import UIKit

class NViewController: UIViewController {
    
    
    
    @IBOutlet weak var nuberTF: UITextField!
    @IBOutlet weak var hintLB: UILabel!
    @IBOutlet weak var lifeLeft: UILabel!
    @IBOutlet weak var bgImage2: UIImageView!
    @IBOutlet weak var messageAboutLife: UILabel!
    
    
    var answerNumber = Int()
    var guessNum = 0
    var guessChance:Int = 6
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImage2.isHidden = true
        hintLB.isHidden = true
        lifeLeft.isHidden = true
        messageAboutLife.isHidden = true
        answerNumber = Int(arc4random_uniform(20))+1
        nuberTF.text = ""
        guessChance = 6
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func rePlayAlert(){
        let deadAlert = UIAlertController(title: "遊戲結束", message: "很遺憾，你沒能解開心鎖，心鎖密碼是\(answerNumber)", preferredStyle: .alert)
        let replayBut = UIAlertAction(title: "重來", style: .default, handler: {(action:UIAlertAction) -> () in
            self.viewDidLoad()
        })
        deadAlert.addAction(replayBut)
        self.present(deadAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func rePlayBtn(_ sender: Any) {
        viewDidLoad()
    }
    @IBAction func goGuess(_ sender: Any) {
        
        hintLB.isHidden = false
        lifeLeft.isHidden = false
        messageAboutLife.isHidden = false
        
        
        
        if nuberTF.text != nil {
            
            if Int(nuberTF.text!)! <= 20 {
                
                
                if Int(nuberTF.text!) == answerNumber {
                    hintLB.text = "心鎖解開了，恭喜你"
                    bgImage2.isHidden = false
                    lifeLeft.isHidden = true
                    messageAboutLife.isHidden = true
                    
                }
                else if Int(nuberTF.text!)! > answerNumber {
                    hintLB.text = "太超過，這樣心鎖解不開"
                    guessChance -= 1
                    lifeLeft.text = String(guessChance)
                }
                else {
                    hintLB.text = "不夠啊，這樣心鎖解不開"
                    guessChance -= 1
                    lifeLeft.text = String(guessChance)
                }
            }
            else{
                hintLB.text = "說好是20以下，認真點解開心鎖吧"
                guessChance -= 1
                lifeLeft.text = String(guessChance)
                
            }
            if guessChance <= 0 {
                rePlayAlert()
            }
            
        }
    }
}



