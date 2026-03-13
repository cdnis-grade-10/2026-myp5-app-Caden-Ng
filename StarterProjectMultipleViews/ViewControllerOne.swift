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


class ViewControllerOne: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var diabetesBool: UIButton!
    @IBOutlet weak var eczemaBool: UIButton!
    @IBOutlet weak var saltBool: UIButton!
    @IBOutlet weak var sugarBool: UIButton!
    @IBOutlet weak var nutsBool: UIButton!
    @IBOutlet weak var eggsBool: UIButton!
    @IBOutlet weak var meatsBool: UIButton!
    @IBOutlet weak var fishBool: UIButton!
    @IBOutlet weak var shellfishBool: UIButton!
    
    @IBOutlet weak var hipsBool: UIButton!
    @IBOutlet weak var kneesBool: UIButton!
    @IBOutlet weak var anklesBool: UIButton!
    @IBOutlet weak var shouldersBool: UIButton!
    @IBOutlet weak var chestBool: UIButton!
    @IBOutlet weak var armBool: UIButton!
    
    
    @IBOutlet weak var fatLossBool: UISwitch!
    @IBOutlet weak var muscleGainBool: UISwitch!
    
    @IBOutlet weak var heightInt: UISlider!
    @IBOutlet weak var weightInt: UISlider!
    
    // MARK: - Variables and Constants
    
    
    
    
    
    
    
    
    // MARK: - IBActions and Functions
    var userInformation: [String: Any] = [
        "diabetes": false,
        "eczema": false,
        "salt": false,
        "sugar": false,
        "nuts": false,
        "eggs": false,
        "meats": false,
        "fish": false,
        "shellfish": false,

        "hips": false,
        "knees": false,
        "ankles": false,
        "shoulders": false,
        "chest": false,
        "arm": false,

        "fatLoss": true,
        "muscleGain": true,

        "height": 0.0,
        "weight": 0.0
    ]
    
    @IBAction func bodySlider(_ sender: Any) {
        if sender as! UISlider == heightInt{
            userInformation["height"] = heightInt
        }
        else if sender as! UISlider == weightInt{
            userInformation["weight"] = weightInt
        }
        
    }
    
    
    

    
    
    
    
    
    @IBAction func allergyChangeBool(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

