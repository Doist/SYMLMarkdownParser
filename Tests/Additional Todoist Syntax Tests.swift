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


	func testMatchingOnlyStandardMarkdownStrongElements() {
		let parserConfiguration = SYMLDefaultMarkdownParserState()
		let text = "some !!bold text!! demarked by !!exclimation marks!! mixed with **bold** denoted with asterixs";
		
		XCTAssertEqual(numberOfMatchedBoldElementsInString(text, parserConfiguration), 1, "Test standard strong elements are matched")
	}


	func testDoubleExclimationMarkAsBold() {
		let parserConfiguration = SYMLTodoistMarkdownParserState()
		let text = "some !!bold text!! demarked by !!exclimation marks!! mixed with **bold** denoted with asterixs";
		
		XCTAssertEqual(numberOfMatchedBoldElementsInString(text, parserConfiguration), 3, "Test both standard and Todosit style emphasis elements are matched")
	}
	
	
	func numberOfMatchedBoldElementsInString(text: String, _ parserConfiguration: SYMLMarkdownParserState) -> Int {
		let attributedString = NSMutableAttributedString(string: text)
		var elementCollection: SYMLAttributedObjectCollection? = attributedString
		
		SYMLParseMarkdown(text, &elementCollection, parserConfiguration, TestAttributesCollection());
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
		
		return numberOfBoldElements
	}
	
}