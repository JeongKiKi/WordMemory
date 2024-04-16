//
//  TestView.swift
//  WordMemory
//
//  Created by 정기현 on 2024/04/16.
//

import SnapKit
import UIKit

class TestView: UIView {
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        makeUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var wordButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("단어 맞추기", for: .normal)
        btn.backgroundColor = .gray
        return btn
    }()

    lazy var meaningButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("뜻 맞추기", for: .normal)
        btn.backgroundColor = .gray
        return btn
    }()

    lazy var btnStack: UIStackView = {
        let btnStack = UIStackView(arrangedSubviews: [wordButton, meaningButton])
        btnStack.axis = .vertical
        btnStack.spacing = 10
        btnStack.layer.borderWidth = 3
        btnStack.distribution = .equalSpacing
        btnStack.alignment = .fill
        return btnStack
    }()
}

extension TestView {
    func makeUI() {
        addSubview(btnStack)
        btnStack.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(300) // 너비 지정
            $0.height.equalTo(100)
        }
        wordButton.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        meaningButton.snp.makeConstraints {
            $0.height.equalTo(40)
        }
    }
}
