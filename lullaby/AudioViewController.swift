//
//  AudioViewController.swift
//  lullaby
//
//  Created by Zachary Denham on 11/8/16.
//  Copyright © 2016 scope. All rights reserved.
//

import UIKit

class AudioViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var audioTable: UITableView!
    
    var selectedStory = "War and Peace"
    
    var titleList: [String] = ["War and Peace", "Cote on Recursion", "Cote on Pink Elephants", "Cote on Induction", "United States Constitution", "Counting sheep", "Green Eggs and Ham", "Romeo and Juliet", "Wuthering Heights"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioTable.dataSource = self
        audioTable.delegate = self
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 9;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = audioTable.dequeueReusableCell(withIdentifier: "audioCell", for: indexPath) 
        
        cell.textLabel?.text = titleList[indexPath.row]
        
        print("row \(indexPath.row)")
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selectStory called")
        
        selectedStory = titleList[indexPath.row]
        
        print("selectedStory is " + selectedStory)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("about to segue")
        let mvc = segue.destination as! MainViewController
        
        mvc.storyTitle = selectedStory
    }
}
