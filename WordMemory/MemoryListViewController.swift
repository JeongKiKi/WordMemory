//
//  MemoryListViewController.swift
//  WordMemory
//
//  Created by 정기현 on 2024/04/11.
//
import UIKit

class MemoryListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        navigationItem.title = "단어장"
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListCell")
        makeUI()
    }

    lazy var tableView: UITableView = {
        let table = UITableView()
        view.addSubview(table)

        return table
    }()

    func makeUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),

        ])
    }
}

extension MemoryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 테이블 뷰의 행 수를 반환합니다.
        return 3 // 예시로 0을 반환하도록 설정되어 있습니다.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 각 행에 해당하는 셀을 반환합니다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListTableViewCell
        // 셀 설정 코드 추가
        return ListTableViewCell()
    }
}

extension MemoryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let todo = TodoManager.shared.todos[indexPath.row]
//        print(todo.title)
    }
}
