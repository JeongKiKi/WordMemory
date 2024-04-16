//
//  File.swift
//  WordMemory
//
//  Created by 정기현 on 2024/04/12.
//

import Foundation

struct Word: Codable {
    let word: String
    let meaning: String
}

class Dummy {
    private var dummyData: [Word] {
        get {
            guard let data = UserDefaults.standard.data(forKey: "dummyData") else { return [] }
            do {
                let words = try JSONDecoder().decode([Word].self, from: data)
                return words
            } catch {
                print("Error decoding dummy data: \(error.localizedDescription)")
                return []
            }
        }
        set {
            do {
                let data = try JSONEncoder().encode(newValue)
                UserDefaults.standard.set(data, forKey: "dummyData")
            } catch {
                print("Error encoding dummy data: \(error.localizedDescription)")
            }
        }
    }

    func getDummyData() -> [Word] {
        return dummyData
    }

    func addWord(word: String, meaning: String) {
        var newData = dummyData
        let newWord = Word(word: word, meaning: meaning)
        newData.append(newWord)
        dummyData = newData
    }
    func updateWord(at index: Int, with newWord: String, meaning newMeaning: String) {
        var newData = dummyData
        guard index < newData.count else {
            print("Index out of range")
            return
        }
        newData[index] = Word(word: newWord, meaning: newMeaning)
        dummyData = newData
    }
}
