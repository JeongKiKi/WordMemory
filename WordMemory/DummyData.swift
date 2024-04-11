//
//  File.swift
//  WordMemory
//
//  Created by 정기현 on 2024/04/12.
//

import Foundation

struct Word {
    let word: String
    let meaning: String
}

class Dummy {
    private let dummyData: [Word] = [
        Word(word: "Apple", meaning: "사과"),
        Word(word: "Banana", meaning: "바나나"),
        Word(word: "Cat", meaning: "고양이"),
        Word(word: "Dog", meaning: "개"),
        Word(word: "Elephant", meaning: "코끼리"),
        Word(word: "Fish", meaning: "물고기"),
        Word(word: "Giraffe", meaning: "기린"),
        Word(word: "Horse", meaning: "말"),
        Word(word: "Ice cream", meaning: "아이스크림"),
        Word(word: "Juice", meaning: "주스")
    ]
    func getDummyData() -> [Word] {
        return dummyData
    }
}
