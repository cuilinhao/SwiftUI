//
//  ContentView.swift
//  Animations
//
//  Created by 崔林豪 on 2020/10/6.
//

import SwiftUI

struct ContentView: View {
	
	@State private var amount: CGFloat = 1
	@State private var amount2: CGFloat = 1;
	//@State private var  amount3 = 1.0
	
    var body: some View {
		
		VStack(spacing: 50){
			Button("点我"){
				self.amount += 1
			}
			.padding(30)
			.foregroundColor(.white)
			.background(Color.green)
			.clipShape(Circle())
			
			//变大 缩放
			.scaleEffect(amount)
			//隐式动画
			.animation(.default)
			.blur(radius: amount - 1)
			
			//隐式动画 -- 进阶
			Button("抢红包"){
				//self.amount2 += 1
				
			}
			.foregroundColor(.white)
			.padding(30)
			.background(Color.red)
			.clipShape(Circle())
			
			//描边
			.overlay(
				Circle()
					//stroke 描边 lineWidth默认是1 可以不写
					.stroke(Color.red)
					.scaleEffect(amount2)
					//透明度
					.opacity(Double(2 - amount2))
					// 链式调用必须明确
					.animation(
						//autoreverses 自动反转
						Animation.easeOut(duration: 1.0)
							.repeatForever(autoreverses: false)
					)
					
			)
			.onAppear {
				self.amount2 = 2
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
