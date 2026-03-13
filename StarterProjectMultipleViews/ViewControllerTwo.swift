/*
 
 ViewControllerTwo.swift
 
 This file will contain the code for the second viewcontroller.
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
import Charts

class ViewControllerTwo: UIViewController {
    
    // MARK: - IBOutlets
    
    struct DonutData: Identifiable {
        let id = UUID()
        let category: String
        let value: Double
    }

    let data = [
        DonutData(category: "A", value: 40),
        DonutData(category: "B", value: 30),
        DonutData(category: "C", value: 30)
    ]

    // 2. SwiftUI View
    struct DonutChartView: View {
        var body: some View {
            Chart(data) {
                SectorMark(
                    angle: .value("Value", $0.value),
                    innerRadius: .ratio(0.6), // <--- THIS MAKES IT A DONUT
                    angularInset: 2
                )
                .foregroundStyle(by: .value("Category", $0.category))
                .cornerRadius(5)
            }
        }
    }
    
    // MARK: - Variables and Constants
    
    
    
    // MARK: - IBActions and Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
