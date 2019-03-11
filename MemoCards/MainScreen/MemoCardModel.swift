//
//  MemoCardModel.swift
//  MemoCards
//
//  Created by Дмитрий Карпов on 02/03/2019.
//  Copyright © 2019 MacKarpov. All rights reserved.
//

import Foundation

class MemoCard {
    let keyNumber: String
    let keyWord: String
    let keyLetters: String
    let fileName: String

    init(keyNumber: String, keyWord: String, keyLetters: String, fileName: String) {
        self.keyNumber = keyNumber
        self.keyWord = keyWord
        self.keyLetters = keyLetters
        self.fileName = fileName
    }
}

enum Directions: String {
    case forward = "Forward"
    case backward = "Back"
    case random = "Random"
}

struct parameterList {
    var direction: Directions
    var firstNumber: Int
    var finishNuber: Int
}


