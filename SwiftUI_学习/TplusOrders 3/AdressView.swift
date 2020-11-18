//
//  AdressView.swift
//  TplusOrders
//
//  Created by 崔林豪 on 2020/11/1.
//

import SwiftUI

struct AdressView: View {
	
	@ObservedObject var order:OrderModel
	
	
    var body: some View {
		Form{
			Section{
				TextField("性名", text:$order.name)
				TextField("地址", text: $order.adress)
				TextField("电话", text: $order.phone)
					.keyboardType(.numberPad)
			}
			
			Section{
				NavigationLink(
					destination: CheckOutView(order: order)){
					Text("确认订单")
				}
				.disabled(order.hasInValidAdress)
			}
		}
		.navigationBarTitle(Text("送达地址"), displayMode: .inline)
    }
	
}

struct AdressView_Previews: PreviewProvider {
    static var previews: some View {
        AdressView(order: OrderModel())
    }
}
