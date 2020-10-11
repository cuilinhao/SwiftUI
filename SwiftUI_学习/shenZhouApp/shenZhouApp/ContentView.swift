//
//  ContentView.swift
//  shenZhouApp
//
//  Created by 崔林豪 on 2020/10/8.
//

import SwiftUI

struct ContentView: View {
	
	/***
	将数据获取放到扩展中
	
	=========
	//报错Cannot convert value of type '() -> _' to specified type '[Plan]'
	//因为是 {}闭包是一个函数类型，不是数组类型
	//想变成数组，直接调用闭包,后面加()即可{}()
	let plans:[Plan] = {
		//获取数据
		guard let url = Bundle.main.url(forResource: "plans", withExtension: "json"),
		 let data = try? Data(contentsOf: url),
		 let plans = try? JSONDecoder().decode([Plan].self, from: data) else {
			return [Plan]()
		}
		return plans
	}()
	
	**/
	
	let plans: [Plan] = Bundle.main.decode("plans.json")
	
    var body: some View {
		//报错：Thread 1: Fatal error: Index out of range
		//因为plans提前渲染，是空数组，解决方法：plans用闭包
		Text(plans[0].name)
		
		NavigationView{
			List(plans){ plan in
				//cell 是有箭头的，所以 用NavigationLink
				NavigationLink(destination: PlanView(plan: plan)) {
					//resizable 图片都会处理
					Image(plan.imageName)
						.resizable()
						.scaledToFit()
						.frame(width:44, height:44)
					
					VStack(alignment: .leading){
						Text(plan.name).font(.headline)
						Text(plan.launchDate)

					}
				}
			}
			.navigationBarTitle("神州任务")
		}
		
    }
	
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
