//
//  TableViewCell.swift
//  WordMemory
//
//  Created by 정기현 on 2024/04/11.
//

import SnapKit
import UIKit

class ListTableViewCell: UITableViewCell {
    lazy var wordLable: UILabel = {
        let lb = UILabel()
        lb.text = "apple"
        contentView.addSubview(lb)
        return lb
    }()

    lazy var meaningLable: UILabel = {
        let lb = UILabel()
        lb.text = "사과"
        contentView.addSubview(lb)
        return lb
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // 코드로 cell을 만들때는 init이 필요하다.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListTableViewCell {
    func makeUI() {
        wordLable.snp.makeConstraints {
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.leading.equalTo(contentView.snp.leading).offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(20)
        }
        meaningLable.snp.makeConstraints {
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.leading.equalTo(wordLable.snp.trailing).offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(20)
        }
    }
}
