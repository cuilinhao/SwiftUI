//
//  PlanModle.swift
//  shenZhouApp
//
//  Created by 崔林豪 on 2020/10/8.
//

import Foundation

/** 注释
"id": 1,
"name":"神舟一号",
"launchDate":"1999年11月20日",
"description":"首次测试飞行，成功实现天地往返。",
"hasBadge":false

"member":[
	{
		"name":"杨利伟",
		"birth":"1965年6月21日"
	}
],

*/
struct Plan: Codable, Identifiable {
	
	struct Member: Codable {
		let name: String
		let birth:String
	}
	
	let id: Int
	let name: String
	let launchDate: String
	let description: String
	let hasBadge: Bool
	let member: [Member]?//可有可无 加问号
	
	//计算属性
	//因为 imageName 要根据 其他属性做特殊处理，所以 imageName 定义为计算属性
	var imageName: String{

		return	hasBadge ? "shenzhou\(id)" : "placeholder"
	}
	
	
}
