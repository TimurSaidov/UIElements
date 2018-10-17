//
//  ViewController.swift
//  UIElements
//
//  Created by Timur Saidov on 17/10/2018.
//  Copyright © 2018 Timur Saidov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var hideAllElements: UISwitch!
    @IBOutlet weak var hideLabel: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            textLabel.text = "The first segment is selected"
        case 1:
            textLabel.text = "The second segment is selected"
        case 2:
            textLabel.text = "The third segment is selected"
        default:
            print("Wrong")
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard textField.text?.isEmpty == false else { return }
        
        if let _ = Double(textField.text!) {
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your name!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
                self.textField.text = nil
            }
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            print("Wrong format")
        } else {
            textLabel.text = textField.text
            textField.text = nil
        }
        
    }
    
    @IBAction func changeDate(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter() // Экземпляр класса DateFormatter, для конвертации даты в определенный формат.
        dateFormatter.dateStyle = .long // Запись даты.
//        dateFormatter.locale = Locale(identifier: "ru_Ru") // Локализация даты.
        
        let dateValue = dateFormatter.string(from: sender.date) // Перевод даты типа Date в строку.
        textLabel.text = dateValue
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        segmentedControl.isHidden = !segmentedControl.isHidden
        textLabel.isHidden = !textLabel.isHidden
        textField.isHidden = !textField.isHidden
        datePicker.isHidden = !datePicker.isHidden
        enterButton.isHidden = !enterButton.isHidden
        
        if sender.isOn {
            hideLabel.text = "Show all elements"
        } else {
            hideLabel.text = "Hide all elements"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.font = textLabel.font.withSize(20)

        if segmentedControl.selectedSegmentIndex == 0 {
            textLabel.text = "The first segment is selected\n"
        }
        
//        hideAllElements.isOn = false
        
//        datePicker.locale = Locale.init(identifier: "ru_Ru") // Локализация datePicker.
    }
}

