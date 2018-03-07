//
//  DatePopupViewController.swift
//  ReusablePopups
//
//  Created by Emiko Clark on 3/6/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class DatePopupViewController: UIViewController {
 
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    var showTimePicker: Bool = false
    var delegate: SelectTimeDelegate?
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: datePicker.date)
    }
    
    var formattedTime: String {
       let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: datePicker.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if showTimePicker {
            titleLabel.text = "Save Time"
            datePicker.datePickerMode = .time
            saveButton.setTitle("Save Time", for: .normal)
        }
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: .saveDateTime , object: self)
        delegate?.selectTime(time: formattedTime)
        dismiss(animated: true)
    }
}
