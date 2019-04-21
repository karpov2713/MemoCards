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
    @IBOutlet weak var numberHelpLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var showPuctureButton: UIButton!
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
        textLabel.isHidden = true
        numberHelpLabel.isHidden = true
        let keyboardDismiss: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(keyboardDismiss)
        keyNumberLabel.text = viewModel.selectedImage.keyNumber
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @IBAction func nextButtonAction(_ sender: UIButton) {
        viewModel.updateImage()
        keyNumberLabel.isHidden = false
        keyNumberLabel.text = viewModel.selectedImage.keyNumber
        imageMain.isHidden = true
        numberHelpLabel.isHidden = true
        textLabel.isHidden = true

    }

    @IBAction func showPuctureButtonAction(_ sender: UIButton) {
        let imageView = viewModel.selectedImage
        numberHelpLabel.text = imageView.keyNumber
        textLabel.text = imageView.keyWord
        imageMain.image = UIImage(named: imageView.fileName)
        keyNumberLabel.isHidden = true
        imageMain.isHidden = false
        numberHelpLabel.isHidden = false
        textLabel.isHidden = false

    }

    @IBAction func oneCardBackButton(_ sender: UIButton) {
        viewModel.backOneImage()
        keyNumberLabel.isHidden = false
        keyNumberLabel.text = viewModel.selectedImage.keyNumber
        imageMain.isHidden = true
        numberHelpLabel.isHidden = true
        textLabel.isHidden = true
    }

    @IBAction func helpCodeButton(_ sender: UIButton) {
        textLabel.isHidden = false
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
        saveCurrentParameters()
        AppData.userLastSet = viewModel.getParameters()
    }

    @IBAction func firstNumbeInputTextField(_ sender: UITextField) {
    }

    @IBAction func endNumberInputTextField(_ sender: UITextField) {
    }

    @IBAction func saveNaviBarButton(_ sender: UIBarButtonItem) {

        let alert = UIAlertController.init(title: "Сохранение параметров", message: "Введите название игры.", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Отмена", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction.init(title: "Сохранить", style: .default, handler: { (action) in
            let textField = alert.textFields![0]
            let text = textField.text ?? ""
            self.saveCurrentParameters()
            var parametersSet: ParameterList = self.viewModel.getParameters()
            parametersSet.nameOfSet = text
            AppData.userSet.append(parametersSet)
        }))
        alert.addTextField(configurationHandler: nil)
        present(alert, animated: true, completion: nil)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y -= keyboardSize.height
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }

    func saveCurrentParameters() {
        let firstUsedNumber: String = firstNumbeTextField.text ?? ""
        let endUsedNumber: String = endNumbeTextField.text ?? ""
        viewModel.changeFirstAndFinishNumbers(firstNumber: firstUsedNumber, endNumber: endUsedNumber)
        firstNumbeTextField.text = String(viewModel.getParameters().firstNumber)
        endNumbeTextField.text = String(viewModel.getParameters().finishNumber)
        keyNumberLabel.isHidden = false
        keyNumberLabel.text = viewModel.selectedImage.keyNumber
        imageMain.isHidden = true
        numberHelpLabel.isHidden = true
        textLabel.isHidden = true
        dismissKeyboard()
    }
}
