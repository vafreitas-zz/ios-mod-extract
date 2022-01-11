//
//  UITableView+Extension.swift
//  DIOExtract
//
//  Created by Victor Freitas on 11/01/22.
//

import UIKit

extension UITableView {
    func register(_ cell: UITableViewCell.Type) {
        let bundle = Bundle(for: cell)
        let nib = UINib(nibName: cell.identifier, bundle: bundle)
        register(nib, forCellReuseIdentifier: cell.identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(of class: T.Type,
                                                            for indexPath: IndexPath,
                                                            configure: @escaping ((T) -> Void) = { _ in }) -> UITableViewCell {
            let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath)
            if let typedCell = cell as? T {
                configure(typedCell)
            }
            return cell
        }
}
