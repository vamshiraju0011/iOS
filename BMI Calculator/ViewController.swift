//
//  ViewController.swift
//  BMI Calculator
//
//  Created by user238595 on 2/9/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var SegmentedController: UISegmentedControl!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var bmiResult: UILabel!
    
    @IBOutlet weak var bmiCategory: UILabel!
    
    func updateUnitLabels(){
        
        if SegmentedController.selectedSegmentIndex == 0 {
            heightLabel.text = "cm"
            weightLabel.text = "kg"
        }
        else {
            heightLabel.text = "in"
            weightLabel.text = "lb"
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUnitLabels()
        bmiResult.text = "Your BMI is: "
        bmiCategory.text = "BMI Category : "
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SegmentedControllerAction(_ sender: Any) {
        updateUnitLabels()
    }
    
    
    @IBAction func CalculateBMI(_ sender: Any) {
        
        //bmiResult.text = "SUCCESS"
        guard let heightString = heightTextField.text, let weightString = weightTextField.text, let height = Double(heightString), let weight = Double(weightString) else{
            print("Invalid Input")
            return;
        }
        if height <= 0 {
            heightLabel.text = "Invalid Input"
            return;
        }
        if weight <= 0 {
            weightLabel.text = "Invalid Input"
            return;
        }
        var bmi: Double
        if SegmentedController.selectedSegmentIndex == 0 {
            //Calculate BMI in kg/cm
            //bmiResult.text = "SUCCESS"
            bmi = weight / pow(height/100, 2)
        }
        else{
            bmi = (weight*703) / pow(height, 2)
        }
        bmiResult.text = String(format: "Your BMI is: %.2f", bmi)
        
        
        //Determing the category
        let category: String
        if bmi < 18.5 {
            category = "UnderWeight"
        }
        else if bmi < 24.9 {
            category = "Normal weight"
        }
        else if bmi < 29.9 {
            category = "Overweight"
        }
        else {
            category = "Obese"
        }
        bmiCategory.text = "BMI Category : \(category)"
    }
}

