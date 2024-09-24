//
//  UIViewController.NavigationBarTitle.swift
//  ToDos
//
//  Created by Artur Akulich on 23.09.24.
//

import UIKit

extension UIViewController {
    func setCustomNavigationBarTitle(
        _ title: String,
        textColor: UIColor = .appWhite,
        font: UIFont = .title()
    ) {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = textColor
        titleLabel.font = font
        navigationItem.titleView = titleLabel
    }
}
