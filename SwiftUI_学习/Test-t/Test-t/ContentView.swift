//
//  ContentView.swift
//  Test-t
//
//  Created by 天下林子 on 2020/11/16.
//  Copyright © 2020 linhaoCui. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var order = OrderModel()
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Stepper("奶茶数量(10元/杯)：\(order.num)", value: $order.num, in: 1...20)
                }
                
                Section{
                    Toggle(isOn: $order.specialRequest.animation()) {
                        Text("特殊需求")
                    }
                    if order.specialRequest {
                        Toggle(isOn: $order.isAddIce) {
                            Text("是否加冰")
                        }
                        Toggle(isOn: $order.isAddSugar) {
                            Text("是否加糖")
                        }
                    }
                }
                
                Section{
                    NavigationLink(destination: CheckOutView(order: order)) {
                        Text("下一步（选择送货地址）")
                    }
                }
            }
        .navigationBarTitle("奶茶订单")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
