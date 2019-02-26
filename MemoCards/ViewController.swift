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

    var selectedImage = (keyNumber: "00", keyWord: "НоМерок", keyLetters: "НМ", fileName: "00 НМ НоМерок")


    let memoCards = [(keyNumber: "00", keyWord: "НоМерок", keyLetters: "НМ", fileName: "00 НМ НоМерок"),
                     (keyNumber: "01", keyWord: "ёЖ", keyLetters: "ГЖ", fileName: "01 ГЖ еЖ"),
                     (keyNumber: "02", keyWord: "яД", keyLetters: "ДТ", fileName: "02 ДТ яД"),
                     (keyNumber: "03", keyWord: "уХо", keyLetters: "КХ", fileName: "03 КХ уХо"),
                     (keyNumber: "04", keyWord: "Чай", keyLetters: "ЧШ", fileName: "04 ЧШ Чай"),
                     (keyNumber: "05", keyWord: "оБои", keyLetters: "БП", fileName: "05 БП оБои"),
                     (keyNumber: "06", keyWord: "юЛф", keyLetters: "ШЛ", fileName: "06 ШЛ юЛа"),
                     (keyNumber: "07", keyWord: "оСа", keyLetters: "СЗ", fileName: "07 ЗС оСа"),
                     (keyNumber: "08", keyWord: "иВа", keyLetters: "ВФ", fileName: "08 ВФ иВа"),
                     (keyNumber: "09", keyWord: "яйЦо", keyLetters: "РЦ", fileName: "09 РЦ яйЦо"),
                     (keyNumber: "10", keyWord: "оГоНь", keyLetters: "ГЖ НМ", fileName: "10 НМ ГЖ оГоНь"),
                     (keyNumber: "11", keyWord: "ГаГарин", keyLetters: "ГЖ ГЖ", fileName: "11 ГЖ ГЖ ГаГарин"),
                     (keyNumber: "12", keyWord: "ГиТара", keyLetters: "ГЖ ДТ", fileName: "12 ГЖ ДТ ГиТара"),
                     (keyNumber: "13", keyWord: "ГайКа", keyLetters: "ГЖ КХ", fileName: "13 ГЖ КХ ГайКа"),
                     (keyNumber: "14", keyWord: "ЖуЧок", keyLetters: "ГЖ ЧЩ", fileName: "14 ГЖ ЧЩ ЖуЧок"),
                     (keyNumber: "15", keyWord: "ГуБы", keyLetters: "ГЖ БП", fileName: "15 ГЖ БП ГуБы"),
                     (keyNumber: "16", keyWord: "ГуаШь", keyLetters: "ГЖ ШЛ", fileName: "16 ГЖ ШЛ ГуаШь"),
                     (keyNumber: "17", keyWord: "ГуСь", keyLetters: "ГЛ СЗ", fileName: "17 ГЖ СЗ ГуСь"),
                     (keyNumber: "18", keyWord: "ГВоздь", keyLetters: "ГЖ ВФ", fileName: "18 ГЖ ВФ ГВоздь"),
                     (keyNumber: "19", keyWord: "ГиРя", keyLetters: "ГЖ РЦ", fileName: "19 ГЖ РЦ ГиРя"),
                     (keyNumber: "20", keyWord: "ДоМ", keyLetters: "ДТ НМ", fileName: "20 ДТ НМ ДоМ"),
                     (keyNumber: "21", keyWord: "уТюГ", keyLetters: "ДТ ГЖ", fileName: "21 ДТ ГЖ уТюГ"),
                     (keyNumber: "22", keyWord: "ДиоД", keyLetters: "ДТ ДТ", fileName: "22 ДТ ДТ ДиоД"),
                     (keyNumber: "23", keyWord: "ДуХи", keyLetters: "ДТ КХ", fileName: "23 ДТ КХ ДуХи"),
                     (keyNumber: "24", keyWord: "ДиЧь", keyLetters: "ДТ ЧШ", fileName: "24 ДТ ЧШ ДиЧь"),
                     (keyNumber: "25", keyWord: "ТоПор", keyLetters: "ДТ БП", fileName: "25 ДТ БП ТоПор"),
                     (keyNumber: "26", keyWord: "ДуШ", keyLetters: "ДТ ШЛ", fileName: "26 ДТ ШЛ ДуШ"),
                     (keyNumber: "27", keyWord: "ТуЗ", keyLetters: "ДТ СЗ", fileName: "27 ДТ СЗ ТуЗ"),
                     (keyNumber: "28", keyWord: "уДаВ", keyLetters: "ДТ ВФ", fileName: "28 ДТ ВФ уДаВ"),
                     (keyNumber: "29", keyWord: "ТеРка", keyLetters: "ДТ РЦ", fileName: "29 ДТ РЦ ТеРка"),
                     (keyNumber: "30", keyWord: "иКоНа", keyLetters: "КХ НМ", fileName: "30 КХ НМ иКоНа"),
                     (keyNumber: "31", keyWord: "КоЖа", keyLetters: "КХ ГЖ", fileName: "31 КХ ГЖ КоЖа"),
                     (keyNumber: "32", keyWord: "КиТ", keyLetters: "КХ ДТ", fileName: "32 КХ ДТ КиТ"),
                     (keyNumber: "33", keyWord: "КеКс", keyLetters: "КХ КХ", fileName: "33 КХ КХ КеКс"),
                     (keyNumber: "34", keyWord: "КоЧат", keyLetters: "КХ ЧЩ", fileName: "34 КХ ЧЩ КоЧан"),
                     (keyNumber: "35", keyWord: "КуБ", keyLetters: "КХ БП", fileName: "35 КХ ПБ КуБ"),
                     (keyNumber: "36", keyWord: "КЛей", keyLetters: "КХ ШЛ", fileName: "36 КХ ШЛ КЛей"),
                     (keyNumber: "37", keyWord: "КоСф", keyLetters: "КХ СЗ", fileName: "37 КХ СЗ КоСа"),
                     (keyNumber: "38", keyWord: "ХВоя", keyLetters: "КХ ВФ", fileName: "38 КХ ВФ ХВоя"),
                     (keyNumber: "39", keyWord: "яКоРь", keyLetters: "КХ РЦ", fileName: "39 КХ РЦ яКоРь"),
                     (keyNumber: "40", keyWord: "ЧайНик", keyLetters: "ЧЩ НМ", fileName: "40 ЧЩ НМ ЧайНик")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func turnOnButton(_ sender: UIButton) {

        let imageView = selectImage()
        textLabel.text = selectedImage.keyLetters
        imageMain.image = UIImage(named: imageView)
        keyNumberLabel.isHidden = true
    }

    @IBAction func helpOnButton(_ sender: UIButton) {

        keyNumberLabel.isHidden = false
        keyNumberLabel.text = selectedImage.keyNumber

    }

    func selectImage() -> String {

        selectedImage = memoCards.randomElement() ?? (keyNumber: "00", keyWord: "НоМерок", keyLetters: "НМ", fileName: "00 НМ НоМерок")

        var selectedPicture = selectedImage.fileName


        while selectedPicture == textLabel.text {
            selectedImage = memoCards.randomElement() ?? (keyNumber: "00", keyWord: "НоМерок", keyLetters: "НМ", fileName: "00 НМ НоМерок")
            selectedPicture = selectedImage.fileName

        }

        return selectedPicture
        //
        // Возвращает картинку выбранной карточки
    }
}

