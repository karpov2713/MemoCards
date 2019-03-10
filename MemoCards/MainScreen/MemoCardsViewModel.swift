//
//  MemoCardsViewModel.swift
//  MemoCards
//
//  Created by Дмитрий Карпов on 08/03/2019.
//  Copyright © 2019 MacKarpov. All rights reserved.
//

import Foundation

protocol MemoCardsProtocol {
    var selectedImage: MemoCard { get set }
    func selectImage(imageName: String) -> String
}


class MemoCardsViewModel: MemoCardsProtocol {
    private var privateSelectedImage: MemoCard = MemoCard(keyNumber: "00", keyWord: "НоМерок", keyLetters: "НМ", fileName: "00 НМ НоМерок")
    var selectedImage: MemoCard {
        get {
            return privateSelectedImage
        }
        set {
            if !newValue.keyNumber.isEmpty {
                privateSelectedImage = newValue
            }
        }
    }
    
    let memoCards: [MemoCard] = [MemoCard(keyNumber: "00", keyWord: "НоМерок", keyLetters: "НМ", fileName: "00 НМ НоМерок"),
                                 MemoCard(keyNumber: "01", keyWord: "ёЖ", keyLetters: "ГЖ", fileName: "01 ГЖ еЖ"),
                                 MemoCard(keyNumber: "02", keyWord: "яД", keyLetters: "ДТ", fileName: "02 ДТ яД"),
                                 MemoCard(keyNumber: "03", keyWord: "уХо", keyLetters: "КХ", fileName: "03 КХ уХо"),
                                 MemoCard(keyNumber: "04", keyWord: "Чай", keyLetters: "ЧШ", fileName: "04 ЧШ Чай"),
                                 MemoCard(keyNumber: "05", keyWord: "оБои", keyLetters: "БП", fileName: "05 БП оБои"),
                                 MemoCard(keyNumber: "06", keyWord: "юЛф", keyLetters: "ШЛ", fileName: "06 ШЛ юЛа"),
                                 MemoCard(keyNumber: "07", keyWord: "оСа", keyLetters: "СЗ", fileName: "07 ЗС оСа"),
                                 MemoCard(keyNumber: "08", keyWord: "иВа", keyLetters: "ВФ", fileName: "08 ВФ иВа"),
                                 MemoCard(keyNumber: "09", keyWord: "яйЦо", keyLetters: "РЦ", fileName: "09 РЦ яйЦо"),
                                 MemoCard(keyNumber: "10", keyWord: "оГоНь", keyLetters: "ГЖ НМ", fileName: "10 НМ ГЖ оГоНь"),
                                 MemoCard(keyNumber: "11", keyWord: "ГаГарин", keyLetters: "ГЖ ГЖ", fileName: "11 ГЖ ГЖ ГаГарин"),
                                 MemoCard(keyNumber: "12", keyWord: "ГиТара", keyLetters: "ГЖ ДТ", fileName: "12 ГЖ ДТ ГиТара"),
                                 MemoCard(keyNumber: "13", keyWord: "ГайКа", keyLetters: "ГЖ КХ", fileName: "13 ГЖ КХ ГайКа"),
                                 MemoCard(keyNumber: "14", keyWord: "ЖуЧок", keyLetters: "ГЖ ЧЩ", fileName: "14 ГЖ ЧЩ ЖуЧок"),
                                 MemoCard(keyNumber: "15", keyWord: "ГуБы", keyLetters: "ГЖ БП", fileName: "15 ГЖ БП ГуБы"),
                                 MemoCard(keyNumber: "16", keyWord: "ГуаШь", keyLetters: "ГЖ ШЛ", fileName: "16 ГЖ ШЛ ГуаШь"),
                                 MemoCard(keyNumber: "17", keyWord: "ГуСь", keyLetters: "ГЖ СЗ", fileName: "17 ГЖ СЗ ГуСь"),
                                 MemoCard(keyNumber: "18", keyWord: "ГВоздь", keyLetters: "ГЖ ВФ", fileName: "18 ГЖ ВФ ГВоздь"),
                                 MemoCard(keyNumber: "19", keyWord: "ГиРя", keyLetters: "ГЖ РЦ", fileName: "19 ГЖ РЦ ГиРя"),
                                 MemoCard(keyNumber: "20", keyWord: "ДоМ", keyLetters: "ДТ НМ", fileName: "20 ДТ НМ ДоМ"),
                                 MemoCard(keyNumber: "21", keyWord: "уТюГ", keyLetters: "ДТ ГЖ", fileName: "21 ДТ ГЖ уТюГ"),
                                 MemoCard(keyNumber: "22", keyWord: "ДиоД", keyLetters: "ДТ ДТ", fileName: "22 ДТ ДТ ДиоД"),
                                 MemoCard(keyNumber: "23", keyWord: "ДуХи", keyLetters: "ДТ КХ", fileName: "23 ДТ КХ ДуХи"),
                                 MemoCard(keyNumber: "24", keyWord: "ДиЧь", keyLetters: "ДТ ЧШ", fileName: "24 ДТ ЧШ ДиЧь"),
                                 MemoCard(keyNumber: "25", keyWord: "ТоПор", keyLetters: "ДТ БП", fileName: "25 ДТ БП ТоПор"),
                                 MemoCard(keyNumber: "26", keyWord: "ДуШ", keyLetters: "ДТ ШЛ", fileName: "26 ДТ ШЛ ДуШ"),
                                 MemoCard(keyNumber: "27", keyWord: "ТуЗ", keyLetters: "ДТ СЗ", fileName: "27 ДТ СЗ ТуЗ"),
                                 MemoCard(keyNumber: "28", keyWord: "уДаВ", keyLetters: "ДТ ВФ", fileName: "28 ДТ ВФ уДаВ"),
                                 MemoCard(keyNumber: "29", keyWord: "ТеРка", keyLetters: "ДТ РЦ", fileName: "29 ДТ РЦ ТеРка"),
                                 MemoCard(keyNumber: "30", keyWord: "иКоНа", keyLetters: "КХ НМ", fileName: "30 КХ НМ иКоНа"),
                                 MemoCard(keyNumber: "31", keyWord: "КоЖа", keyLetters: "КХ ГЖ", fileName: "31 КХ ГЖ КоЖа"),
                                 MemoCard(keyNumber: "32", keyWord: "КиТ", keyLetters: "КХ ДТ", fileName: "32 КХ ДТ КиТ"),
                                 MemoCard(keyNumber: "33", keyWord: "КеКс", keyLetters: "КХ КХ", fileName: "33 КХ КХ КеКс"),
                                 MemoCard(keyNumber: "34", keyWord: "КоЧат", keyLetters: "КХ ЧЩ", fileName: "34 КХ ЧЩ КоЧан"),
                                 MemoCard(keyNumber: "35", keyWord: "КуБ", keyLetters: "КХ БП", fileName: "35 КХ ПБ КуБ"),
                                 MemoCard(keyNumber: "36", keyWord: "КЛей", keyLetters: "КХ ШЛ", fileName: "36 КХ ШЛ КЛей"),
                                 MemoCard(keyNumber: "37", keyWord: "КоСф", keyLetters: "КХ СЗ", fileName: "37 КХ СЗ КоСа"),
                                 MemoCard(keyNumber: "38", keyWord: "ХВоя", keyLetters: "КХ ВФ", fileName: "38 КХ ВФ ХВоя"),
                                 MemoCard(keyNumber: "39", keyWord: "яКоРь", keyLetters: "КХ РЦ", fileName: "39 КХ РЦ яКоРь"),
                                 MemoCard(keyNumber: "40", keyWord: "ЧайНик", keyLetters: "ЧЩ НМ", fileName: "40 ЧЩ НМ ЧайНик")]

    func selectImage(imageName: String) -> String {

        self.selectedImage = self.memoCards.randomElement() ?? MemoCard(keyNumber: "00", keyWord: "НоМерок", keyLetters: "НМ", fileName: "00 НМ НоМерок")

        var selectedPicture = self.selectedImage.fileName


        while selectedPicture == imageName {
            self.selectedImage = self.memoCards.randomElement() ?? MemoCard(keyNumber: "00", keyWord: "НоМерок", keyLetters: "НМ", fileName: "00 НМ НоМерок")
            selectedPicture = self.selectedImage.fileName

        }

        return selectedPicture
        //
        // Возвращает картинку выбранной карточки
    }
}
