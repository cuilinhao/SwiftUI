//
//  AnimationGesture.swift
//  ExplicitAnimation
//
//  Created by 崔林豪 on 2020/10/6.
//

import SwiftUI

//手势动画
struct AnimationGesture: View {
	
	@State private var dragOffset: CGSize = .zero
	@State private var dragOffset2: CGSize = .zero
	//改变颜色要用三元运算符
	@State private var enabled = false
	
	let letters = Array("有人的地方就有江湖")
	
	var body: some View {
		VStack {
			//线性渐变 左上角到右下角
			LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
				.frame(width: 200, height: 100, alignment: .center)
				.clipShape(RoundedRectangle(cornerRadius: 10))
				//偏移
				.offset(dragOffset)
				.gesture(
					//持续性手势
					DragGesture()
						
						//后面这一部分就是尾随闭包，可以用$0 来代替
						//.onChanged(<#T##action: (DragGesture.Value) -> Void##(DragGesture.Value) -> Void#>)
						
						//onChanged 一直在调用 可以取到偏移量translation
						.onChanged{
							self.dragOffset = $0.translation
						}
						//手势结束之后
						//尾随闭包中的参数没用到 就用 _ 来代替
						.onEnded{_ in
							//spring 弹簧动画
							//指定动画
							withAnimation(.spring()){
								self.dragOffset = .zero
							}
						}
				)
			
			//小实战
			HStack(spacing: 0){
				//数组可以这样写 letters.indices
				ForEach(letters.indices, id:\.self){ index in
					Text(String(self.letters[index]))
						.font(.title)
						.background(self.enabled ? Color.yellow : Color.green)
						.foregroundColor(.blue)
						.offset(self.dragOffset2)
						.animation(Animation.default.delay(Double(index) / 20))
				}
			}
			.gesture(
			  DragGesture()
				.onChanged{
					self.dragOffset2 = $0.translation
				}
				.onEnded{ _ in
					self.dragOffset2 = .zero
					self.enabled.toggle()
				}
			)
			
		}
		
		
	}
	
}

struct AnimationGesture_Previews: PreviewProvider {
	static var previews: some View {
		AnimationGesture()
	}
}
