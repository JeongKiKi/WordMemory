//
//  WordBtnTappedView.swift
//  WordMemory
//
//  Created by 정기현 on 2024/04/16.
//

import SnapKit
import UIKit
class SelectedBtnTappedView: UIView {
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        makeUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var selectedTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "단어를 입력해주세요"
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 10
        tf.textAlignment = .center
        return tf
    }()

    lazy var noSelectedLabel: UILabel = {
        let lb = UILabel()
        lb.layer.borderWidth = 1
        lb.layer.cornerRadius = 10
        lb.text = "해당단어"
        lb.textAlignment = .center
        return lb
    }()

    lazy var okBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("확인", for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 10
        return btn
    }()

    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [noSelectedLabel, selectedTextField, okBtn])
        st.axis = .vertical
        st.spacing = 10
        st.distribution = .equalSpacing
        st.alignment = .fill
        return st
    }()
}

extension SelectedBtnTappedView {
    func makeUI() {
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(30)
            $0.centerX.equalTo(safeAreaLayoutGuide)
            $0.width.equalTo(300)
            $0.height.equalTo(200)
        }
        selectedTextField.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        noSelectedLabel.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        okBtn.snp.makeConstraints {
            $0.height.equalTo(40)
        }
    }
}
