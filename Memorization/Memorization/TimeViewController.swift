//
//  ViewController.swift
//  Memorization
//
//  Created by 90303107 on 9/24/2561 BE.
//  Copyright © 2561 BE 90303107. All rights reserved.
//

import UIKit
import AVFoundation


class TimeViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var countdown: UILabel!
    @IBOutlet weak var allStackView: UIStackView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var playAgain: UIView!
    @IBOutlet weak var congrats: UILabel!
    @IBOutlet weak var whitebg: UIView!
    @IBOutlet weak var card1: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card3: UIButton!
    @IBOutlet weak var card4: UIButton!
    @IBOutlet weak var card5: UIButton!
    @IBOutlet weak var card6: UIButton!
    @IBOutlet weak var card7: UIButton!
    @IBOutlet weak var card8: UIButton!
    @IBOutlet weak var card9: UIButton!
    @IBOutlet weak var card10: UIButton!
    @IBOutlet weak var card11: UIButton!
    @IBOutlet weak var card12: UIButton!
    @IBOutlet weak var card13: UIButton!
    @IBOutlet weak var card14: UIButton!
    @IBOutlet weak var card15: UIButton!
    @IBOutlet weak var card16: UIButton!
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    var colorArray = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8]
    var buttonLabelColor = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    var orangeArray = [0,0]
    var randomArray = [Int]()
    var buttonArray = [Int]()
    var guesses = 0
    var correctNumber = 0
    
    var finalTime = ""
    var firstPlaceScore = ""
    
    var compareArray = [Double]()
    var timeArray = [String]()
    
    
    func transferTimes(){
        UserDefaults.standard.set(true, forKey: "Key") //Bool
        UserDefaults.standard.set(1, forKey: "Key")  //Integer
        UserDefaults.standard.set(firstPlaceScore, forKey: "Key") //setObject
    }
    // remove or remove buttons function
    func addButtons(){
        allStackView.isHidden = false
    }
    func removeButtons(){
        allStackView.isHidden = true
    }
    
    var minutes = 0
    var seconds = 0
    var decimal = 0
    
    var minutes1: Double = 0
    var seconds1: Double = 0
    var decimal1: Double = 0
    
    var timer = Timer()
    var timer1 = Timer()
    var number = 3
    
    func timerStart(){
        timer = Timer.scheduledTimer(timeInterval: (1/10), target: self, selector: #selector(TimeViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        decimal += 1
        decimal1 += 1
        if seconds < 10{
            timerLabel.text = "\(minutes)" + ":" + "0" + "\(seconds)" + ".\(decimal)"
        }else{
            timerLabel.text = "\(minutes)" + ":" + "\(seconds)" + ".\(decimal)"
        }
        if decimal == 10{
            seconds += 1
            seconds1 += 1
            decimal = 0
            decimal1 = 0
            if seconds == 60{
                seconds = 0
                seconds1 = 0
                minutes += 1
                minutes1 += 1
                timerLabel.text = "\(minutes)" + ":" + "0" + "\(seconds)" + ".\(decimal)"
            }else if seconds < 10{
                timerLabel.text = "\(minutes)" + ":" + "0" + "\(seconds)" + ".\(decimal)"
            }else{
                timerLabel.text = "\(minutes)" + ":" + "\(seconds)" + ".\(decimal)"
            }
        }
    }
    
    func sound(){
        player.play()
    }
    
    func randomize(){
        if colorArray.count == 0{
            while randomArray.count > 0{
                colorArray.append(randomArray[0])
                randomArray.remove(at: 0)
            }
        }
        while colorArray.count > 0{
            let randomNumber = Int(arc4random_uniform(UInt32(colorArray.count)))
            randomArray.append(colorArray[randomNumber])
            colorArray.remove(at: randomNumber)
        }
    }
    
    func correct(){
        correctNumber += 1
        if correctNumber == 16{
            print("nice!")
            congratsFunc()
        }
    }
    func congratsFunc(){
        if seconds < 10{
            finalTime = "\(minutes):0\(seconds).\(decimal)"
        }else{
            finalTime = "\(minutes):\(seconds).\(decimal)"
        }
        let string = "Nice job!\n\nYour time: \(finalTime)"
        
        print(minutes1)
        print(seconds1)
        print(decimal1)
        
        let x: Double = minutes1
        let y: Double = seconds1 / 100
        let z: Double = decimal1 / 1000
        let score: Double = x + y + z
        print(score)
        
        congrats.text = String(string)
        congrats.isHidden = false
        playAgain.isHidden = false
        randomize()
        timerLabel.isHidden = true
        timerLabel.text = String("0")
        timer.invalidate()
        
        
        if timeArray.count < 5{
            timeArray.append(finalTime)
            timeArray.sort()
            compareArray.append(score)
            compareArray.sort()
        }
        else if score < compareArray[4]{
            timeArray.remove(at: 4)
            timeArray.append(finalTime)
            timeArray.sort()
            compareArray.remove(at: 4)
            compareArray.append(score)
            compareArray.sort()
            
        }
        UserDefaults.standard.set(timeArray, forKey: "timeScoresArray")
        UserDefaults.standard.set(compareArray, forKey: "compareArray")
        
        let defaults1 = UserDefaults.standard
        defaults1.set(timeArray, forKey: "SavedDoubleArray")
        
        let defaults2 = UserDefaults.standard
        defaults2.set(compareArray, forKey: "SavedCompareArray")
        
        
        
        
        
    }
    func remove(){
        while buttonArray.count > 0{
            buttonArray.remove(at: 0)
        }
    }
    
    func ifelsenot(arrayNumber: Int){
        if  arrayNumber == 0 {
            self.card1.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card1.isUserInteractionEnabled = true
        }
        if arrayNumber == 1 {
            self.card2.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card2.isUserInteractionEnabled = true
        }
        if arrayNumber == 2 {
            self.card3.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card3.isUserInteractionEnabled = true
        }
        if arrayNumber == 3 {
            self.card4.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card4.isUserInteractionEnabled = true
        }
        if arrayNumber == 4 {
            self.card5.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card5.isUserInteractionEnabled = true
        }
        if arrayNumber == 5 {
            self.card6.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card6.isUserInteractionEnabled = true
        }
        if arrayNumber == 6 {
            self.card7.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card7.isUserInteractionEnabled = true
        }
        if arrayNumber == 7 {
            self.card8.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card8.isUserInteractionEnabled = true
        }
        if arrayNumber == 8 {
            self.card9.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card9.isUserInteractionEnabled = true
        }
        if arrayNumber == 9 {
            self.card10.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card10.isUserInteractionEnabled = true
        }
        if arrayNumber == 10 {
            self.card11.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card11.isUserInteractionEnabled = true
        }
        if arrayNumber == 11 {
            self.card12.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card12.isUserInteractionEnabled = true
        }
        if arrayNumber == 12 {
            self.card13.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card13.isUserInteractionEnabled = true
        }
        if arrayNumber == 13 {
            self.card14.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card14.isUserInteractionEnabled = true
        }
        if arrayNumber == 14 {
            self.card15.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card15.isUserInteractionEnabled = true
        }
        if arrayNumber == 15 {
            self.card16.setImage(UIImage(named: "orange"), for: UIControl.State.normal)
            card16.isUserInteractionEnabled = true
        }
        remove()
    }
    func ifelse(arrayNumber: Int){
        if  arrayNumber == 0 {
            card1.isUserInteractionEnabled = false
            card1.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            correct()
            sound()
            
        }
        if arrayNumber == 1 {
            card2.isUserInteractionEnabled = false
            card2.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            correct()
            sound()
        }
        if arrayNumber == 2 {
            card3.isUserInteractionEnabled = false
            card3.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            
            correct()
            sound()
        }
        if arrayNumber == 3 {
            card4.isUserInteractionEnabled = false
            card4.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            correct()
            sound()
        }
        if arrayNumber == 4 {
            card5.isUserInteractionEnabled = false
            card5.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            correct()
            sound()
        }
        if arrayNumber == 5 {
            card6.isUserInteractionEnabled = false
            card6.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            correct()
            sound()
        }
        if arrayNumber == 6 {
            card7.isUserInteractionEnabled = false
            card7.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            correct()
            sound()
        }
        if arrayNumber == 7 {
            card8.isUserInteractionEnabled = false
            card8.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            correct()
            sound()
        }
        if arrayNumber == 8 {
            card9.isUserInteractionEnabled = false
            card9.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            correct()
            sound()
        }
        if arrayNumber == 9 {
            card10.isUserInteractionEnabled = false
            card10.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            correct()
            sound()
        }
        if arrayNumber == 10 {
            card11.isUserInteractionEnabled = false
            card11.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            correct()
            sound()
        }
        if arrayNumber == 11 {
            card12.isUserInteractionEnabled = false
            card12.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            correct()
            sound()
        }
        if arrayNumber == 12 {
            card13.isUserInteractionEnabled = false
            card13.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            correct()
            sound()
        }
        if arrayNumber == 13 {
            card14.isUserInteractionEnabled = false
            card14.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            correct()
            sound()
        }
        if arrayNumber == 14 {
            card15.isUserInteractionEnabled = false
            card15.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            correct()
            sound()
        }
        if arrayNumber == 15 {
            card16.isUserInteractionEnabled = false
            card16.setImage(UIImage(named: "black"), for: UIControl.State.normal)
            remove()
            correct()
            sound()
        }
        
    }
    func buttonColor(sender: UIButton){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(7/4), execute: {
            if self.buttonArray[0] == self.buttonArray[1]{
                if self.buttonArray[0] == 1 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 1{
                            self.ifelse(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }else if self.buttonArray[0] == 2 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 2{
                            self.ifelse(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }else if self.buttonArray[0] == 3 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 3{
                            self.ifelse(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }else if self.buttonArray[0] == 4 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 4{
                            self.ifelse(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }else if self.buttonArray[0] == 5 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 5{
                            self.ifelse(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }else if self.buttonArray[0] == 6 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 6{
                            self.ifelse(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }else if self.buttonArray[0] == 7 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 7{
                            self.ifelse(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }else if self.buttonArray[0] == 8 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 8{
                            self.ifelse(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }
                sender.setImage(UIImage(named: "black")!, for: .normal)
            }else{
                if self.buttonArray[0] == 1 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 1{
                            self.ifelsenot(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }else if self.buttonArray[0] == 2 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 2{
                            self.ifelsenot(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }else if self.buttonArray[0] == 3 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 3{
                            self.ifelsenot(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }else if self.buttonArray[0] == 4 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 4{
                            self.ifelsenot(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }else if self.buttonArray[0] == 5 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 5{
                            self.ifelsenot(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }else if self.buttonArray[0] == 6 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 6{
                            self.ifelsenot(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }else if self.buttonArray[0] == 7 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 7{
                            self.ifelsenot(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }else if self.buttonArray[0] == 8 {
                    var x = self.randomArray.count
                    while x > 0 {
                        if self.randomArray[x-1] == 8{
                            self.ifelsenot(arrayNumber: (x-1))
                        }
                        x -= 1
                    }
                }
                sender.setImage(UIImage(named: "orange")!, for: .normal)
            }
        })
    }
    
    //when play again button is clicked
    @IBAction func playAgainButton(_ sender: UIButton) {
        if colorArray.count == 0{
            var x = 15
            while x >= 0{
                ifelsenot(arrayNumber: x)
                x -= 1
            }
            correctNumber = 0
            guesses = 0
            congrats.isHidden = true
            playAgain.isHidden = true
            timerLabel.isHidden = false
            timerStart()
        }
    }
    
    @IBAction func timeBackButton(_ sender: Any) {
        performSegue(withIdentifier: "timeBackSegue", sender: self)
    }
    
    @IBAction func button1(_ sender: UIButton) {
        buttonArray.append(randomArray[0])
        if randomArray[0] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card1.setImage(UIImage(named: "\(randomArray[0])"), for: UIControl.State.normal)
                card1.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card1.setImage(UIImage(named: "\(randomArray[0])"), for: UIControl.State.normal)
            buttonColor(sender: self.card1)
        }else if buttonArray.count > 2{
        }
        
    }
    @IBAction func button2(_ sender: UIButton) {
        buttonArray.append(randomArray[1])
        if randomArray[1] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card2.setImage(UIImage(named: "\(randomArray[1])"), for: UIControl.State.normal)
                card2.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card2.setImage(UIImage(named: "\(randomArray[1])"), for: UIControl.State.normal)
            buttonColor(sender: self.card2)
        }else if buttonArray.count > 2{
        }
    }
    @IBAction func button3(_ sender: UIButton) {
        buttonArray.append(randomArray[2])
        if randomArray[2] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card3.setImage(UIImage(named: "\(randomArray[2])"), for: UIControl.State.normal)
                card3.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card3.setImage(UIImage(named: "\(randomArray[2])"), for: UIControl.State.normal)
            buttonColor(sender: self.card3)
        }else if buttonArray.count > 2{
        }
    }
    @IBAction func button4(_ sender: UIButton) {
        buttonArray.append(randomArray[3])
        if randomArray[3] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card4.setImage(UIImage(named: "\(randomArray[3])"), for: UIControl.State.normal)
                card4.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card4.setImage(UIImage(named: "\(randomArray[3])"), for: UIControl.State.normal)
            buttonColor(sender: self.card4)
        }else if buttonArray.count > 2{
        }
    }
    @IBAction func button5(_ sender: UIButton) {
        buttonArray.append(randomArray[4])
        if randomArray[4] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card5.setImage(UIImage(named: "\(randomArray[4])"), for: UIControl.State.normal)
                card5.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card5.setImage(UIImage(named: "\(randomArray[4])"), for: UIControl.State.normal)
            buttonColor(sender: self.card5)
        }else if buttonArray.count > 2{
        }
    }
    @IBAction func button6(_ sender: UIButton) {
        buttonArray.append(randomArray[5])
        if randomArray[5] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card6.setImage(UIImage(named: "\(randomArray[5])"), for: UIControl.State.normal)
                card6.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card6.setImage(UIImage(named: "\(randomArray[5])"), for: UIControl.State.normal)
            buttonColor(sender: self.card6)
        }else if buttonArray.count > 2{
        }
    }
    @IBAction func button7(_ sender: UIButton) {
        buttonArray.append(randomArray[6])
        if randomArray[6] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card7.setImage(UIImage(named: "\(randomArray[6])"), for: UIControl.State.normal)
                card7.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card7.setImage(UIImage(named: "\(randomArray[6])"), for: UIControl.State.normal)
            buttonColor(sender: self.card7)
        }else if buttonArray.count > 2{
        }
    }
    @IBAction func button8(_ sender: UIButton) {
        buttonArray.append(randomArray[7])
        if randomArray[7] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card8.setImage(UIImage(named: "\(randomArray[7])"), for: UIControl.State.normal)
                card8.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card8.setImage(UIImage(named: "\(randomArray[7])"), for: UIControl.State.normal)
            buttonColor(sender: self.card8)
        }else if buttonArray.count > 2{
        }
    }
    @IBAction func button9(_ sender: UIButton) {
        buttonArray.append(randomArray[8])
        if randomArray[8] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card9.setImage(UIImage(named: "\(randomArray[8])"), for: UIControl.State.normal)
                card9.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card9.setImage(UIImage(named: "\(randomArray[8])"), for: UIControl.State.normal)
            buttonColor(sender: self.card9)
        }else if buttonArray.count > 2{
        }
    }
    @IBAction func button10(_ sender: UIButton) {
        buttonArray.append(randomArray[9])
        if randomArray[9] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card10.setImage(UIImage(named: "\(randomArray[9])"), for: UIControl.State.normal)
                card10.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card10.setImage(UIImage(named: "\(randomArray[9])"), for: UIControl.State.normal)
            buttonColor(sender: self.card10)
        }else if buttonArray.count > 2{
        }
    }
    @IBAction func button11(_ sender: UIButton) {
        buttonArray.append(randomArray[10])
        if randomArray[10] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card11.setImage(UIImage(named: "\(randomArray[10])"), for: UIControl.State.normal)
                card11.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card11.setImage(UIImage(named: "\(randomArray[10])"), for: UIControl.State.normal)
            buttonColor(sender: self.card11)
        }else if buttonArray.count > 2{
        }
    }
    @IBAction func button12(_ sender: UIButton) {
        buttonArray.append(randomArray[11])
        if randomArray[11] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card12.setImage(UIImage(named: "\(randomArray[11])"), for: UIControl.State.normal)
                card12.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card12.setImage(UIImage(named: "\(randomArray[11])"), for: UIControl.State.normal)
            buttonColor(sender: self.card12)
        }else if buttonArray.count > 2{
        }
    }
    @IBAction func button13(_ sender: UIButton) {
        buttonArray.append(randomArray[12])
        if randomArray[12] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card13.setImage(UIImage(named: "\(randomArray[12])"), for: UIControl.State.normal)
                card13.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card13.setImage(UIImage(named: "\(randomArray[12])"), for: UIControl.State.normal)
            buttonColor(sender: self.card13)
        }else if buttonArray.count > 2{
        }
    }
    @IBAction func button14(_ sender: UIButton) {
        buttonArray.append(randomArray[13])
        if randomArray[13] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card14.setImage(UIImage(named: "\(randomArray[13])"), for: UIControl.State.normal)
                card14.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card14.setImage(UIImage(named: "\(randomArray[13])"), for: UIControl.State.normal)
            buttonColor(sender: self.card14)
        }else if buttonArray.count > 2{
        }
    }
    @IBAction func button15(_ sender: UIButton) {
        buttonArray.append(randomArray[14])
        if randomArray[14] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card15.setImage(UIImage(named: "\(randomArray[14])"), for: UIControl.State.normal)
                card15.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card15.setImage(UIImage(named: "\(randomArray[14])"), for: UIControl.State.normal)
            buttonColor(sender: self.card15)
        }else if buttonArray.count > 2{
        }
    }
    @IBAction func button16(_ sender: UIButton) {
        buttonArray.append(randomArray[15])
        if randomArray[15] == buttonArray[0]{
            if buttonArray.count > 2{
            }else{
                card16.setImage(UIImage(named: "\(randomArray[15])"), for: UIControl.State.normal)
                card16.isUserInteractionEnabled = false
            }
        }
        if buttonArray.count == 2{
            card16.setImage(UIImage(named: "\(randomArray[15])"), for: UIControl.State.normal)
            buttonColor(sender: self.card16)
        }else if buttonArray.count > 2{
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        // delay buttons appearing
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            // add buttons
            self.addButtons()
            
            // start timer
            self.timerStart()

        })
        
    }
    
    func delayTimer(){
        timer1 = Timer.scheduledTimer(timeInterval: (95/100), target: self, selector: #selector(TimeViewController.updateDelay), userInfo: nil, repeats: true)
    }
    @objc func updateDelay(){
        number -= 1
        countdown.text = "\(number)"
        if number == 0{
            countdown.text = "Go!"
        }
        else if number == (-1){
            timer1.invalidate()
            countdown.isHidden = true
        }
    }
    override func viewDidLoad() {
        delayTimer()
        removeButtons()
        playAgain.isHidden = true
        randomize()
        print(randomArray)
        congrats.isHidden = true
        congrats.isHidden = true
        
        //saved timeScores array
        if let x = UserDefaults.standard.array(forKey: "timeScoresArray") as? [String]{
            timeArray = x
        }
        if let x = UserDefaults.standard.array(forKey: "compareArray") as? [Double]{
            compareArray = x
        }
        
        
        // rounded corners for cards
        card1.layer.cornerRadius = 7
        card1.clipsToBounds = true
        card2.layer.cornerRadius = 7
        card2.clipsToBounds = true
        card3.layer.cornerRadius = 7
        card3.clipsToBounds = true
        card4.layer.cornerRadius = 7
        card4.clipsToBounds = true
        card5.layer.cornerRadius = 7
        card5.clipsToBounds = true
        card6.layer.cornerRadius = 7
        card6.clipsToBounds = true
        card7.layer.cornerRadius = 7
        card7.clipsToBounds = true
        card8.layer.cornerRadius = 7
        card8.clipsToBounds = true
        card9.layer.cornerRadius = 7
        card9.clipsToBounds = true
        card10.layer.cornerRadius = 7
        card10.clipsToBounds = true
        card11.layer.cornerRadius = 7
        card11.clipsToBounds = true
        card12.layer.cornerRadius = 7
        card12.clipsToBounds = true
        card13.layer.cornerRadius = 7
        card13.clipsToBounds = true
        card14.layer.cornerRadius = 7
        card14.clipsToBounds = true
        card15.layer.cornerRadius = 7
        card15.clipsToBounds = true
        card16.layer.cornerRadius = 7
        card16.clipsToBounds = true
        
        // audio function
        do{
            
            let audioPlayer = Bundle.main.path(forResource: "aye", ofType: "m4a")
            
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPlayer!) as URL)
            
        }
        catch{
            
            //ERROR
            
            
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
}

