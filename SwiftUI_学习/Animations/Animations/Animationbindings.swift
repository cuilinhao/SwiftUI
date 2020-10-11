//
//  Animationbindings.swift
//  Animations
//
//  Created by 崔林豪 on 2020/10/6.
//

import SwiftUI

//动画绑定

struct Animationbindings: View {
	
	@State private var amount: CGFloat = 1
	
	var body: some View {
		
		VStack(spacing: 100){
			//Stepper 步进器
			Stepper(
				"缩放下图",
				//所有视图都发生变化，就要用$amount.animation
				//如果要用单个的视图进行动画，则可以直接在后面写
				value: $amount.animation(
					Animation.easeInOut(duration: 1)
						.repeatCount(3)
					
				),
				in: 1...3)
				//只要水平方向有边距 内边距
				.padding(.horizontal)
				.background(Color.yellow)
			
			Button("动画绑定"){
				
			}
			.padding(40)
			.foregroundColor(.blue)
			.background(Color.green)
			.clipShape(Circle())
			.scaleEffect(amount)
			
		}
	}
}

struct Animationbindings_Previews: PreviewProvider {
	static var previews: some View {
		Animationbindings()
	}
}
