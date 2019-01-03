//
//  ViewController.swift
//  RotateSlider
//
//  Created by mac on 2019/01/03.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var valueSlider: UISlider!
    @IBOutlet weak var animateSwitch: UISwitch!
    @IBOutlet weak var knob: Knob!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        knob.lineWidth = 4
        knob.pointerLength = 12
        valueSlider.addTarget(self, action: #selector(self.handleValueChanged(_:)), for: .valueChanged)
    }
    
    @IBAction func handleValueChanged(_ sender: Any) {
        if sender is UISlider {
            knob.setValue(valueSlider.value)
        } else {
            valueSlider.value = knob.value
        }
        updateLabel()
    }
    @IBAction func handleRandomButtonPressed(_ sender: Any) {
        let randomValue = Float.random(in: 0..<101) / 100.0
        knob.setValue(randomValue, animated: animateSwitch.isOn)
        valueSlider.setValue(Float(randomValue), animated: animateSwitch.isOn)
        updateLabel()
    }
    
    func updateLabel() {
        valueLabel.text = String(format: "%.2f", knob.value)
    }
    
}

