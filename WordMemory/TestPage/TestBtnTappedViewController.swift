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
                wordIndex += 1
            } else {
                print("테스트 종료")
                testEndFunc(check: testCheck)
                testCheck = []
                wordIndex = 0
            }

        } else {
            if wordIndex < 9 {
                testCheckFunc(select: selectedBtn, index: wordIndex, answer: answer)
                wordIndex += 1
            } else {
                print("테스트 종료")
                testEndFunc(check: testCheck)
                testCheck = []
                wordIndex = 0
            }
        }

        randomWord(selected: selectedBtn)
        wordBtn.selectedTextField.placeholder = "단어를 입력해주세요"
        print("\(words[wordIndex].meaning) == \(wordIndex) == \(answer)")
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
            if words[index].meaning == answer {
                testCheck.append(true)
            } else {
                testCheck.append(false)
            }
        } else {
            if words[index].meaning == answer {
                testCheck.append(true)
            } else {
                testCheck.append(false)
            }
        }
    }

    func testEndFunc(check: [Bool]) {
        // alert창 찍어내기
        var testpass = 0
        for i in check {
            if i == true {
                testpass += 1
            }
        }

        let alert = UIAlertController(title: "시험 종료", message: "총문제: \(check.count)\n맞춘문제:\(testpass)", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "틀린 문제 확인", style: .default) { _ in
//            if let addWord = alert.textFields?.first, let addMeaning = alert.textFields?.last {
//                if let addNewWord = addWord.text, let addNewMeaning = addMeaning.text {
//                    self.dummy.addWord(word: addNewWord, meaning: addNewMeaning)
//                    print(self.dummy.getDummyData())
//                    self.tableView.reloadData()
//                }
//            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)

        // 알럿창 표시
        present(alert, animated: true, completion: nil)
    }
}
