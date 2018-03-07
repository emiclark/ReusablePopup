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
    var observer: NSObjectProtocol?
    
    override func viewDidAppear(_ animated: Bool) {
        observer = NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
            let detailNotification = notification.object as! DatePopupViewController
            self.dateLabel.text = detailNotification.formattedDate
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}
