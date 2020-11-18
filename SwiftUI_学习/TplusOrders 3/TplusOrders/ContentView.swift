//
//  ContentView.swift
//  TplusOrders
//
//  Created by 崔林豪 on 2020/11/1.
//

import SwiftUI

struct ContentView: View {
	
	//被观察的对象
	@ObservedObject var order = OrderModel()
	
	
    var body: some View {
		NavigationView {
			Form{
				//有3个section
				Section{
					Stepper("奶茶数量(10元/ 杯):\(order.num)", value: $order.num, in: 1...20)
				}
				
				Section{
					//另外一种写法？
					Toggle(isOn: $order.specialRequest.animation()){
						Text("特殊要求")
					}
					if order.specialRequest {
						Toggle(isOn: $order.isAddIce, label: {
							Text("是否要加冰")
						})
						Toggle(isOn: $order.addSugar, label: {
							Text("是否要加糖")
						})
					}
				}
				
				Section{
					NavigationLink(
						destination: AdressView(order: order)){
						Text("下一步 (选择收货地址)")
					}
				}
				
			}
			.navigationTitle("奶茶订单")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
