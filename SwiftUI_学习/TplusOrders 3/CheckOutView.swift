//
//  CheckOutView.swift
//  TplusOrders
//
//  Created by 崔林豪 on 2020/11/1.
//

import SwiftUI

enum MKError: Error {
	case message(String)
}


struct CheckOutView: View {
	
	@ObservedObject var order: OrderModel
	@State private var showAlert = false
	@State private var message = ""
	
	
	var body: some View {
		
		VStack{
			Text("合计\(order.num * 10)元")
				.font(.largeTitle)
			Button("下单") {
				self.sendOrder()
			}
			.padding()
		}
		.navigationBarTitle(Text("下单"), displayMode: .inline)
		.alert(isPresented: $showAlert, content: {
			Alert(title: Text("感谢下单"), message: Text(self.message), dismissButton: .default(Text("朕知道了")))
		})
	}
	
	func sendOrder(){
		
		/** 注释
		guard let url = URL(string: "https://reqres.in/api/tea") else {
		return
		}
		
		guard let data = try? JSONEncoder().encode(order) else {
		return
		}
		
		代码可以简写为
		
		guard let url = URL(string: "https://reqres.in/api/tea"),
		let data = try? JSONEncoder().encode(order) else {
		return
		}
		*/
		
		guard let url = URL(string: "https://reqres.in/api/tea"),
			  let data = try? JSONEncoder().encode(order) else {
			return
		}
		
		var request = URLRequest(url: url)
		//指定请求方式
		request.httpMethod = "POST"
		//请求头
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		//请求体
		request.httpBody = data
		URLSession.shared.dataTask(with: request) { (data, response, error) in
			//data 是可选类型
			guard let data = data else {
				return
			}
			/** 注释
			do {
			/***
			tmp 进行po 数据如下，使用JSONSerialization能够解析出数据，但是解析数据后不是model类型需要进行解码
			▿ Optional<Any>
			▿ some : 7 elements
			▿ 0 : 2 elements
			- key : adress
			- value : 2132
			▿ 1 : 2 elements
			- key : id
			- value : 85
			▿ 2 : 2 elements
			- key : addSugar
			- value : 1
			▿ 3 : 2 elements
			- key : createdAt
			- value : 2020-11-17T13:31:21.350Z
			▿ 4 : 2 elements
			- key : num
			- value : 2
			▿ 5 : 2 elements
			- key : name
			- value : Qe
			▿ 6 : 2 elements
			- key : isAddIce
			- value : 1
			
			(lldb)
			*/
			//let tmp = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
			//print(tmp)
			
			/** 注释
			报错 使用do catch 会报错， 使用try？ 就不行
			Thread 4: Fatal error: 'try!' expression unexpectedly raised an error: Swift.DecodingError.keyNotFound(CodingKeys(stringValue: "phone", intValue: nil), Swift.DecodingError.Context(codingPath: [], debugDescription: "No value associated with key CodingKeys(stringValue: \"phone\", intValue: nil) (\"phone\").", underlyingError: nil))
			*/
			let decodedData = try! JSONDecoder().decode(OrderModel.self, from: data)
			//print(decodedData)
			
			//let xxz = try! JSONDecoder().decode(OrderModel.self, from: data)
			//print(xxz)
			}catch {
			print("xxz")
			}
			*/
			
			//data 是json数据， 需要解码
			guard let decodedData =  try? JSONDecoder().decode(OrderModel.self, from: data) else {
				return
			}
			
			//guard let jsonData = self.getJsonData(with: data) else {
				//throw MKError.message("转换jsonData失败")
			//}
			
			//guard let model = try? JSONDecoder().decode(T.self, from: jsonData) else {
				//throw MKError.message("转换模型失败")
			//}
			
			//赋值
			let ice = decodedData.isAddIce ? "加冰" : ""
			let sugar = decodedData.addSugar ? "加糖" : ""
			
			self.message = """
				服务器已经收到您的订单:\(decodedData.num)杯奶茶\(ice)\(sugar) 送货地址:\(decodedData.name)
					\(decodedData.adress)
				"""
			self.showAlert = true
			
		}.resume()
		
	}
	
	//codeTest
	//解析数据
	private static func getJsonData(with param: Any) -> Data? {
		if !JSONSerialization.isValidJSONObject(param) {
			return nil
		}
		guard let data = try? JSONSerialization.data(withJSONObject: param, options: []) else {
			return nil
		}
		
		let dd = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
		
		//报错 No exact matches in call to class method 'jsonObject'
		//let dd2 = try? JSONSerialization.jsonObject(with: param, options: .mutableContainers)
		
		return data
	}
}

struct CheckOutView_Previews: PreviewProvider {
	static var previews: some View {
		CheckOutView(order: OrderModel())
	}
}
