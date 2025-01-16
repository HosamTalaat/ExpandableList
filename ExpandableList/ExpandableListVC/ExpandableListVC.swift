//  ExpandableListVC.swift
//  ExpandableList
//
//  Created by Hossam Tal3t on 15/01/2025.
//

import UIKit

class ExpandableListVC: UIViewController {
    @IBOutlet weak var expandableListTV: UITableView!
    
    var currentlyExpandedIndices: Set<Int> = []
    var isSingleExpandedMode: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    @IBAction func singleExpandBtnClicked(_ sender: UIButton) {
        isSingleExpandedMode = true
        currentlyExpandedIndices.removeAll()
        expandableListTV.reloadData()
    }
    
    @IBAction func multiExpandBtnClicked(_ sender: UIButton) {
        isSingleExpandedMode = false
        expandableListTV.reloadData()
    }
}

extension ExpandableListVC {
    func initUI() {
        initTV(tv: expandableListTV)
    }
    
    func initTV(tv: UITableView) {
        tv.dataSource = self
        tv.registerNib(for: ExpandableListTVCell.self)
        tv.showsVerticalScrollIndicator = false
        tv.rowHeight = UITableView.automaticDimension
        tv.backgroundColor = .clear
    }
}

extension ExpandableListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as ExpandableListTVCell
        cell.delegate = self
        cell.cellIndex = indexPath.row
        cell.expandableImg.isHidden = !currentlyExpandedIndices.contains(indexPath.row)
        cell.arrowImg.transform = currentlyExpandedIndices.contains(indexPath.row) ? CGAffineTransform(rotationAngle: .pi) : .identity
        cell.titleLbl.text = self.currentlyExpandedIndices.contains(indexPath.row) ? "Collapse" : "Expand"
        
        return cell
    }
}

extension ExpandableListVC: ExpandableListTVCellProtocol {
    func expandRowBtnClicked(at index: Int) {
        isSingleExpandedMode ? toggleSingleExpand(at: index) : toggleMultiExpand(at: index)
        animateCell(at: index)
    }
    
    private func toggleSingleExpand(at index: Int) {
        if currentlyExpandedIndices.contains(index) {
            currentlyExpandedIndices.remove(index)
        } else {
            currentlyExpandedIndices.first.map { previousIndex in
                currentlyExpandedIndices.remove(previousIndex)
                animateCell(at: previousIndex)
            }
            currentlyExpandedIndices.insert(index)
        }
    }
    
    private func toggleMultiExpand(at index: Int) {
        if currentlyExpandedIndices.contains(index) {
            currentlyExpandedIndices.remove(index)
        } else {
            currentlyExpandedIndices.insert(index)
        }
    }
    
    private func animateCell(at index: Int) {
        (expandableListTV.cellForRow(at: IndexPath(row: index, section: 0)) as? ExpandableListTVCell).map { cell in
            UIView.animate(withDuration: 0.3, animations: {
                cell.titleLbl.text = self.currentlyExpandedIndices.contains(index) ? "Collapse" : "Expand"
                
                cell.arrowImg.transform = self.currentlyExpandedIndices.contains(index) ? CGAffineTransform(rotationAngle: .pi) : .identity
                cell.expandableImg.isHidden = !self.currentlyExpandedIndices.contains(index)
            }) { [weak self] _ in
                self?.updateTableView()
            }
        }
    }
    
    private func updateTableView() {
        expandableListTV.beginUpdates()
        expandableListTV.endUpdates()
    }
}

