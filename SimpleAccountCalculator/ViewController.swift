//
//  ViewController.swift
//  SimpleAccountCalculator
//
//  Created by Lim Chang Siang on 12/2/18.
//  Copyright © 2018 Lim Chang Siang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldPrincipal: UITextField!
    @IBOutlet weak var textFieldNumberOfYears: UITextField!
    @IBOutlet weak var sliderNumberOfYears: UISlider!
    @IBOutlet weak var textFieldInterestRate: UITextField!
    @IBOutlet weak var sliderInterestRate: UISlider!
    @IBOutlet weak var labelAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textFieldPrincipal.text = "10000";
        textFieldNumberOfYears.text = "10";
        sliderNumberOfYears.value = 10;
        textFieldInterestRate.text = "1";
        sliderInterestRate.value = 1
    }

    @IBAction func sliderNumberOfYearsChanged( sender: Any){
        let valueNumberOfYears : Int = Int(sliderNumberOfYears.value);
        textFieldNumberOfYears.text = String(valueNumberOfYears);
        self.displayAmount(sender);
    }

    @IBAction func sliderInterestRateChange(sender: AnyObject){
        let valueInterestRate: Float = sliderInterestRate.value;
        textFieldInterestRate.text = NSString(format: "%.2f", valueInterestRate) as String;
        self.displayAmount(sender);
    }

    @IBAction func displayAmount(_ sender:Any){
        let principalAmount: Int = Int(textFieldPrincipal.text!)!
        let numberOfYears: Int = Int(textFieldNumberOfYears.text!)!
        let interestRate: Float = NSString(string: textFieldInterestRate.text!).floatValue / 100;
        let finalAmount = Double(principalAmount) * pow (Double(1+interestRate), Double(numberOfYears));
        labelAmount.text = NSString(format: "%.2f", finalAmount) as String;

        textFieldPrincipal.delegate = self;
        textFieldNumberOfYears.delegate = self;
        textFieldInterestRate.delegate = self;
    }

    func textFieldDidEndEditing(_ textField: UITextField){
        self.displayAmount(textField);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

