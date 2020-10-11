//
//  ContentView.swift
//  AddSingleAdress
//
//  Created by 崔林豪 on 2020/9/28.
//

import SwiftUI

struct ContentView: View {
	
	/*
	//双向绑定 TextField 变化 text 随着变化，
	//属性包装器 @state
	@State var xx = ""
	
	var body: some View {
	//body 是计算属性
	Form{
	TextField("xx", text: $xx)
	Text(xx)
	}
	}
	*/
	@State private var name = ""
	@State private var phone = ""
	@State private var adress = ""
	@State private var tagIndex = 0
	//绑定属性
	@State var showAlert = false
	
	
	let tags = ["家","学校","公司"]
	
	var confirMsg: String{
		//"收货人\(name)\n 手机:\(phone)\n 地址\(adress)\n\(tagIndex)"
		"""
		收货人\(name)
		手机:\(phone)
		地址: \(adress)
		标签：\(tags[tagIndex])
		"""
	}
	
	var invalidInput: Bool{
		
		name.isEmpty || phone.isEmpty || adress.isEmpty
	}
	
	
	var body: some View {
		
		//push类型要放在一个naviView中
		NavigationView{
			
			Form{
				//HStack 水平排列
				HStack {
					Text("收货人")
					TextField("请填写收货人姓名", text: $name)
				}
				
				HStack {
					Text("手机")
					TextField("请输入手机号", text: $phone)
						.keyboardType(.numberPad)
				}
				
				HStack {
					Text("详细地址")
					TextField("请输入手机号", text: $adress)
				}
				
				//header 就是section的头部
				Section(header: Text("标签")){
					
					//在swiftUI 进行循环 要求1.指定一个id 2，或者遵循一个Identifiable 协议 Referencing initializer 'init(_:content:)' on 'ForEach' requires that 'String' conform to 'Identifiable'
					
					//selection 必须是
					Picker("标签", selection: $tagIndex){
						//ForEach外层函数，是一个尾随闭包
						// \. 就是oc里面的keyPath 把每个元素取出来，
						//半闭区间
						ForEach(0..<tags.count, id: \.self){ index in
							Text(self.tags[index])
						}
					}
					//.表示修饰符，就是修改view的属性
					.pickerStyle(SegmentedPickerStyle())
				}
				
				//第三段
				Section{
					Button("填好了"){
						// 在闭包里面要用self
						self.showAlert = true
					}
					//.disabled(name.isEmpty || phone.isEmpty || adress.isEmpty)
					.disabled(invalidInput)
				}
			}
			.navigationBarTitle("新增收货地址")
			.alert(isPresented: $showAlert) {
				
				Alert(
					title: Text("确认地址"),
					//耦合性太高了
					message: Text(confirMsg),
					//Cannot convert value of type 'String' to expected argument type 'Text'
					dismissButton: .default(Text("填好了"))
					
				)
			}
			
		}
	}
	
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}


