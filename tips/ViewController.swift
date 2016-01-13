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
    @IBOutlet weak var splitTwo: UITextField!
    @IBOutlet weak var splitThree: UITextField!
    @IBOutlet weak var splitFour: UITextField!
    @IBOutlet weak var splitBG: UIView!
    @IBOutlet weak var splitTitle: UITextField!
    @IBOutlet weak var twoLabel: UITextField!
    @IBOutlet weak var threeLabel: UITextField!
    @IBOutlet weak var fourLabel: UITextField!
    
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
        self.tipControl.alpha = 0
        self.splitBG.alpha = 0
        self.splitTitle.alpha = 0
        self.twoLabel.alpha = 0
        self.threeLabel.alpha = 0
        self.fourLabel.alpha = 0
        self.splitTwo.alpha = 0
        self.splitThree.alpha = 0
        self.splitFour.alpha = 0
        
        tipLabel.text = "$0.00"
        totalLabel.text = "0.00"
        splitTwo.text = "0.00"
        splitThree.text = "0.00"
        splitFour.text = "0.00"
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

    @IBAction func onTapPrice(sender: AnyObject) {
        
        UIView.animateWithDuration(2.0, animations: {
            self.tipControl.alpha = 1.0
            })

    }
    
    @IBAction func onEditingChange(sender: AnyObject) {
        
        UIView.animateWithDuration(3.0, animations: {
            self.tipText.alpha = 1.0
            self.totalText.alpha = 1.0
            self.tipLabel.alpha = 1.0
            self.totalLabel.alpha = 1.0
            self.tipDivider.alpha = 1.0
            self.splitBG.alpha = 1.0
            self.splitTitle.alpha = 1.0
            self.twoLabel.alpha = 1.0
            self.threeLabel.alpha = 1.0
            self.fourLabel.alpha = 1.0
            self.splitTwo.alpha = 1.0
            self.splitThree.alpha = 1.0
            self.splitFour.alpha = 1.0
        })
        
        UIView.animateWithDuration(1.0, animations: {
            var newCenter = self.tipControl.center
            newCenter.y = 115
            self.tipControl.center = newCenter
        })

        UIView.animateWithDuration(1.0, animations: {
            var newCenter = self.dollarLabel.center
            newCenter.y = 175
            self.dollarLabel.center = newCenter
        })

        UIView.animateWithDuration(1.0, animations: {
            var newCenter = self.billField.center
            newCenter.y = 175
            self.billField.center = newCenter
        })

        var tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        let twoWay = total/2
        let threeWay = total/3
        let fourWay = total/4

        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        splitTwo.text = "$\(twoWay)"
        splitThree.text = "$\(threeWay)"
        splitFour.text = "$\(fourWay)"
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitTwo.text = String(format: "$%.2f", twoWay)
        splitThree.text = String(format: "$%.2f", threeWay)
        splitFour.text = String(format: "$%.2f", fourWay)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
 
}

