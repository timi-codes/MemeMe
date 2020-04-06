//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Timi Tejumola on 06/04/2020.
//  Copyright © 2020 Timi Tejumola. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

    @IBOutlet weak var memeImageView: UIImageView!
    var memeImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeImageView.image = memeImage
    }
}
