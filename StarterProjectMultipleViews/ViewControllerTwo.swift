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
import SwiftUI

class ViewControllerTwo: UIViewController {
    
    // MARK: - IBOutlets
    // MARK: - Properties
    private var hostingController: UIHostingController<ContentView>?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Host a SwiftUI chart view
        let initialChart = ContentView(protein: proteinAmount, carbs: carbAmount, fat: fatAmount)
        let hostingController = UIHostingController(rootView: initialChart)
        self.hostingController = hostingController
        
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 50),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Refresh the inputs/goals each time the view appears
        loseFat = (userInformation[15]) ?? false
        gainMuscle = (userInformation[16]) ?? false
        
        // Choose per-kg macros based on goals
        if !loseFat && !gainMuscle {
            proteinPerKG = 1.4
            fatPerKG = 0.9
            carbPerKG = 4.0
        } else if loseFat && !gainMuscle {
            proteinPerKG = 1.9
            fatPerKG = 0.85
            carbPerKG = 2.2
        } else if !loseFat && gainMuscle {
            proteinPerKG = 1.9
            fatPerKG = 1.0
            carbPerKG = 5.0
        } else {
            proteinPerKG = 2.1
            fatPerKG = 0.85
            carbPerKG = 3.0
        }
        

        proteinAmount = Int(weight * proteinPerKG)
        fatAmount = Int(weight * fatPerKG)
        carbAmount = Int(weight * carbPerKG)
        
        hostingController?.rootView = ContentView(protein: proteinAmount, carbs: carbAmount, fat: fatAmount)
    }
}



struct ContentView: View {
    // Inject the current values instead of reading globals so reassigning rootView updates the chart
    let protein: Int
    let carbs: Int
    let fat: Int
    
    // Selection state and helpers
    @State private var selectedNutrient: String = "Protein"
    
    private var selectedAmount: Int {
        switch selectedNutrient {
        case "Protein": return protein
        case "Carbohydrates": return carbs
        case "Fat": return fat
        default: return 0
        }
    }
    
    private let nutrientOrder = ["Protein", "Carbohydrates", "Fat"]
    
    var data: [NutrientDataPoint] {
        [
            NutrientDataPoint(nutrient: "Protein", amount: protein),
            NutrientDataPoint(nutrient: "Carbohydrates", amount: carbs),
            NutrientDataPoint(nutrient: "Fat", amount: fat)
        ]
    }
    
    let sliceColors: [String: Color] = [
        "Protein": .blue,
        "Carbohydrates": .green,
        "Fat": .red
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            Picker("Nutrient", selection: $selectedNutrient) {
                Text("Protein").tag("Protein")
                Text("Carbohydrates").tag("Carbohydrates")
                Text("Fat").tag("Fat")
            }
            .pickerStyle(.segmented)
            
            ZStack {
                Chart {
                    ForEach(data) { point in
                        SectorMark(
                            angle: .value("Amount", point.amount),
                            innerRadius: .ratio(0.618),
                            angularInset: 1.5
                        )
                        .foregroundStyle(by: .value("Nutrient", point.nutrient))
                        .opacity(point.nutrient == selectedNutrient ? 1.0 : 0.35)
                    }
                }
                .chartForegroundStyleScale(
                    domain: nutrientOrder,
                    range: nutrientOrder.compactMap { sliceColors[$0] }
                )
                .chartLegend(position: .bottom, alignment: .center)
                .frame(height: 400)
                .padding()
                
                // Overlay texts centered in the donut
                VStack(spacing: 8) {
                    Text("Nutrient Breakdown")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("\(selectedNutrient): \(selectedAmount) g")
                        .font(.title2.bold())
                        .foregroundColor(sliceColors[selectedNutrient] ?? .primary)
                        .accessibilityLabel("\(selectedNutrient) amount")
                        .accessibilityValue("\(selectedAmount) g")
                    Text("Total Nutrients: \((protein + carbs + fat)*5) kcal")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            }
        }
    }
    
}

