/*
 
 ViewControllerOne.swift
 
 This file will contain the code for the first viewcontroller.
 Please ensure that your code is organised and is easy to read.
 This means that you will need to both structure your code correctly,
 in addition to using the correct syntax for Swift.
 
 Unless you are told otherwise, ensure that you are using the
 camelCase syntax. For example, outputLabel and firstName are good
 examples of using the camelCase syntax.
 
 Within each class, you can see clearly identified sections denoted by
 MARK statements. These MARK statements allow you to structure and organise
 your code.
 
 - @IBOutlets should be listed under the MARK section on IBOutlets
 - Variables and constants listed under the MARK section Variables and Constants
 - Functions (including @IBActions) listed under the section on IBActions and Functions.
 
 As you develop each view controller class with Swift code, please include
 detailed comments to both demonstrate understanding, and which serve you as
 a reminder as to what your code actually does.
 
 */

import UIKit
import Foundation



class ViewControllerOne: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var hipsBool: UIButton!
    @IBOutlet weak var kneesBool: UIButton!
    @IBOutlet weak var anklesBool: UIButton!
    @IBOutlet weak var shouldersBool: UIButton!
    @IBOutlet weak var chestBool: UIButton!
    @IBOutlet weak var armBool: UIButton!
    
    
    @IBOutlet weak var fatLossBool: UISwitch!
    @IBOutlet weak var muscleGainBool: UISwitch!
    
    @IBOutlet weak var weightInt: UISlider!
    @IBOutlet weak var ageInt: UISlider!
    
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    // MARK: - Variables and Constants
    

    
    
    
    
    // MARK: - IBActions and Functions
    
    // Connect each slider's "Value Changed" to its corresponding action

    
    @IBAction func weightChanged(_ sender: UISlider) {
        weight = sender.value
        weightLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func ageChanged(_ sender: UISlider) {
        age = sender.value
        ageLabel.text = String(format: "%.0f", sender.value)
    }
    
    // Store Bool values, not the UISwitch itself
    @IBAction func fatLossAction(_ sender: UISwitch) {
        userInformation[15] = sender.isOn
    }
    
    @IBAction func muscleGainAction(_ sender: UISwitch) {
        userInformation[16] = sender.isOn
    }
    
    // Toggle the allergy state and update button color
    @IBAction func allergyChangeBool(_ sender: UIButton) {
        // Attempt to get the current value as Bool; default to false if missing or not Bool
        let currentState = userInformation[sender.tag] ?? false
        
        // Toggle the state
        let newState = !currentState
        userInformation[sender.tag] = newState
        
        // Update button color based on new state
        if newState {
            sender.tintColor = UIColor.red
        } else {
            sender.tintColor = UIColor.systemBlue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}
