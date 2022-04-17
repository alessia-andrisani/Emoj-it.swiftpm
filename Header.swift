//
//  File.swift
//  Emoj-it
//
//  Created by Alessia Andrisani on 14/04/22.
//

import SwiftUI

struct Header: View {
	internal init(_ title: LocalizedStringKey) {
		self.title = title
	}
	
	let title: LocalizedStringKey
	
	var body: some View {
		Text(title)
			.font(.title.bold())
			.padding(.leading, 30)
	}
}
