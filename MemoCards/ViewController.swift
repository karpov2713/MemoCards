//
//  ViewController.swift
//  MemoCards
//
//  Created by Дмитрий Карпов on 13/02/2019.
//  Copyright © 2019 MacKarpov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var turnButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var keyNumberLabel: UILabel!

    let viewModel: MemoCardsProtocol = MemoCardsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func turnOnButton(_ sender: UIButton) {
        
        let imageView = viewModel.selectImage(imageName: textLabel.text ?? "")
        textLabel.text = viewModel.selectedImage.keyLetters
        imageMain.image = UIImage(named: imageView)
        keyNumberLabel.isHidden = true
    }

    @IBAction func helpOnButton(_ sender: UIButton) {

        keyNumberLabel.isHidden = false
        keyNumberLabel.text = viewModel.selectedImage.keyNumber

    }
}
