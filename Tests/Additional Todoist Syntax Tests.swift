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
		let parserConfiguration = SYMLTodoistMarkdownParserState()
		let text = "some !!bold text!! demarked by !!exclimation marks!! mixed with **bold** denoted with asterixs";
		
		XCTAssertEqual(numberOfElementsOfType("strong", text, parserConfiguration), 3, "Test both standard and Todosit style emphasis elements are matched")
	}
	
	
	
}