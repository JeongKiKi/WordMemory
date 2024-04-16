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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(wordBtn)
        wordBtn.snp.makeConstraints {
            $0.top.equalTo(self.view)
            $0.leading.bottom.trailing.equalToSuperview()
        }
        let a = words[1].word
        let b = words[1].meaning
        if selectedBtn == "word" {
            wordBtn.noSelectedLabel.text = b
            print(words)
        }
        else {
            wordBtn.noSelectedLabel.text = a
        }
    }
}
