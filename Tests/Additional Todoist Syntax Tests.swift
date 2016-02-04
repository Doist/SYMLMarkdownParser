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
		let input1 = "some !!bold text!! demarked by !!exclimation marks!! mixed with **bold** denoted with asterixs";
		XCTAssertEqual(numberOfElementsOfType("strong", input1, parserConfiguration), 3, "Test both standard and Todosit style strong elements are matched")
		
		let input2 = "someetimes the !! exclimation marks !! have spaces around them";
		XCTAssertEqual(numberOfElementsOfType("strong", input2, parserConfiguration), 1, "Test that Todosit style elements are matched when surrounded by spaces")
	}
    
    
    func testTodoistLinkElements() {
//		let input = "look for Todoist link items like [gmail: http://example.com] or [outlook id:123213]";
//		XCTAssertEqual(numberOfElementsOfType("link", input, parserConfiguration), 2, "Test that Todosit style elements are matched when surrounded by spaces")
    }
	
}