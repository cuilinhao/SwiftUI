//
//  ContentView.swift
//  ExplicitAnimation
//
//  Created by 崔林豪 on 2020/10/6.
//

import SwiftUI

//withAnimation 动画 指定动画

struct ContentView: View {
	
	@State private var amount = 0.0
	
    var body: some View {
		Button("点我"){
			//弹簧动画 interpolatingSpring
			withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)){
				self.amount += 360
			}
		}
		.padding(50)
		.foregroundColor(.blue)
		.background(Color.green)
		.clipShape(Circle())
		.rotation3DEffect(
			//degrees 旋转的度数
			.degrees(amount),
			axis: (x: 0.0, y: 1.0, z: 0.0)
		)
		//.animation(.default)
		//Animation.easeOut(duration: 1.0)
		
		
		
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
