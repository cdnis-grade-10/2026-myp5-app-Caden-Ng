import UIKit
import WebKit

class ViewControllerFour: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var muscleName: UILabel!
    @IBOutlet weak var musclesLabel: UILabel!
    @IBOutlet weak var formLabel: UILabel!
    @IBOutlet weak var excerciseGIF: WKWebView!
    
    // MARK: - Variables and Constants
    
    let exercises = [
        "Bicep Curl",
        "Tricep Extension",
        "Shoulder Press",
        "Pull-Ups",
        "Chest Flys",
        "Chest Press",
        "Calf Raises",
        "Bulgarian Split Squats",
        "Deadlifts"
    ]

    let primaryMuscles: [String] = [
        "Biceps brachii, brachialis, and brachioradialis. Focuses on elbow flexion and forearm muscles for arm size and strength.",
        "Triceps brachii (all three heads: long, lateral, medial). Emphasizes elbow extension for arm size and strength.",
        "Deltoids (especially anterior), triceps, and upper trapezius. Builds overhead pressing strength and shoulder stability.",
        "Latissimus dorsi, biceps, trapezius, rhomboids, and rear deltoids. Builds upper back width and pulling strength.",
        "Pectoralis major (chest), with anterior deltoids. Emphasizes chest stretch and contraction for width.",
        "Pectoralis major, anterior deltoids, and triceps. Compound push for upper body strength.",
        "Gastrocnemius and soleus (calf muscles). Strengthens ankle plantarflexion for lower leg power.",
        "Quadriceps, glutes, and hamstrings. Unilateral move for legs, balance, and hip stability.",
        "Posterior chain: hamstrings, glutes, erector spinae, with core, traps, and full-body stabilizers."
    ]

    let properForm: [String] = [
        "Stand with feet shoulder-width, core engaged, elbows tucked to sides. Hold dumbbells with palms forward, arms extended. Curl weights to shoulders by bending elbows only. Squeeze biceps at top, then lower slowly with control. Keep torso stationary.",
        "Stand or sit with core braced. Hold dumbbell overhead with both hands, elbows pointing up. Lower weight behind head by bending elbows while keeping them close and stationary. Extend arms fully overhead to contract triceps. Control the lowering phase.",
        "Sit or stand with core tight. Hold weights at shoulder height, palms forward. Press weights straight overhead until arms are nearly extended. Lower back to shoulders with control. Keep wrists straight.",
        "Grip bar slightly wider than shoulders, palms away. Hang with arms fully extended and core engaged. Pull chest toward bar by driving elbows down until chin clears. Lower with full control to dead hang. Avoid swinging.",
        "Lie on bench, hold dumbbells above chest with slight elbow bend, palms facing. Lower arms in wide arc until stretch in chest, keeping slight bend in elbows. Squeeze chest to bring weights back up in same arc.",
        "Lie on bench with feet planted. Hold weights at chest level, elbows at 45 degrees. Press weights straight up over chest until arms extend. Lower with control back to chest. Keep shoulder blades retracted.",
        "Stand with feet hip-width, hold support if needed. Rise onto balls of feet by pushing through toes. Squeeze calves at top, then lower heels slowly for full stretch. Keep knees mostly straight.",
        "Place top of one foot on bench behind you. Lower by bending front knee until back knee nearly touches floor. Keep front knee over toes and torso upright. Drive through front heel to stand. Maintain square hips and tight core.",
        "Stand with feet hip-width, bar over mid-foot. Hinge at hips and grip bar outside legs. Keep back flat, chest up, shoulders over bar. Drive through heels to stand tall. Lower by hinging hips back first. Keep bar close to body."
    ]
    
    // MARK: - IBActions and Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var gifURL = "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExbnB1NDQyN2lzbDZtdXVoaHI4NDhvdnhtZDF0ZW45bzNkMTJhdHplMiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/51Ze6SxVtXB8T7IQm9/giphy.gif"
        
        switch excerciseChosen{
        case 0:
            gifURL = "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExbnB1NDQyN2lzbDZtdXVoaHI4NDhvdnhtZDF0ZW45bzNkMTJhdHplMiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/51Ze6SxVtXB8T7IQm9/giphy.gif"
        case 1:
            gifURL = "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExbDExbHNzbHNiMXZjbWhqZWsxMDczbGZxZzdndHR3cGhnZXg3MnJvNiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/UQ1cDZnTbpY1UuUaSA/giphy.gif"
        case 2:
            gifURL = "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExMmZuaGpwbTJtNXdqc21nbGx1b28xMjFmNWRqM2ZwdTZiMTk5dXVkNSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/gIxeFoOB3xBEeviCn8/giphy.gif"
        case 3:
            gifURL = "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExNnE5anR5M3N1NjQxbzgxNzV2MjNzaThkdXN0eml4Y2t4aXhwdHU4cyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/A5tKraWea3JONJQbKd/giphy.gif"
        case 4:
            gifURL = "https://tenor.com/en-GB/view/chest-fly-dumbells-gif-27371637"
        case 5:
            gifURL = "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExbHAxdHppenViamJmZ2M0eDQxbjZuaXBvZmw3a2lwem5wb2hjd3FuZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/cKPsQVloxwsPgbpamd/giphy.gif"
        case 6:
            gifURL = "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExM2UwZG9qdmlwZzNrZTZ6dW5uc2VoZ3RveW5sYjhxdmw1MTIwY3MzeSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/eKrFAm7LXRrOnMq79f/giphy.gif"
        case 7:
            gifURL = "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExbWpmcTZyYnNtajRpemEyZTA0bWpiMnp4MWQ2cXN5dzJnOTZsMHJvYSZlcD12MV9naWZzX3NlYXJjaCZjdD1n/Q8O1oo9cKR3zbBJA2D/giphy.gif"
        case 8:
            gifURL = "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExM3B1ZDlhb2g1dTZoamc5aTgwY3JpcTRwdHQwZmR0NjBsOTEyM3l0YiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/n75qMdOacPuXZPQizO/giphy.gif"
        default:
            gifURL = "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExM3B1ZDlhb2g1dTZoamc5aTgwY3JpcTRwdHQwZmR0NjBsOTEyM3l0YiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/n75qMdOacPuXZPQizO/giphy.gif"
        }
        
        
        
        
        
        
        
        var html = """
        <html>
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
            <style>
              html, body { margin:0; padding:0; background:transparent; }
              img { display:block; width:100%; height:auto; object-fit:contain; }
            </style>
          </head>
          <body>
            <img src="\(gifURL)" alt="gif"/>
          </body>
        </html>
        """
        excerciseGIF.loadHTMLString(html, baseURL: nil)
        
        musclesLabel.numberOfLines = 0
        musclesLabel.lineBreakMode = .byWordWrapping
        
        formLabel.numberOfLines = 0
        formLabel.lineBreakMode = .byWordWrapping
        
        muscleName.text = exercises[excerciseChosen]
        musclesLabel.text = primaryMuscles[excerciseChosen]
        formLabel.text = properForm[excerciseChosen]
        
        if excerciseChosen == 0 && (userInformation[14] == true) {
            musclesLabel.text = injuryError
            formLabel.text = injuryError
        } else if excerciseChosen == 1 && (userInformation[14] == true) {
            musclesLabel.text = injuryError
            formLabel.text = injuryError
        } else if excerciseChosen == 2 && (userInformation[14] == true) {
            musclesLabel.text = injuryError
            formLabel.text = injuryError
        } else if excerciseChosen == 2 && (userInformation[12] == true) {
            musclesLabel.text = injuryError
            formLabel.text = injuryError
        } else if excerciseChosen == 3 && (userInformation[9] == true) {
            musclesLabel.text = injuryError
            formLabel.text = injuryError
        } else if excerciseChosen == 4 && (userInformation[14] == true) {
            musclesLabel.text = injuryError
            formLabel.text = injuryError
        } else if excerciseChosen == 5 && (userInformation[12] == true) {
            musclesLabel.text = injuryError
            formLabel.text = injuryError
        } else if excerciseChosen == 5 && (userInformation[14] == true) {
            musclesLabel.text = injuryError
            formLabel.text = injuryError
        } else if excerciseChosen == 6 && (userInformation[11] == true) {
            musclesLabel.text = injuryError
            formLabel.text = injuryError
        } else if excerciseChosen == 7 && (userInformation[9] == true) {
            musclesLabel.text = injuryError
            formLabel.text = injuryError
        } else if excerciseChosen == 7 && (userInformation[10] == true) {
            musclesLabel.text = injuryError
            formLabel.text = injuryError
        } else if excerciseChosen == 7 && (userInformation[11] == true) {
            musclesLabel.text = injuryError
            formLabel.text = injuryError
        } else if excerciseChosen == 8 && (userInformation[9] == true) {
            musclesLabel.text = injuryError
            formLabel.text = injuryError
        } else if excerciseChosen == 8 && (userInformation[10] == true) {
            musclesLabel.text = injuryError
            formLabel.text = injuryError
        } else if excerciseChosen == 8 && (userInformation[11] == true) {
            musclesLabel.text = injuryError
            formLabel.text = injuryError
        } else if age >= 60.0 || age <= 14{
            musclesLabel.text = "(Working out is not recommended due to age and healthcare risks)"
            formLabel.text = "(Working out is not recommended due to age and healthcare risks)"
        }
    }
}

