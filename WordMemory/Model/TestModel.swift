//
//  ListModel.swift
//  WordMemory
//
//  Created by 정기현 on 2024/05/16.
//

import UIKit
class TestModel {
    var words: [Word] = []
    var testCheck: [Bool] = []
    var wrongInput: [String] = []
    var selectedBtn = ""

    func testCheckFunc(select: String, index: Int, answer: String, words: [Word]) {
        if select == "word" {
            // 소문자 변환으로 대소문자 영향 x
            let wordsAnswer = words[index].word.lowercased()
            let userAnswer = answer.lowercased()
            if wordsAnswer == userAnswer {
                testCheck.append(true)
            } else {
                testCheck.append(false)
                wrongInput.append(answer)
            }
        } else {
            if words[index].meaning == answer {
                testCheck.append(true)
            } else {
                testCheck.append(false)
                wrongInput.append(answer)
            }
        }
    }

    func testEndFunc(viewController: UIViewController, check: [Bool], answers: [Word]) {
        // alert창 찍어내기
        print(wrongInput)
        var testpass = 0
        for i in check {
            if i == true {
                testpass += 1
            }
        }
        let totalQuestions = (words.count < 10 ? words.count : 10)
        let alert = UIAlertController(title: "시험 종료", message: "총문제: \(totalQuestions)\n맞춘문제:\(testpass)", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "틀린 문제 확인", style: .default) { _ in
            // 일단 그냥 정답, 오답 나열
            let resultSheet = UIAlertController(title: "시험지", message: "test", preferredStyle: .alert)
            var wrongAnswers = ""

            for (index, answer) in self.wrongInput.enumerated() {
                if self.selectedBtn == "word" {
                    wrongAnswers += "\(index + 1). 문제:\(answers[index].meaning) 정답: \(answers[index].word) 오답:\(answer)\n"
                } else {
                    wrongAnswers += "\(index + 1). 문제:\(answers[index].word) 정답: \(answers[index].meaning) 오답:\(answer)\n"
                }
            }
            resultSheet.message = wrongAnswers
            let okAction = UIAlertAction(title: "확인", style: .default) { _ in }
            self.wrongInput = []
            self.testCheck = []
            resultSheet.addAction(okAction)
            viewController.present(resultSheet, animated: true, completion: nil)
        }
 
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)

        // 알럿창 표시
        viewController.present(alert, animated: true, completion: nil)
    }
}
