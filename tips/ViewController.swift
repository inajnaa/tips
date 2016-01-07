//
//  ViewController.swift
//  tips
//
//  Created by Anjani Bhargava on 1/4/16.
//  Copyright © 2016 Anjani Bhargava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var dollarLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipTitle: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipDivider: UIView!
    @IBOutlet weak var totalText: UILabel!
    @IBOutlet weak var tipIcon: UIImageView!
    @IBOutlet weak var tipText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        self.billField.alpha = 0
        self.dollarLabel.alpha = 0
        self.tipIcon.alpha = 0
        self.tipText.alpha = 0
        self.totalText.alpha = 0
        self.tipLabel.alpha = 0
        self.totalLabel.alpha = 0
        self.tipDivider.alpha = 0
        tipLabel.text = "$0.00"
        totalLabel.text = "0.00"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated:Bool){
        super.viewDidAppear(animated)
        UIView.animateWithDuration(2.0, animations: {
            self.billField.alpha = 1.0
            self.dollarLabel.alpha = 1.0
            self.tipIcon.alpha = 1.0
        })
    }

    
    @IBAction func onEditingChange(sender: AnyObject) {
        
        UIView.animateWithDuration(3.0, animations: {
            self.tipText.alpha = 1.0
            self.totalText.alpha = 1.0
            self.tipLabel.alpha = 1.0
            self.totalLabel.alpha = 1.0
            self.tipDivider.alpha = 1.0
        })
        
        UIView.animateWithDuration(1.0, animations: {
            var newCenter = self.tipControl.center
            newCenter.y = 115
            self.tipControl.center = newCenter
        })

        UIView.animateWithDuration(1.0, animations: {
            var newCenter = self.dollarLabel.center
            newCenter.y = 165
            self.dollarLabel.center = newCenter
        })

        UIView.animateWithDuration(1.0, animations: {
            var newCenter = self.billField.center
            newCenter.y = 165
            self.billField.center = newCenter
        })

        var tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip

        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

