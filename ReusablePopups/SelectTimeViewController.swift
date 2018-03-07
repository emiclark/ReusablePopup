//
//  SelectTimeViewController.swift
//  ReusablePopups
//
//  Created by Emiko Clark on 3/6/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class SelectTimeViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func selectTimeButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "DatePopupViewController", bundle: nil)
        let popup = storyboard.instantiateInitialViewController() as! DatePopupViewController
        popup.showTimePicker = true
        popup.delegate = self
        self.present(popup, animated: true)
    }
}

extension SelectTimeViewController: SelectTimeDelegate {
    func selectTime(time: String) {
        self.timeLabel.text = time
    }
}
