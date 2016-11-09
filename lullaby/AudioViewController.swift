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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioTable.dataSource = self
        audioTable.delegate = self
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 20;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = audioTable.dequeueReusableCell(withIdentifier: "audioCell", for: indexPath) 
        
        cell.textLabel?.text = "row \(indexPath.row)"
        
        print("row \(indexPath.row)")
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
