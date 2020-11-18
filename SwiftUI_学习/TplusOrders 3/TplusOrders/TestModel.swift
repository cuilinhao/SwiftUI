//
//  TestModel.swift
//  TplusOrders
//
//  Created by 崔林豪 on 2020/11/17.
//

import Foundation

class TestModel {
	
	//为了将 JSON 字符串转化为 Beer 类型的实例，我们需要将 Beer 类型标记为 Codable。

	enum BeerStyle: String, Codable {
		case ipa
		case stout
		case kolsch
	}

	struct Beer: Codable {
		let name: String
		let abv: Float
		let brewery: String
		let style: BeerStyle
	}

	/// json 的key与结构体属性不是对应的，需要自定义键值名
	struct Beer2: Codable {
		let name: String
		let abv: Float
		let brewery: String
		let style: BeerStyle

		private enum CodingKeys: String, CodingKey {
			case name
			case abv = "alcohol_by_volume"
			case brewery = "brewery_name"
			case style
		}

		init(from decoder: Decoder) throws {
			let values = try decoder.container(keyedBy: CodingKeys.self)
			name = try values.decode(String.self, forKey: Beer2.CodingKeys.name)
			abv = try values.decode(Float.self, forKey: Beer2.CodingKeys.abv)
			brewery = try values.decode(String.self, forKey: Beer2.CodingKeys.brewery)
			style = try values.decode(BeerStyle.self, forKey: Beer2.CodingKeys.style)
		}
	}

	class Wine: NSObject, Codable {
		var abv: Float?
	}

	class Beer3: Wine {
		var name: String?
		var brewery: String?
		var style: BeerStyle?
	}

	class Beer4: Wine {
		var name: String?
		var brewery: String?
		var style: BeerStyle?

		private enum CodingKeys: String, CodingKey {
			case name
			case abv = "alcohol_by_volume"
			case brewery = "brewery_name"
			case style
		}

		/// 自定义编码
		override func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)

			try container.encode(name, forKey: .name)
			try container.encode(abv, forKey: .abv)
			try container.encode(brewery, forKey: .brewery)
			try container.encode(style, forKey: .style)
		}
		
		/// 自定义解码
		required init(from decoder: Decoder) throws {
			super.init()
			let values = try decoder.container(keyedBy: CodingKeys.self)
			name = try values.decode(String.self, forKey: Beer4.CodingKeys.name)
			abv = try values.decode(Float.self, forKey: Beer4.CodingKeys.abv)
			brewery = try values.decode(String.self, forKey: Beer4.CodingKeys.brewery)
			style = try values.decode(BeerStyle.self, forKey: Beer4.CodingKeys.style)
		}
	}

	/// 时间格式处理
	struct Foo: Encodable {
		let date: Date
	}

	/// 浮点类型处理
	struct Numbers: Decodable {
		let a: Float
		let b: Float
		let c: Float
	}
}
