//
//  SentMemeTableViewController.swift
//  MemeMe
//
//  Created by Timi Tejumola on 05/04/2020.
//  Copyright © 2020 Timi Tejumola. All rights reserved.
//
import Foundation
import UIKit

class SentMemeTableViewController: UITableViewController {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: NSNotification.Name(rawValue: "reloadMemes"), object: nil)

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(showMemeEditor))
    }

    
    @objc func reload(){
        tableView.reloadData()
    }
    
    @objc func showMemeEditor() {
        let memeVC = self.storyboard!.instantiateViewController(identifier: "MemeEditorViewController") as! MemeEditorViewController
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard!.instantiateViewController(identifier: "MemeDetailViewController") as! MemeDetailViewController
        detailVC.memeImage = self.memes[indexPath.row].memedImage
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
