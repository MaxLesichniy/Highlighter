//
//  Highlightables.swift
//  Highlighter
//
//  Created by Ian Keen on 2017-05-16.
//  Copyright © 2017 SeungyounYi. All rights reserved.
//

import UIKit

extension UILabel: Highlightable {
    public var textValue: String? { return text }
    public var attributedTextValue: NSAttributedString? {
        get { return attributedText }
        set { attributedText = newValue }
    }
}

extension UITextView: Highlightable {
    public var textValue: String? { return text }
    public var attributedTextValue: NSAttributedString? {
        get { return attributedText }
        set { attributedText = newValue }
    }
}

extension UITextField: Highlightable {
    public var textValue: String? { return text }
    public var attributedTextValue: NSAttributedString? {
        get { return attributedText }
        set { attributedText = newValue }
    }
}

extension UIButton: Highlightable {
    public var textValue: String? { return title(for: .normal) }
    public var attributedTextValue: NSAttributedString? {
        get { return attributedTitle(for: .normal) }
        set { setAttributedTitle(newValue, for: .normal) }
    }
}
