//
//  AttemptsViewController.swift
//  Memorization
//
//  Created by 90303107 on 10/9/2561 BE.
//  Copyright © 2561 BE 90303107. All rights reserved.
//

import UIKit

class AttemptsViewController: UIViewController {
    
    @IBOutlet weak var firstAttemptLabel: UILabel!
    @IBOutlet weak var secondAttemptLabel: UILabel!
    @IBOutlet weak var thirdAttemptLabel: UILabel!
    @IBOutlet weak var fourthAttemptLabel: UILabel!
    @IBOutlet weak var fifthAttemptLabel: UILabel!
    
    
    var scoresArray = [Int]()
    
    func resetAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        //create button
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { (action) in
            self.firstAttemptLabel.text = "--"
            self.secondAttemptLabel.text = "--"
            self.thirdAttemptLabel.text = "--"
            self.fourthAttemptLabel.text = "--"
            self.fifthAttemptLabel.text = "--"
            
            
            let defaults = UserDefaults.standard
            var scoresArray = defaults.array(forKey: "scoresArray")  as? [Int] ?? [Int]()
            
            while scoresArray.count > 0{
                scoresArray.remove(at: 0)
            }
            
            UserDefaults.standard.set(scoresArray, forKey: "scoresArray")
            UserDefaults.standard.set(scoresArray, forKey: "SavedIntArray")
            
            print(scoresArray)
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { (action) in
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func resetButton(_ sender: Any) {
        resetAlert(title: "Are you sure you want to reset your high scores?", message: "")
    }
    
    @IBAction func timeTrialButton(_ sender: Any) {
        performSegue(withIdentifier: "timeTrialSegue", sender: self)
    }
    @IBAction func backSegue(_ sender: Any) {
        performSegue(withIdentifier: "attemptsBackSegue", sender: self)
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    override func viewDidLoad() {
        

        let defaults = UserDefaults.standard
        let scoresArray = defaults.array(forKey: "SavedIntArray")  as? [Int] ?? [Int]()
        
        print(scoresArray)
        
        if scoresArray.count == 0{
            firstAttemptLabel.text = "--"
            secondAttemptLabel.text = "--"
            thirdAttemptLabel.text = "--"
            fourthAttemptLabel.text = "--"
            fifthAttemptLabel.text = "--"
        }
        else if scoresArray.count == 1{
            firstAttemptLabel.text = String(scoresArray[0])
        }
        else if scoresArray.count == 2{
            firstAttemptLabel.text = String(scoresArray[0])
            secondAttemptLabel.text = String(scoresArray[1])
        }
        else if scoresArray.count == 3{
            firstAttemptLabel.text = String(scoresArray[0])
            secondAttemptLabel.text = String(scoresArray[1])
            thirdAttemptLabel.text = String(scoresArray[2])
        }
        else if scoresArray.count == 4{
            firstAttemptLabel.text = String(scoresArray[0])
            secondAttemptLabel.text = String(scoresArray[1])
            thirdAttemptLabel.text = String(scoresArray[2])
            fourthAttemptLabel.text = String(scoresArray[3])
        }
        else if scoresArray.count == 5{
            firstAttemptLabel.text = String(scoresArray[0])
            secondAttemptLabel.text = String(scoresArray[1])
            thirdAttemptLabel.text = String(scoresArray[2])
            fourthAttemptLabel.text = String(scoresArray[3])
            fifthAttemptLabel.text = String(scoresArray[4])
        }
        
        //firstPlaceLabel.text = UserDefaults.standard.string(forKey: "Key")
        
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
