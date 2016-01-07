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
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipDivider: UIView!
    @IBOutlet weak var tipIcon: UIImageView!
    @IBOutlet weak var tipLabelBG: UIView!
    @IBOutlet weak var totalLabelBG: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        self.billField.alpha = 0
        self.dollarLabel.alpha = 0
        self.tipIcon.alpha = 0
        self.tipLabelBG.alpha = 0
        self.totalLabelBG.alpha = 0
        tipLabel.text = "$0.00"
        totalLabel.text = "0.00"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated:Bool){
        super.viewDidAppear(animated)
        UIView.animateWithDuration(3.0, animations: {
            self.billField.alpha = 1.0
            self.dollarLabel.alpha = 1.0
            self.tipIcon.alpha = 1.0
        })
    }

    
    @IBAction func onEditingChange(sender: AnyObject) {
        
        UIView.animateWithDuration(4.0, animations: {
            self.tipLabelBG.alpha = 0.4
            self.totalLabelBG.alpha = 0.4
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

