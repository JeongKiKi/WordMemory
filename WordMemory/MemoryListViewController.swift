//
//  MemoryListViewController.swift
//  WordMemory
//
//  Created by 정기현 on 2024/04/11.
//
import SnapKit
import UIKit

class MemoryListViewController: UIViewController {
    let dummy = Dummy()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListCell")
        makeUI()
        setupNavigationBar()
    }

    lazy var tableView: UITableView = {
        let table = UITableView()
        view.addSubview(table)

        return table
    }()

    func setupNavigationBar() {
        // 오른쪽에 플러스 버튼 추가
        navigationItem.title = "단어장"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }

    @objc func addButtonTapped() {
        // 플러스 버튼이 탭되었을 때의 동작
        // 여기에 새로운 항목을 추가하는 코드를 작성하세요.
        print("+  버튼눌림")
    }

    func makeUI() {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
    }
}

extension MemoryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 테이블 뷰의 행 수를 반환합니다.
        return dummy.getDummyData().count // 예시로 0을 반환하도록 설정되어 있습니다.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 각 행에 해당하는 셀을 반환합니다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListTableViewCell
        let word = dummy.getDummyData()[indexPath.row]
        cell.wordLable.text = word.word
        cell.meaningLable.text = word.meaning
        // 셀 설정 코드 추가
        return cell
    }
}

extension MemoryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let todo = TodoManager.shared.todos[indexPath.row]
//        print(todo.title)
    }
}
