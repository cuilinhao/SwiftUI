//
//  MutipleImpicitAnimations.swift
//  ExplicitAnimation
//
//  Created by 崔林豪 on 2020/10/6.
//

import SwiftUI

struct MutipleImpicitAnimations: View {
	
	@State private var enable = false
		
    var body: some View {
		Button("点我"){
			self.enable.toggle()
		}
		.foregroundColor(.blue)
		.font(.largeTitle)
		.frame(width: 200, height: 200, alignment: .center)
		.background(enable ? Color.red : Color.yellow)
		//clipShape 要写在animation 那地方，是有不同效果的
		.animation(.default)
		
		.clipShape(RoundedRectangle(cornerRadius: enable ? 60 : 0))
		//弹簧动画
		.animation(.interpolatingSpring(stiffness: 10, damping: 1))
		
    }
}

struct MutipleImpicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        MutipleImpicitAnimations()
    }
}
