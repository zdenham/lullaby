//
//  MainViewController.swift
//  lullaby
//
//  Created by Darwin Mendyke on 11/13/16.
//  Copyright © 2016 scope. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var sleepButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var storyTitleLabel: UILabel!
    
    var storyTitle = "War and Peace"
    
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
        sleepButton.layer.cornerRadius = 5
        stopButton.layer.cornerRadius = 5
        pauseButton.layer.cornerRadius = 5
        
        stopButton.isHidden = true
        pauseButton.isHidden = true
        
        storyTitleLabel.text = storyTitle
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startPlayback(_ sender: Any) {
        //Create the alert controller
        let actionSheetController: UIAlertController = UIAlertController(title: "Ready to start", message: "Would you like to restart your lullaby or continue where you left off?", preferredStyle: .actionSheet)
        
        //Create and add the "Cancel" action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        actionSheetController.addAction(cancelAction)
        
        //Create and add "Yes" action
        let resumeAction: UIAlertAction = UIAlertAction(title: "Resume", style: .default) { action -> Void in
            self.sleepButton.isHidden = true
            self.stopButton.isHidden = false
            self.pauseButton.isHidden = false
            
            self.isPlaying = true
        }
        //Create and add "Yes" action
        let restartAction: UIAlertAction = UIAlertAction(title: "Restart", style: .default) { action -> Void in
            self.sleepButton.isHidden = true
            self.stopButton.isHidden = false
            self.pauseButton.isHidden = false
            
            self.isPlaying = true
        }
        actionSheetController.addAction(resumeAction)
        actionSheetController.addAction(restartAction)
        
        //Present the AlertController
        self.present(actionSheetController, animated: true, completion: nil)
    }

    @IBAction func stopPlay(_ sender: Any) {
        sleepButton.isHidden = false
        stopButton.isHidden = true
        pauseButton.isHidden = true
        
        isPlaying = false
    }
    
    @IBAction func pausePlay(_ sender: Any) {
        print("calling pausePlay()")
        if (isPlaying) {
            pauseButton.setTitle("PLAY", for: .normal)
            isPlaying = false
        }
        else {
            pauseButton.setTitle("PAUSE", for: .normal)
            isPlaying = true
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
