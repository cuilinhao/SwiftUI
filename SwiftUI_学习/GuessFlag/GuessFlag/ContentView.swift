//
//  ContentView.swift
//  GuessFlag
//
//  Created by 崔林豪 on 2020/10/4.
//

import SwiftUI

struct ContentView: View {
	
	@State var countries = ["中国", "日本","法国","德国","意大利","俄罗斯","英国","美国"]
	//随机数 0到2 闭区间
	@State var currentCountry = Int.random(in: 0...2)
	
	@State private var showAlert = false
	//没有用双向绑定，只是用了值得改变
	@State private var alertTitle = ""
	
	var body: some View {
		
		ZStack{
			//Color.green 设置背景色
			//Text 一定要写在green的后面
			//Text("xxx")
			//只能设置text的颜色，而不是背景色
			//.background(Color.green)
			
			//渐变色
			LinearGradient(
				gradient: Gradient(colors: [.green, .blue]),
				startPoint: .top, endPoint: .bottom)
				.edgesIgnoringSafeArea(.all)
			
			//VStack 向上推移  VStack 外面再放一个VStack 就是一直向上推移
			VStack(spacing: 30){
				VStack(spacing: 10){
					Text("以下国际的旗帜是哪一个")
						.foregroundColor(.white)
					Text(countries[currentCountry])
						.foregroundColor(.white)
						.font(.largeTitle)
						.fontWeight(.black)
				}
				ForEach(0..<3, id: \.self){ num in
					
					Button(action: {
						
						self.alertTitle = num == self.currentCountry ? "答对" : "答错"
						self.showAlert = true
					}) {
						Image(self.countries[num])
							.renderingMode(.original)
							//形状
							.clipShape(Capsule())
							//描线
							.overlay(Capsule().stroke(Color.black, lineWidth: 1))
							//阴影
							.shadow(color: .black, radius: 2)
					}
				}
				
				//把剩余的空间都给Spacer，就会让Vstak中的视图向上移动，下面的空间都给spacer
				//如果是HStack 中写Spacer，则会把视图左推
				Spacer()
				.alert(isPresented: $showAlert) {
					
					Alert(
						title: Text("回答的内容如下："),
						message: Text(self.alertTitle),
						dismissButton: .default(Text("继续"), action: {
							self.next()
						})
					)
				}
			}
			
		}
		
	}
	
	func next(){
		//数组打乱， shuffle 洗牌的意思
		countries.shuffle()
		//currentCountry 需要改变 用@state包装器包装
		currentCountry = Int.random(in: 0...2)
	}
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
