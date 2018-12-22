//
//  Highlightable.swift
//  Highlighter
//
//  Created by Ian Keen on 2017-05-16.
//  Copyright © 2017 SeungyounYi. All rights reserved.
//

import Foundation

public protocol Highlightable: class {
    var textValue: String? { get }
    var attributedTextValue: NSAttributedString? { get set }

    func highlight(text: String, normal normalAttributes: [String : Any]?, highlight highlightAttributes: [String : Any]?)
}

public extension NSRange {
    private init(string: String, lowerBound: String.Index, upperBound: String.Index) {
        let utf16 = string.utf16
        
        let lowerBound = lowerBound.samePosition(in: utf16)
        let location = utf16.distance(from: utf16.startIndex, to: lowerBound)
        let length = utf16.distance(from: lowerBound, to: upperBound.samePosition(in: utf16))
        
        self.init(location: location, length: length)
    }
    
    public init(range: Range<String.Index>, in string: String) {
        self.init(string: string, lowerBound: range.lowerBound, upperBound: range.upperBound)
    }
    
    public init(range: ClosedRange<String.Index>, in string: String) {
        self.init(string: string, lowerBound: range.lowerBound, upperBound: range.upperBound)
    }
}

extension Highlightable {
    public func highlight(text: String, normal normalAttributes: [String : Any]?, highlight highlightAttributes: [String : Any]?) {
        guard let inputText = self.textValue else { return }

        let highlightRanges = inputText.ranges(of: text, options: .caseInsensitive)
        
        guard !highlightRanges.isEmpty else { return }
        
        
        var attributedString: NSMutableAttributedString?
        if let str = self.attributedTextValue {
            attributedString = NSMutableAttributedString(attributedString: str)
        } else {
            attributedString = NSMutableAttributedString(string: inputText, attributes: normalAttributes)
        }
        
        //print("will highlight: \(String(describing: attributedString))")
        for range in highlightRanges {
            let nsRange = NSRange(range: range, in: inputText)
            attributedString?.addAttributes(highlightAttributes ?? [:], range: nsRange)
        }
//        print("did highlight: \(String(describing: attributedString))")
        self.attributedTextValue = attributedString
    }
}
