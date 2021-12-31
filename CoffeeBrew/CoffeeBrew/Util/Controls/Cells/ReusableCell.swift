//
//  ReusableCell.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 31/12/21.
//


import UIKit

protocol ReusableCell: AnyObject {
    static var reuseId: String { get }
    static var nib: UINib { get }
    static var hasNib: Bool { get }
}

extension ReusableCell {
    static var reuseId: String { return "\(Self.self)" }
    static var nib: UINib { return .init(nibName: "\(Self.self)", bundle: .main) }
    static var hasNib: Bool { return true }
}
