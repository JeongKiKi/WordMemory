//
//  MemoryTestViewController.swift
//  WordMemory
//
//  Created by 정기현 on 2024/04/11.
//

import SnapKit
import UIKit
class TestViewController: UIViewController {
    let testView = TestView()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "시험"
    }

    override func loadView() {
        super.loadView()
        view.addSubview(testView)
        btnFunc()
        testView.snp.makeConstraints {
            $0.top.equalTo(self.view)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }

    // 단어 맞추기 버튼이 눌렸을 때 실행되는 함수
    @objc func wordButtonTapped() {
        print("단어 맞추기 버튼이 눌렸습니다.")
        let resultViewController = TestBtnTappedViewController()
        let testModel = TestModel()
        testModel.selectedBtn = "word"
        navigationController?.pushViewController(resultViewController, animated: true)
    }

    // 뜻 맞추기 버튼이 눌렸을 때 실행되는 함수
    @objc func meaningButtonTapped() {
        let resultViewController = TestBtnTappedViewController()
        let testModel = TestModel()
        testModel.selectedBtn = "meaning"
        navigationController?.pushViewController(resultViewController, animated: true)
    }

    func btnFunc() {
        // 단어 맞추기 버튼의 액션 추가
        testView.wordButton.addTarget(self, action: #selector(TestViewController.wordButtonTapped), for: .touchUpInside)

        // 뜻 맞추기 버튼의 액션 추가
        testView.meaningButton.addTarget(self, action: #selector(TestViewController.meaningButtonTapped), for: .touchUpInside)
    }
}
