//
//  ExpenseStructModel.swift
//  Expenses
//
//  Created by 崔林豪 on 2020/10/7.
//

import Foundation

//数据model
//对象本身可以被区分，要遵循Identifiable

//Codable 遵守后对象就可以编码 和解码
struct ExpenseItem: Hashable, Identifiable, Codable {
	
	let id = UUID()
	let name:String
	let type: String
	let amount: Int
}

//SwiftUI 数据共享的思想  实现反向传值
//1.公开的 Published 要先定义一个class
//2.ObservableObject 创建 观察对象
//3. contentView中 创建被观察对象

class Expenses: ObservableObject {
	
	//当数据改变时，就会重新刷新主界面
	@Published var allExpenses:[ExpenseItem]{
		//属性观察者
		didSet{
			//编码然后存入userdefault
			if let data = try? JSONEncoder().encode(allExpenses){
				UserDefaults.standard.set(data, forKey: "allExpenses")
			}
		}
	}
	
	//删除和添加都要存储逻辑 所以可以放在 init中
	init() {
		
		/** 注释
		UserDefaults.standard.data(forKey: "allExpenses") 是一个try？类型要解包
		JSONDecoder().decode([ExpenseItem].self, from: data) 也要解包，
		因此，可以一起解包，中间用逗号，然后
		*/
		if let data = UserDefaults.standard.data(forKey: "allExpenses"),
		   //需要解码
		   //** decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)中的type参数，[ExpenseItem].self 就是一个type类型
		   let allExpense = try? JSONDecoder().decode([ExpenseItem].self, from: data){
			self.allExpenses = allExpense
			print("_________xxxxx___")
			
			//如果有数据，直接return
			//如果没数据赋值数据
			return
		}
		
		allExpenses = [
			ExpenseItem(name: "Mac", type: "数码加点", amount: 1200),
			ExpenseItem(name: "课程", type: "学习", amount: 1300)
		]
	}

}

