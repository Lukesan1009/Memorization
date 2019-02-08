//
//  attemptsLeaderboard.swift
//  Memorization
//
//  Created by 90303107 on 10/7/2561 BE.
//  Copyright © 2561 BE 90303107. All rights reserved.
//

import UIKit


class attemptsLeaderboard: UIViewController {
    
    @IBOutlet weak var firstPlaceLabel: UILabel!
    @IBOutlet weak var secondPlaceLabel: UILabel!
    @IBOutlet weak var thirdPlaceLabel: UILabel!
    @IBOutlet weak var fourthPlaceLabel: UILabel!
    @IBOutlet weak var fifthPlaceLabel: UILabel!
    @IBOutlet weak var firstPlace: UILabel!
    @IBOutlet weak var secondPlace: UILabel!
    @IBOutlet weak var thirdPlace: UILabel!
    @IBOutlet weak var fourthPlace: UILabel!
    @IBOutlet weak var fifthPlace: UILabel!
    
    func resetAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        //create button
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { (action) in
            self.firstPlaceLabel.text = "--"
            self.secondPlaceLabel.text = "--"
            self.thirdPlaceLabel.text = "--"
            self.fourthPlaceLabel.text = "--"
            self.fifthPlaceLabel.text = "--"
            
            
            
            let defaults2 = UserDefaults.standard
            var compareArray = defaults2.array(forKey: "SavedCompareArray")  as? [Double] ?? [Double]()
            
            while compareArray.count > 0{
                compareArray.remove(at: 0)
            }
            
            let defaults1 = UserDefaults.standard
            var timeArray = defaults1.array(forKey: "SavedDoubleArray")  as? [String] ?? [String]()
            
            while timeArray.count > 0{
                timeArray.remove(at: 0)
            }
            
            UserDefaults.standard.set(compareArray, forKey: "compareArray")
            UserDefaults.standard.set(timeArray, forKey: "timeScoresArray")
            UserDefaults.standard.set(compareArray, forKey: "SavedCompareArray")
            UserDefaults.standard.set(timeArray, forKey: "SavedDoubleArray")
            
            print(timeArray)
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { (action) in
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func resetButton(_ sender: Any) {
        resetAlert(title: "Are you sure you want to reset your high scores?", message: "")
    }
    
    @IBAction func normalButton(_ sender: Any) {
        performSegue(withIdentifier: "normalSegue1", sender: self)
    }
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "leaderboardBack", sender: self)
    }
    
    override func viewDidLoad() {
        
        
        
        let defaults1 = UserDefaults.standard
        let timeArray = defaults1.array(forKey: "SavedDoubleArray")  as? [String] ?? [String]()
        
        print(timeArray)
        
        if timeArray.count == 0{
            firstPlaceLabel.text = "--"
            secondPlaceLabel.text = "--"
            thirdPlaceLabel.text = "--"
            fourthPlaceLabel.text = "--"
            fifthPlaceLabel.text = "--"
        }
        else if timeArray.count == 1{
            firstPlaceLabel.text = String(timeArray[0])
        }
        else if timeArray.count == 2{
            firstPlaceLabel.text = String(timeArray[0])
            secondPlaceLabel.text = String(timeArray[1])
        }
        else if timeArray.count == 3{
            firstPlaceLabel.text = String(timeArray[0])
            secondPlaceLabel.text = String(timeArray[1])
            thirdPlaceLabel.text = String(timeArray[2])
        }
        else if timeArray.count == 4{
            firstPlaceLabel.text = String(timeArray[0])
            secondPlaceLabel.text = String(timeArray[1])
            thirdPlaceLabel.text = String(timeArray[2])
            fourthPlaceLabel.text = String(timeArray[3])
        }
        else if timeArray.count == 5{
            firstPlaceLabel.text = String(timeArray[0])
            secondPlaceLabel.text = String(timeArray[1])
            thirdPlaceLabel.text = String(timeArray[2])
            fourthPlaceLabel.text = String(timeArray[3])
            fifthPlaceLabel.text = String(timeArray[4])
        }
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
