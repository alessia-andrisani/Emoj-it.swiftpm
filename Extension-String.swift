//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 17/04/22.
//

import Foundation

extension String {
	func normalized() -> String {
		var string = self
		string = string.lowercased()
		
		string = string.replacingOccurrences(of: "'", with: " ")
		string = string.replacingOccurrences(of: "’", with: " ")
		
		string = string.replacingOccurrences(of: " ", with: "")
		
		string = string.folding(options: .diacriticInsensitive, locale: .current)
		
		return string 
	}
	
	var wordCount: Int {
		
		let string = self
		
		let components = string.components(separatedBy: .whitespacesAndNewlines)
		
		return components.count
		
	}
}
