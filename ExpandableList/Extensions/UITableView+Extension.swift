//
//  UITableView+Extension.swift
//  ExpandableList
//
//  Created by Hossam Tal3t on 23/06/2024.
//

import UIKit

extension UITableView {

    /**
     Registers a UITableViewCell or UITableViewHeaderFooterView nib file to the table view.
     
     ### Example Usage ###
     ```swift
     tableView.registerNib(for: DetailsCell.self)
     ```
     
     - Parameter cellClass: The class type of the UITableViewCell or UITableViewHeaderFooterView to register.
     */
    func registerNib<Cell: UIView>(for cellClass: Cell.Type) {
        let nibName = String(describing: cellClass)
        let nib = UINib(nibName: nibName, bundle: nil)
        
        if cellClass is UITableViewCell.Type {
            self.register(nib, forCellReuseIdentifier: nibName)
        } else if cellClass is UITableViewHeaderFooterView.Type {
            self.register(nib, forHeaderFooterViewReuseIdentifier: nibName)
        } else {
            fatalError("Unsupported cell class type.")
        }
    }

    /**
     Dequeues a reusable cell or header/footer view in `cellForRowAt` or similar functions.
     
     ### Example Usage ###
     ```swift
     let cell: DetailsCell = tableView.dequeue()
     return cell
     ```
     
     - Returns: A dequeued cell or header/footer view of the specified type.
     */
    func dequeue<Cell: UIView>() -> Cell {
        let identifier = String(describing: Cell.self)
        
        if Cell.self is UITableViewCell.Type {
            guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
                fatalError("Could not dequeue a cell with identifier: \(identifier)")
            }
            return cell
        } else if Cell.self is UITableViewHeaderFooterView.Type {
            guard let headerFooterView = self.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? Cell else {
                fatalError("Could not dequeue a header/footer view with identifier: \(identifier)")
            }
            return headerFooterView
        } else {
            fatalError("Unsupported cell class type.")
        }
    }
}
