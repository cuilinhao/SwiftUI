//
//  AddView.swift
//  Expenses
//
//  Created by 崔林豪 on 2020/10/7.
//

import SwiftUI

struct AddView: View {
	
	@State private var name = ""
	@State private var type = 0
	@State private var amount = ""
	
	
	//属性包装器 Environment 利用keyPath 取出系统中的东西
	//presentationMode 是系统帮我们管理的
	
	@Environment(\.presentationMode) var presentationMode
	
	//标注一个类型 
	@ObservedObject var expenses: Expenses
	
	
	//静态属性 比较节省资源
	// 静态属性调用 要用大写的Self 此时的Self就代表Addview这个结构体，如果是类，代表就是类
	
	static let types = ["生活日用","数码加点","服饰","iOS学习"]
	
    var body: some View {
		NavigationView{
			Form{
				
				TextField("支出名", text: $name)
				Picker("种类", selection: $type) {
					/**
					//ForEach 也可以这样写
					ForEach(types.indices, id:\.self){index in
						Text(self.types[index])
					}
					*/
					ForEach(Self.types.indices, id:\.self){
						Text(Self.types[$0])
						
					}
				}
				TextField("花费", text: $amount)
					.keyboardType(.numberPad)
			}
			.navigationTitle("添加支出")
			.navigationBarItems(trailing: Button("保存"){
				
				//找到数组，
				self.expenses.allExpenses.append(
					ExpenseItem(
						name: self.name,
						type: Self.types[self.type],
						amount: Int(self.amount)!
					)
				)
				
				//这一部分在 model 中init方法实现
				//if let data = try?f JSONEncoder().encode(self.expenses.allExpenses){
					//UserDefaults.standard.set(data, forKey: "allExpenses")
				//}
				//包装好的值进行dismiss
				self.presentationMode.wrappedValue.dismiss()
				
			})
		}
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
		//只是为了展示使用
        AddView(expenses: Expenses())
    }
}
