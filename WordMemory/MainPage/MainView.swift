//
//  MainView.swift
//  WordMemory
//
//  Created by 정기현 on 2024/04/10.
//

import SnapKit
import UIKit

class MainView: UIView {
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setlayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var inputWord: UITextField = {
        let tf = UITextField()
        tf.placeholder = "단어를 입력해주세요"
        return tf
    }()

    lazy var inputwordView: UIView = {
        let vw = UIView()
        vw.addSubview(inputWord)
        vw.layer.borderWidth = 1
        vw.layer.cornerRadius = 5
        return vw
    }()
    lazy var searchButton: UIButton = {
       let btn = UIButton()
        let search = UIImage(systemName: "magnifyingglass")
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.setImage(search, for: .normal)
        return btn
    }()
    lazy var outputWord: UILabel = {
        let lb = UILabel()
        lb.text = "aa"
        return lb
    }()
    lazy var outputWordView: UIView = {
        let vw = UIView()
        vw.addSubview(outputWord)
        vw.layer.borderWidth = 1
        vw.layer.cornerRadius = 5
        return vw
    }()
}

extension MainView {
    func setlayout() {
        addSubview(inputwordView)
        addSubview(searchButton)
        addSubview(outputWordView)
        
        inputwordView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(40)
        }
        inputWord.snp.makeConstraints {
            $0.top.equalTo(inputwordView)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(40)
        }
        searchButton.snp.makeConstraints{
            $0.top.equalTo(inputwordView.snp.bottom).offset(30)
            $0.leading.equalTo(inputwordView)
            $0.trailing.equalTo(inputwordView)
            $0.height.equalTo(40)
        }
        outputWordView.snp.makeConstraints {
            $0.top.equalTo(searchButton.snp.bottom).offset(30)
            $0.leading.equalTo(searchButton)
            $0.trailing.equalTo(searchButton)
            $0.height.equalTo(40)
        }
        outputWord.snp.makeConstraints {
            $0.top.equalTo(outputWordView)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(40)
        }
    }
}
