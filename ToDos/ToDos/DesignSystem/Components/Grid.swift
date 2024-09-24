//
//  Grid.swift
//  ToDos
//
//  Created by Artur Akulich on 22.09.24.
//

import Foundation

public enum Grid {
    public enum Spacing {
        public static let xs2: CGFloat = 4.0
        public static let xs: CGFloat = 8.0
        public static let s: CGFloat = 12.0
        public static let m: CGFloat = 16.0
        public static let l: CGFloat = 20.0
        public static let xl: CGFloat = 24.0
        public static let xl2: CGFloat = 28.0
        public static let xl3: CGFloat = 32.0
        public static let xl4: CGFloat = 36.0
        public static let xl5: CGFloat = 40.0
    }
    
    public enum Size {
        public static let s2: CGSize = .init(squareSide: Spacing.xs2)
        public static let xs: CGSize = .init(squareSide: Spacing.xs)
        public static let s: CGSize = .init(squareSide: Spacing.s)
        public static let m: CGSize = .init(squareSide: Spacing.m)
        public static let l: CGSize = .init(squareSide: Spacing.l)
        public static let xl: CGSize = .init(squareSide: Spacing.xl)
        public static let xl2: CGSize = .init(squareSide: Spacing.xl2)
        public static let xl3: CGSize = .init(squareSide: Spacing.xl3)
        public static let xl4: CGSize = .init(squareSide: Spacing.xl4)
        public static let xl5: CGSize = .init(squareSide: Spacing.xl5)
    }
    
    public enum CornerRadius {
        public static let hintView: CGFloat = 18.0
        public static let actionView: CGFloat = 40.0
        public static let button: CGFloat = 22.5
    }
}
