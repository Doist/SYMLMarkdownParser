//
//  Markdown Parser Tests.swift
//  Markdown Parser Example
//
//  Created by Harry Jordan on 19/12/2014.
//  Copyright (c) 2014 Harry Jordan. All rights reserved.
//

import Cocoa
import XCTest



class Markdown_Parser_Tests: XCTestCase {
	
	func exampleText() -> String {
		let exampleDocumentURL = NSBundle.mainBundle().URLForResource("README", withExtension: "md")!
		let exampleText = try? String(contentsOfURL: exampleDocumentURL, usedEncoding:nil)
		return exampleText!
	}
	
	
    func testNullInput() {
        // This is an example of a functional test case.
		// Parsing without any input
		let initialParseState = SYMLDefaultMarkdownParserState()
		SYMLParseMarkdown(nil, nil, initialParseState, nil);
		
		// Test without an attributed collection to parse into
		SYMLParseMarkdown(exampleText(), nil, initialParseState, nil);
    }
	
	
//	func testParsingIntoAnAttributedString() {
//		let initialState = SYMLDefaultMarkdownParserState()
//		let text = exampleText();
//		var attributedString = NSMutableAttributedString(string: text)
//		var elementCollection : SYMLAttributedObjectCollection? = attributedString
//		
//		let outputState = SYMLParseMarkdown(text, &elementCollection, initialState, nil);
//		
//		let range = text.range
//		attributedString.enumerateAttributesInRange(range, options:NSAttributedStringEnumerationOptions.LongestEffectiveRangeNotRequired) {
//			(attributes :[String : AnyObject], range :NSRange, stop :UnsafeMutablePointer<ObjCBool>) in
//			if(attributes.count > 0) {
//				print("Attribute: \(attributes), \(range)")
//			}
//		}
//	}
	
	
	func testEmphasisCodeElements() {
		let parserConfiguration = SYMLDefaultMarkdownParserState()
		let text = "some *emphasised text* demarked by *single asterixes*";
		
		XCTAssertEqual(numberOfElementsOfType("emphasis", text, parserConfiguration), 2, "Test that both inline code elements are matched")
	}
	
	
	func testInlineCodeElements() {
		let parserConfiguration = SYMLDefaultMarkdownParserState()
		let text = "some `code` demarked by `back ticks` as";
		
		XCTAssertEqual(numberOfElementsOfType("inlineCode", text, parserConfiguration), 2, "Test that both inline code elements are matched")
	}


	
	
//	func testConformanceToCommonMark() {
//		let jsonURL = NSBundle.mainBundle().URLForResource("specs", withExtension: "json")!
//		let jsonData = NSData(contentsOfURL: jsonURL)
//		XCTAssertNotNil(jsonData, "Couldn't load spec.json")
//		
//		let tests = JSON(data:jsonData!)
//		
//		for (index: String, test: JSON) in tests {
//			let exampleNumber = test["example"].intValue
//			let startLine = test["start_line"].intValue
//			let endLine = test["end_line"].intValue
//			let markdown = test["markdown"].stringValue
//			let html = test["html"].stringValue
//			
//			let isValid = validateParser(markdown, expectedHTMLOutput:html)
//			let description =	"Example \(exampleNumber) (line \(startLine) to \(endLine))\n\n" +
//								"Markdown:\n\(markdown)\n" +
//								"Expected HTML output:\n\(html)\n"
//			
//			XCTAssertTrue(isValid, description)
//		}
//    }

	
	func validateParser(input: String, expectedHTMLOutput: String) -> Bool {
		return false
	}

}




extension String {
	
	var range: NSRange {
		return NSMakeRange(0, (self as NSString).length)
	}
	
}


func numberOfElementsOfType(elementKey: String, _ text: String, _ parserConfiguration: SYMLMarkdownParserState) -> Int {
	let attributedString = NSMutableAttributedString(string: text)
	var elementCollection: SYMLAttributedObjectCollection? = attributedString
	
	SYMLParseMarkdown(text, &elementCollection, parserConfiguration, TestAttributesCollection());
	var numberOfElements: Int = 0
	
	attributedString.enumerateAttribute(TestElementKey, inRange: text.range, options: []) { (element, range, stop) in
		if let element = element as? String {
			switch element {
				case elementKey:
					numberOfElements += 1
				
				default:
					break
			}
		}
	}
	
	return numberOfElements
}
