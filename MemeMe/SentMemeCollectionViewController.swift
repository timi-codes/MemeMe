//
//  SentMemeCollectionViewController.swift
//  MemeMe
//
//  Created by Timi Tejumola on 06/04/2020.
//  Copyright © 2020 Timi Tejumola. All rights reserved.
//

import UIKit


class SentMemeCollectionViewController: UICollectionViewController {
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space:CGFloat = 3.0
        let wdimension = (view.frame.size.width - (2 * space)) / 3.0
        let hdimension = (view.frame.size.height - (2 * space)) / 5.0


        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: wdimension, height: hdimension)
    
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollection), name: NSNotification.Name(rawValue: "reloadMemes"), object: nil)

         navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(showMemeEditor))
    }
    
    @objc func reloadCollection(){
        collectionView.reloadData()
    }
    
    @objc func showMemeEditor() {
        let memeVC = self.storyboard!.instantiateViewController(identifier: "MemeEditorViewController") as! MemeEditorViewController
        present(memeVC, animated: true, completion: nil)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
    
        cell.memeImageView.image = self.memes[indexPath.row].memedImage
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = self.storyboard!.instantiateViewController(identifier: "MemeDetailViewController") as! MemeDetailViewController
        detailVC.memeImage = self.memes[indexPath.row].memedImage
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

}
