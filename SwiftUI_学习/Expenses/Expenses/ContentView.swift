//
//  ContentView.swift
//  Expenses
//
//  Created by 崔林豪 on 2020/10/7.
//

//SwiftUI 数据共享的思想

import SwiftUI

struct ContentView: View {
	
	//let expense = ["x","y","z"]
//	let expense = [
//	ExpenseItem(name: "MacBook", type: "数码加点", amount: 1200),
//	ExpenseItem(name: "mabkk", type: "学习", amount: 384)
//	]
	
	@State private var showSheet = false
	
	//创建被观察对象
	@ObservedObject var expense = Expenses()
	
	
    var body: some View {
		
		NavigationView{
			//List 自带forEach 且默认是水平布局的
			//expense 已经遵循identiable, 且有一个id
			//List 循环，系统要求有一个id，一般可以再model中自己写一个id来解决这个问题
			List{
				
				ForEach(expense.allExpenses){ expense in
					
					HStack{//水平布局
						VStack{//竖直布局
							//加粗 headline
							Text(expense.name).font(.headline)
							Text(expense.type)
						}
						
						Spacer()
						Text("\(expense.amount)")
					}
					
				}
				//删除
				//.onDelete { (indexSet) in
					//self.expense.allExpenses.remove(atOffsets: indexSet)
				//}
				
				//perform后面是闭包 （闭包就是函数）
				.onDelete(perform: remove)
	      }
			.navigationTitle("费用支出")
			.navigationBarItems(trailing:
									
			Button(action: {
				self.showSheet  = true
			}){
				Image(systemName: "plus")
			})
			
			.sheet(isPresented: $showSheet, content: {
				//Text("expensex")
				//正向传值，传到下个页面，下个页面改变了，contentview 页面就会刷新
				AddView(expenses: self.expense)
			})
		}
    }
	
	func remove(indexSet: IndexSet){
		//系统会帮我们刷新 expense
		expense.allExpenses.remove(atOffsets: indexSet)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
