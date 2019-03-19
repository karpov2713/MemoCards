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
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var showNumberButton: UIButton!
    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var keyNumberLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var helpCodeButton: UIButton!
    @IBOutlet weak var ditectionButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var firstNumbeTextField: UITextField!
    @IBOutlet weak var endNumbeTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!


    let viewModel: MemoCardsProtocol = MemoCardsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let currentParameterList: ParameterList = viewModel.getParameters()
        ditectionButton.setTitleColor(UIColor.clear, for: .normal)
        ditectionButton.setImage(UIImage(named: currentParameterList.direction.directionImage), for: .normal)
        firstNumbeTextField.text = "\(currentParameterList.firstNumber)"
        endNumbeTextField.text = "\(currentParameterList.finishNumber)"
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func nextButtonAction(_ sender: UIButton) {

        let imageView = viewModel.selectImage()
        textLabel.text = ""
        imageMain.image = UIImage(named: imageView)
        keyNumberLabel.isHidden = true

    }

    @IBAction func showNumberButtonAction(_ sender: UIButton) {
        keyNumberLabel.isHidden = false
        keyNumberLabel.text = viewModel.selectedImage.keyNumber
    }

    @IBAction func oneCardBackButton(_ sender: UIButton) {
        let imageView = viewModel.selectImage()
        textLabel.text = ""
        imageMain.image = UIImage(named: imageView)
        keyNumberLabel.isHidden = true
    }

    @IBAction func helpCodeButton(_ sender: UIButton) {
        textLabel.text = viewModel.selectedImage.keyLetters

    }

    @IBAction func directionChangeButton(_ sender: UIButton) {
        viewModel.changeDirection()
        let currentParameterList: ParameterList = viewModel.getParameters()
        ditectionButton.setImage(UIImage(named: currentParameterList.direction.directionImage), for: .normal)
        firstNumbeTextField.text = "\(currentParameterList.firstNumber)"
        endNumbeTextField.text = "\(currentParameterList.finishNumber)"

    }

    @IBAction func resetButton(_ sender: UIButton) {
        
    }

    @IBAction func firstNumbeInputTextField(_ sender: UITextField) {
    }

    @IBAction func endNumberInputTextField(_ sender: UITextField) {
    }

    @IBAction func saveNaviBarButton(_ sender: UIBarButtonItem) {
//        var parameterList = [direction: String, firstNumber: Int, finishNumber: Int]
    }
    
}
