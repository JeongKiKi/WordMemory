//
//  TestBtnTappedViewController.swift
//  WordMemory
//
//  Created by 정기현 on 2024/04/16.
//

import SnapKit
import UIKit
class TestBtnTappedViewController: UIViewController {
    let testModel = TestModel()
    let wordBtn = SelectedBtnTappedView()

    var wordIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        testModel.words = Dummy().getDummyData().shuffled()
        print(testModel.words)
        randomWord(selected: testModel.selectedBtn)
    }

    override func loadView() {
        super.loadView()
        view = wordBtn
        btnFunc()
    }

    // ok 버튼이 눌렸을 때 실행되는 함수
    @objc func okTapped() {
        print("단어 맞추기 버튼이 눌렸습니다.")
        guard let answer = wordBtn.selectedTextField.text else { return }
        if testModel.words.count < 10 {
            if wordIndex < testModel.words.count - 1 {
                testModel.testCheckFunc(select: testModel.selectedBtn, index: wordIndex, answer: answer, words: testModel.words)
                print("wordIndex = \(wordIndex)")
                wordIndex += 1
            } else {
                print("테스트 종료")
                testModel.testCheckFunc(select: testModel.selectedBtn, index: wordIndex, answer: answer, words: testModel.words)
                testModel.testEndFunc(viewController: self, check: testModel.testCheck, answers: testModel.words)
                wordIndex = 0
            }

        } else {
            if wordIndex < 9 {
                testModel.testCheckFunc(select: testModel.selectedBtn, index: wordIndex, answer: answer, words: testModel.words)
                wordIndex += 1
            } else {
                print("테스트 종료")
                testModel.testCheckFunc(select: testModel.selectedBtn, index: wordIndex, answer: answer, words: testModel.words)
                testModel.testEndFunc(viewController: self, check: testModel.testCheck, answers: testModel.words)
                wordIndex = 0
            }
        }

        randomWord(selected: testModel.selectedBtn)
        wordBtn.selectedTextField.text = ""
        wordBtn.selectedTextField.placeholder = "단어를 입력해주세요"
    }

    func btnFunc() {
        // 단어 맞추기 버튼의 액션 추가
        wordBtn.okBtn.addTarget(self, action: #selector(TestBtnTappedViewController.okTapped), for: .touchUpInside)
    }

    // 버튼 선택에 따라 test label 변경
    func randomWord(selected: String) {
        if selected == "word" {
            wordBtn.noSelectedLabel.text = testModel.words[wordIndex].meaning
        } else {
            wordBtn.noSelectedLabel.text = testModel.words[wordIndex].word
        }
    }
}
