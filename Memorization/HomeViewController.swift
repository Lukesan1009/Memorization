//
//  HomeViewController.swift
//  Memorization
//
//  Created by 90303107 on 10/4/2561 BE.
//  Copyright © 2561 BE 90303107. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func playButton(_ sender: Any) {
        
        performSegue(withIdentifier: "playSegue", sender: self)
        
    }
    @IBAction func timeButton(_ sender: Any) {
        performSegue(withIdentifier: "timeSegue", sender: self)
    }
    @IBAction func leaderboardButton(_ sender: Any) {
        performSegue(withIdentifier: "leaderboardSegue", sender: self)
    }
    override func viewDidLoad() {
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
