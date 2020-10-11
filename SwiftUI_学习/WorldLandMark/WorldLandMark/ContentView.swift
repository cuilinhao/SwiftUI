//
//  ContentView.swift
//  WorldLandMark
//
//  Created by 崔林豪 on 2020/10/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct HomePage: View {

	var body: some View{
		//返回必须是单一的，或者是 text 或者是 button
		Button(action: {}, label: {
			Text("点我")
		})
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
