//
//  ContentView.swift
//  TestVSatck
//
//  Created by 崔林豪 on 2020/10/5.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("Hello, world!")
//            .padding()
		
		VStack{
			Color.blue
				.frame(width: 100, height: 100, alignment: .center)
				.test(text: "kk")
		}
		
    }
}

struct water: ViewModifier {
	
	let text: String
	
	func body(content: Content) -> some View {
		
		ZStack(alignment:.bottomTrailing){
			content
				Text(text)
				.padding()
				.foregroundColor(.blue)
				.background(Color.red)
		}
		
		
	}
}


extension View{
	
	func test(text: String) -> some View{
		self.modifier(water(text: "hha"))
	}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
