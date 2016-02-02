//
//  AdditionalTodoistSyntaxTests.swift
//  Markdown Parser Example
//
//  Created by Harry Jordan on 02/02/2016.
//  Copyright © 2016 Harry Jordan. All rights reserved.
//

import Foundation
import XCTest



class TodoistSyntaxTests: XCTestCase {


	func testDoubleExclimationMarkAsBold() {
		let initialState = SYMLDefaultMarkdownParserState()
		let text = "some !!bold text!! demarked by !!exclimation marks!! mixed with **bold** denoted with asterixs";
		let attributedString = NSMutableAttributedString(string: text)
		var elementCollection: SYMLAttributedObjectCollection? = attributedString
		
		SYMLParseMarkdown(text, &elementCollection, initialState, TestAttributesCollection());
		var numberOfBoldElements = 0
		
		attributedString.enumerateAttribute(TestElementKey, inRange: text.range, options: []) { (element, range, stop) in
			if let element = element as? String {
				switch element {
					case "strongAttributes":
						numberOfBoldElements += 1
					
					default:
						break
				}
			}
		}
		
		XCTAssertEqual(numberOfBoldElements, 3, "Couldn't load spec.json")
	}

}