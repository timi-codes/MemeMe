//
//  SentMemeTableViewController.swift
//  MemeMe
//
//  Created by Timi Tejumola on 05/04/2020.
//  Copyright © 2020 Timi Tejumola. All rights reserved.
//

import UIKit

class SentMemeTableViewController: UITableViewController {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(showMemeEditor))
    }
    
    @objc func showMemeEditor(){
        let memeVC = self.storyboard!.instantiateViewController(identifier: "MemeMeViewController") as! MemeMeViewController
        present(memeVC, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell", for: indexPath) as! MemeTableViewCell
        let currentMeme = self.memes[indexPath.row]
        cell.memeImageView.image = currentMeme.memedImage
        cell.memeLabel.text = "\(currentMeme.topText)...\(currentMeme.bottomText)"
        
        return cell
    }
    
}
