//
//  bundle-Decodable.swift
//  shenZhouApp
//
//  Created by 崔林豪 on 2020/10/8.
//

import Foundation


//extension Bundle {
//
//	func decode() -> [Plan]{
//		//获取数据
//		guard let url = Bundle.main.url(forResource: "plans", withExtension: "json"),
//		 let data = try? Data(contentsOf: url),
//		 let plans = try? JSONDecoder().decode([Plan].self, from: data) else {
//			 fatalError("没有获取到数据")
//		}
//		return plans
//	}
//}

extension Bundle {
	//参数 file: String 是给取json文件来用的 外部参数 _ file: String
	//使用泛型
	//Instance method 'decode(_:from:)' requires that 'T' conform to 'Decodable' 报错： 泛型要遵守Codable
	
	func decode<T: Codable>(_ file: String) -> T{
		//获取数据
		guard let url = Bundle.main.url(forResource: file, withExtension: nil),
		 let data = try? Data(contentsOf: url),
		 let loadDatas = try? JSONDecoder().decode(T.self, from: data) else {
			 fatalError("没有获取到数据")
		}
		return loadDatas
	}
}

