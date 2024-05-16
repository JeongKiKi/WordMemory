//
//  MainFunc.swift
//  WordMemory
//
//  Created by 정기현 on 2024/05/16.
//

import Foundation
import MLKitTranslate

class MainModel {
    var koreanEnglishTranslator: Translator?
    // 구글번역 언어 설정 한국어 -> 영어
    private func changeLanguageKoreanToEnglish() {
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

    // 구글번역 언어 설정 영어 -> 한국어
    private func changeLanguageEnglishToKorean() {
        koreanEnglishTranslator = Translator.translator(options: TranslatorOptions(sourceLanguage: .english, targetLanguage: .korean))
        let conditions = ModelDownloadConditions(
            allowsCellularAccess: false, // 셀룰러 허용 여부
            allowsBackgroundDownloading: true // 백그라운드 다운 허용 여부
        )
        koreanEnglishTranslator?.downloadModelIfNeeded(with: conditions) { error in
            guard error == nil else { return print("언어모델 다운 실패") }
            print("언어 모델 다운로드 완료")
        }
    }

    // 언어 구별(한글인지 영어인지) -> 언어모델 다운
    func languageClassiFication(text: String, completion: @escaping (String) -> Void){
        if text.containsKorean() {
            changeLanguageKoreanToEnglish()
        } else {
            changeLanguageEnglishToKorean()
        }
        koreanEnglishTranslator?.translate(text) { translatedText, error in
            guard error == nil, let translatedText = translatedText else { return }
            print("Translated text:", translatedText)
            completion(translatedText)
        }
    }
}

extension String {
    // 한글인지 판단하는 함수 추가 (한글이면 true 아니면 false)
    func containsKorean() -> Bool {
        for scalar in unicodeScalars {
            // 한글 유니코드 범위: 0xAC00 ~ 0xD7A3
            if scalar.value >= 0xAC00, scalar.value <= 0xD7A3 {
                return true
            } else {
                return false
            }
        }
        return false
    }
}
