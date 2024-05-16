//
//  ViewController.swift
//  WordMemory
//
//  Created by 정기현 on 2024/04/09.
//

import MLKitTranslate
import UIKit
class MainViewController: UIViewController {
    let mainFunc = MainModel()
    let mainView = MainView()
    
    var koreanEnglishTranslator: Translator?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "검색"
        // searchButton 추가
        mainView.searchButton.addTarget(self, action: #selector(MainViewController.searchButtonTapped), for: .touchUpInside)
    }

    override func loadView() {
        super.loadView()
        view = mainView
    }

    // 화면클릭시 키보드 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // searchButton 클릭시 실행되는 함수
    @objc func searchButtonTapped() {
        guard let text = mainView.inputWord.text else { return }
        // 언어 확인 후 언어모델 다운 후 변역
        mainFunc.languageClassiFication(text: text) { translatedText in
            print("result text:", translatedText)
            self.mainView.outputWord.text = translatedText
        }
    }
}
