//
//  TestBtnTappedViewController.swift
//  WordMemory
//
//  Created by 정기현 on 2024/04/16.
//

import SnapKit
import UIKit
class TestBtnTappedViewController: UIViewController {
    var selectedBtn = ""
    let wordBtn = SelectedBtnTappedView()
    var words = Dummy().getDummyData().shuffled()
    var wordIndex = 0
    var testCheck: [Bool] = []
    var wrongInput: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(wordBtn)
        wordBtn.snp.makeConstraints {
            $0.top.equalTo(self.view)
            $0.leading.bottom.trailing.equalToSuperview()
        }
        randomWord(selected: selectedBtn)
    }

    override func loadView() {
        super.loadView()
        btnFunc()
    }

    // ok 버튼이 눌렸을 때 실행되는 함수
    @objc func okTapped() {
        print("단어 맞추기 버튼이 눌렸습니다.")
        guard let answer = wordBtn.selectedTextField.text else { return }
        if words.count < 10 {
            if wordIndex < words.count - 1 {
                testCheckFunc(select: selectedBtn, index: wordIndex, answer: answer)
                print("wordIndex = \(wordIndex)")
                wordIndex += 1
            } else {
                print("테스트 종료")
                testCheckFunc(select: selectedBtn, index: wordIndex, answer: answer)
                testEndFunc(check: testCheck, answers: words)
            }

        } else {
            if wordIndex < 9 {
                testCheckFunc(select: selectedBtn, index: wordIndex, answer: answer)
                wordIndex += 1
            } else {
                print("테스트 종료")
                testCheckFunc(select: selectedBtn, index: wordIndex, answer: answer)
                testEndFunc(check: testCheck, answers: words)
            }
        }

        randomWord(selected: selectedBtn)
        wordBtn.selectedTextField.text = ""
        wordBtn.selectedTextField.placeholder = "단어를 입력해주세요"
        // 프린트문을 위한 변환
//        let selectAnswer = (selectedBtn == "word" ? words[wordIndex - 1].word : words[wordIndex - 1].meaning)
//        print("\(selectAnswer) == \(wordIndex) == \(answer)")
        print(testCheck)
    }

    func btnFunc() {
        // 단어 맞추기 버튼의 액션 추가
        wordBtn.okBtn.addTarget(self, action: #selector(TestBtnTappedViewController.okTapped), for: .touchUpInside)
    }

    // 버튼 선택에 따라 test label 변경
    func randomWord(selected: String) {
        if selected == "word" {
            wordBtn.noSelectedLabel.text = words[wordIndex].meaning
        } else {
            wordBtn.noSelectedLabel.text = words[wordIndex].word
        }
    }

    // 입력값을 확인하여 문제 답 확인
    func testCheckFunc(select: String, index: Int, answer: String) {
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

    func testEndFunc(check: [Bool], answers: [Word]) {
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
            self.present(resultSheet, animated: true, completion: nil)
        }
        wordIndex = 0
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)

        // 알럿창 표시
        present(alert, animated: true, completion: nil)
    }
}
