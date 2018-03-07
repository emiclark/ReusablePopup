//
//  SecondViewController.swift
//  ReusablePopups
//
//  Created by Emiko Clark on 3/6/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDatePopupViewControllerSegue" {
            let popup = segue.destination as! DatePopupViewController
            popup.showTimePicker = false
            
//          // method 1: defines and assigns local function
//            popup.onSave = onSave
            
            // method 2: use a closure
            popup.onSave = { (data) in
                self.dateLabel.text = data
            }
            
            self.present(popup, animated: true)
        }
    }
    
// method 1: defines local onSave function to pass to DataPopupViewController
//    func onSave(_ data: String) ->() {
//        self.dateLabel.text = data
//    }
}
