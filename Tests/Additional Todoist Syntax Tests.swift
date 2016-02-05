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
		
		XCTAssertEqual(numberOfElementsOfType("strong", text, parserConfiguration), 1, "Test standard strong elements are matched")
	}


	func testDoubleExclimationMarkAsBold() {
		let parserConfiguration = TodoistInlineMarkdownParserState()
		let input = "some !!bold text!! demarked by !!exclimation marks!! mixed with **bold** denoted with asterixs";
		XCTAssertEqual(numberOfElementsOfType("strong", input, parserConfiguration), 3, "Test both standard and Todosit style strong elements are matched")
	}
    
	func testDoubleExclimationMarkAsBoldWithSpaces() {
		let parserConfiguration = TodoistInlineMarkdownParserState()
		let input1 = "sometimes the !! exclimation marks !! have spaces around them";
		XCTAssertEqual(numberOfElementsOfType("strong", input1, parserConfiguration), 1, "Test that Todosit style elements are matched when surrounded by spaces")
        
        let input2 = "Text with !!strong text!! defined by !!two exclamation!! marks"
		XCTAssertEqual(numberOfElementsOfType("strong", input2, parserConfiguration), 2, "Test that Todosit style elements are matched when surrounded by spaces")
        
        matchElementsOfType("strong", input2, parserConfiguration, ["!!strong text!!", "!!two exclamation!!"])
        
        let input3 = "Text with !! strong text !! defined by !! two exclamation !! marks padded with spaces"
        matchElementsOfType("strong", input3, parserConfiguration, ["!! strong text !!", "!! two exclamation !!"])
	}
    
    
    
    func matchElementsOfType(elementKey: String, _ text: String, _ parserConfiguration: SYMLMarkdownParserState, _ expectedSubstrings: [String]) -> Bool {
        let attributedString = NSMutableAttributedString(string: text)
        var elementCollection: SYMLAttributedObjectCollection? = attributedString
        
        SYMLParseMarkdown(text, &elementCollection, parserConfiguration, TestAttributesCollection());
        var substringIndex = 0
        var success = true
        
        attributedString.enumerateAttribute(TestElementKey, inRange: attributedString.string.range, options: []) {(element, range, stop) -> Void in
            if let element = element as? String where element == "stong" {
                let text = (attributedString.string as NSString).substringWithRange(range)
                success = success && expectedSubstrings[substringIndex] == text
                XCTAssert(success, "Test substrings match expectations")
                
                substringIndex += 1
            }
        }
        
        return success
    }

    
    func testTodoistLinkElements() {
//		let input = "look for Todoist link items like [gmail: http://example.com] or [outlook id:123213]";
//		XCTAssertEqual(numberOfElementsOfType("link", input, parserConfiguration), 2, "Test that Todosit style elements are matched when surrounded by spaces")
    }
	
}
