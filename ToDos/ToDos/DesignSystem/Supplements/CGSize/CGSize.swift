//
//  CGSize.swift
//  ToDos
//
//  Created by Artur Akulich on 22.09.24.
//

import UIKit

public extension CGSize {
    init(squareSide: CGFloat) {
        self.init(width: squareSide, height: squareSide)
    }
}
