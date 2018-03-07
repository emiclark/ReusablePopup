//
//  ViewController.swift
//  ReusablePopups
//
//  Created by Emiko Clark on 3/6/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    var observer: NSObjectProtocol?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        observer = NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
            let dateVC = notification.object as! DatePopupViewController
            self.dateLabel.text = dateVC.formattedDate
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // code
        if segue.identifier == "toDatePopupViewControllerSegue" {
            let popup = segue.destination as! DatePopupViewController
            popup.showTimePicker = false
            self.present(popup, animated: true)
        }
    }
}

