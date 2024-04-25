//
//  ViewController.swift
//  WordMemory
//
//  Created by 정기현 on 2024/04/09.
//

import MLKitTranslate
import UIKit
class MainViewController: UIViewController {
    let mainView = MainView()
    var koreanEnglishTranslator: Translator?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "검색"
        mainView.searchButton.addTarget(self, action: #selector(MainViewController.searchButtonTapped), for: .touchUpInside)
    }

    override func loadView() {
        super.loadView()
        view.addSubview(mainView)
        changeLanguage()
        mainView.snp.makeConstraints {
            $0.top.equalTo(self.view)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }

    @objc func searchButtonTapped() {
        guard let text = mainView.inputWord.text else { return }
        koreanEnglishTranslator?.translate(text) { translatedText, error in
            guard error == nil, let translatedText = translatedText else { return }
            print("Translated text:", translatedText)
            self.mainView.outputWord.text = translatedText
        }
    }

    func changeLanguage() {
        koreanEnglishTranslator = Translator.translator(options: TranslatorOptions(sourceLanguage: .korean, targetLanguage: .english))
        let conditions = ModelDownloadConditions(
            allowsCellularAccess: false, // 셀룰러 허용 여부
            allowsBackgroundDownloading: true // 백그라운드 다운 허용 여부
        )
        koreanEnglishTranslator?.downloadModelIfNeeded(with: conditions) { error in
            guard error == nil else { return print("언어모델 다운 실패") }
            print("언어 모델 다운로드 완료")
        }
    }
}
