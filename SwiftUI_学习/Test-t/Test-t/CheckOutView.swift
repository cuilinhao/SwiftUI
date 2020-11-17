//
//  CheckOutView.swift
//  Tea
//
//  Created by 刘军 on 2020/1/19.
//  Copyright © 2020 Lebus. All rights reserved.
//

import SwiftUI

struct CheckOutView: View {
    
    @ObservedObject var order: OrderModel
    @State private var showAlert = false
    @State private var message = ""
    
    var body: some View {
        VStack{
            Text("合计\(order.num * 10)元")
                .font(.largeTitle)
            Button("下单"){
                self.sendOrder()
            }
            .padding()
        }
        .navigationBarTitle(Text("下单"), displayMode: .inline)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("感谢下单"), message: Text(self.message), dismissButton: .default(Text("朕知道了")))
        }
    }
    
    //给服务器发送数据（POST请求）
    func sendOrder(){
        guard let url = URL(string: "https://reqres.in/api/tea"),
            let data = try? JSONEncoder().encode(order)
            else { return }
        
        //定义一个request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        print("_____11____\(data)")
        
        //带上刚刚的request发送POST请求
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            //若请求成功，则给我们原封不动的返回刚刚发送的数据（json格式）
            guard let data = data else{ return }
            
            //对返回过来的数据进行解码
            guard let decodedData = try? JSONDecoder().decode(Order.self, from: data) else{ return }
            print("_____22____\(decodedData)")
            //把解码后的数据显示在界面上
            let ice = decodedData.isAddIce ? "加冰" : ""
            let sugar = decodedData.isAddSugar ? "加糖" : ""
            
            self.message = """
            服务器已经收到您的订单：
            \(decodedData.num)杯奶茶\(ice)\(sugar)
            送到以下地址：
            \(decodedData.name)
            \(decodedData.address)
            \(decodedData.phone)
            """
            
            self.showAlert = true
            
        }.resume()
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(order: OrderModel())
    }
}

