//
//  ViewController.swift
//  TplusOrders
//
//  Created by 崔林豪 on 2020/11/17.
//

import Foundation
import UIKit

class jsonViewController: UIViewController {
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		jsonFunc1()
//		jsonFunc2()
//		jsonFunc3()
//		jsonFunc4()
//		jsonFunc7()
//		jsonFunc8()
	}
}

// MARK: https://segmentfault.com/a/1190000009929819#articleHeader9

extension jsonViewController {
	
	
	/*
	/// JSON 数据结构和Model 对象结构一致
	func jsonFunc1() {
		let jsonString: String = "{\"name\":\"Endeavor\",\"abv\":8.9,\"brewery\":\"Saint Arnold\",\"style\":\"ipa\"}"
		let jsonData = jsonString.data(using: String.Encoding.utf8)
		let decoder = JSONDecoder()
		// JSON 数据解析为 Beer 实例对象
		let beer = try! decoder.decode(Beer.self, from: jsonData!)
		
		print("name=\(beer.name),abv=\(beer.abv),brewery=\(beer.brewery),style=\(beer.style)")
		/* 打印
		 name=Endeavor,abv=8.9,brewery=Saint Arnold,style=ipa
		 */
		
		let encoder = JSONEncoder()
		// 默认 outputFormatting 属性值为 .compact，输出效果如上。如果将其改为 .prettyPrinted 后就能获得更好的阅读体检
		encoder.outputFormatting = .prettyPrinted
		// 将 Beer 实例转化为 JSON
		let jsonData2 = try! encoder.encode(beer)
		
		print(String(bytes: jsonData2, encoding: String.Encoding.utf8) ?? "")
		
		/* 打印
		 {
		 "style" : "ipa",
		 "brewery" : "Saint Arnold",
		 "name" : "Endeavor",
		 "abv" : 8.8999996185302734
		 }
		 */
	}
	
	/// JSON 数据结构和Model 对象结构不一致,自定义键值名
	func jsonFunc2() {
		let jsonString: String = "{\"name\":\"Endeavor\",\"alcohol_by_volume\":8.9,\"brewery_name\":\"Saint Arnold\",\"style\":\"ipa\"}"
		let jsonData = jsonString.data(using: String.Encoding.utf8)
		let decoder = JSONDecoder()
		// JSON 数据解析为 Beer 实例对象
		let beer = try! decoder.decode(Beer2.self, from: jsonData!)
		
		print("name=\(beer.name),abv=\(beer.abv),brewery=\(beer.brewery),style=\(beer.style)")
		/* 打印
		 name=Endeavor,abv=8.9,brewery=Saint Arnold,style=ipa
		 */
		
		let encoder = JSONEncoder()
		// 默认 outputFormatting 属性值为 .compact，输出效果如上。如果将其改为 .prettyPrinted 后就能获得更好的阅读体检
		encoder.outputFormatting = .prettyPrinted
		// 将 Beer 实例转化为 JSON
		let jsonData2 = try! encoder.encode(beer)
		
		print(String(bytes: jsonData2, encoding: String.Encoding.utf8) ?? "")
		/* 打印
		 {
		 "style" : "ipa",
		 "name" : "Endeavor",
		 "brewery_name" : "Saint Arnold",
		 "alcohol_by_volume" : 8.8999996185302734
		 }
		 */
	}
	
	/// Codable 默认实现无法覆盖继承这种情况
	func jsonFunc3() {
		let jsonDic: [String: Any] = ["name": "Endeavor", "abv": 8.9, "brewery": "Saint Arnold", "style": "ipa"]
		let jsonData = JSONToData(obj: jsonDic)
		
		let decoder = JSONDecoder()
		// JSON 数据解析为 Beer 实例对象
		let beer = try! decoder.decode(Beer3.self, from: jsonData)
		
		print("name=\(String(describing: beer.name)),abv=\(String(describing: beer.abv)),brewery=\(String(describing: beer.brewery)),style=\(String(describing: beer.style))")
		/* 打印
		 name=nil,abv=Optional(8.9),brewery=nil,style=nil
		 */
		
		//解析成功但是 name、brewery、style 三个属性全部为 nil,显然，这不是我们想要的结果。Codable 默认实现无法覆盖继承这种情况
	}
	
	/// 解决 无法覆盖继承的问题，自定义解码和编码
	func jsonFunc4() {
		let jsonString: String = "{\"name\":\"Endeavor\",\"alcohol_by_volume\":8.9,\"brewery_name\":\"Saint Arnold\",\"style\":\"ipa\"}"
		let jsonData = jsonString.data(using: String.Encoding.utf8)
		let decoder = JSONDecoder()
		// JSON 数据解析为 Beer 实例对象
		let beer = try! decoder.decode(Beer4.self, from: jsonData!)

		print("name=\(String(describing: beer.name)),abv=\(String(describing: beer.abv)),brewery=\(String(describing: beer.brewery)),style=\(String(describing: beer.style))")
		/* 打印
		 name=Optional("Endeavor"),abv=Optional(8.9),brewery=Optional("Saint Arnold"),style=Optional(abcProject.BeerStyle.ipa)
		 */
		
		let encoder = JSONEncoder()
		// 默认 outputFormatting 属性值为 .compact，输出效果如上。如果将其改为 .prettyPrinted 后就能获得更好的阅读体检
		encoder.outputFormatting = .prettyPrinted
		// 将 Beer 实例转化为 JSON
		let jsonData2 = try! encoder.encode(beer)
		
		print(String(bytes: jsonData2, encoding: String.Encoding.utf8) ?? "")
		/* 打印
		 {
		 "style" : "ipa",
		 "name" : "Endeavor",
		 "brewery_name" : "Saint Arnold",
		 "alcohol_by_volume" : 8.8999996185302734
		 }
		 */
	}
	
	/// 时间格式处理
	func jsonFunc7() {
		let encoder = JSONEncoder()
		encoder.dateEncodingStrategy = .iso8601
		let foo = Foo(date: Date())
		let jsonData2 = try! encoder.encode(foo)
		
		print(String(bytes: jsonData2, encoding: String.Encoding.utf8) ?? "")
		
		/*
		 其他日期编码格式选择如下：
		 
		 .formatted(DateFormatter) - 当你的日期字符串是非标准格式时使用。需要提供你自己的日期格式化器实例。
		 .custom( (Date, Encoder) throws -> Void ) - 当你需要真正意义上的自定义时，使用一个闭包进行实现。
		 .millisecondsSince1970、 .secondsSince1970 - 这在 API 设计中不是很常见。 由于时区信息完全不在编码表示中，所以不建议使用这样的格式，这使得人们更容易做出错误的假设。
		 对日期进行 Decoding 时基本上是相同的选项，但是 .custom 形式是 .custom( (Decoder) throws -> Date )，所以我们给了一个解码器并将任意类型转换为日期格式。
		 
		 */
	}
	
	/// 浮点类型处理
	func jsonFunc8() {
		let jsonString: String = "{\"a\": \"NaN\",    \"b\": \"+Infinity\",    \"c\": \"-Infinity\" }"
		let jsonData = jsonString.data(using: String.Encoding.utf8)
		let decoder = JSONDecoder()
		
		decoder.nonConformingFloatDecodingStrategy =
			.convertFromString(
				positiveInfinity: "+Infinity",
				negativeInfinity: "-Infinity",
				nan: "NaN")
		
		let numbers = try! decoder.decode(Numbers.self, from: jsonData!)
		dump(numbers)
		
		/* 打印
		 
		 ▿ abcProject.Numbers
		 - a: nan
		 - b: inf
		 - c: -inf
		 
		 */
	}
*/
	
}
