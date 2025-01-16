//
//  ExpandableListTVCell.swift
//  ExpandableList
//
//  Created by Hossam Tal3t on 15/01/2025.
//

import UIKit
protocol ExpandableListTVCellProtocol: AnyObject {
    func expandRowBtnClicked(at index: Int)
}

class ExpandableListTVCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var arrowImg: UIImageView!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var expandableImg: UIImageView!
    weak var delegate: ExpandableListTVCellProtocol?
    
    var cellIndex: Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        mainStack.layer.cornerRadius = 30
    }
    
    @IBAction func expandRowBtnClicked(_ sender: UIButton) {
        guard let index = cellIndex else { return }
        delegate?.expandRowBtnClicked(at: index)
    }
    
}



