//
//  ViewController.swift
//  WordMemory
//
//  Created by 정기현 on 2024/04/09.
//

import UIKit

class MainViewController: UIViewController {
    let mainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        view.addSubview(mainView)

        mainView.snp.makeConstraints {
            $0.top.equalTo(self.view)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}
