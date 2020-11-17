//
//  OrderModel.swift
//  TplusOrders
//
//  Created by 崔林豪 on 2020/11/1.
//

import Foundation

//数据放松给服务器 要编码，
/** 注释

class OrderModel: Codable{

}
报错：
Type 'OrderModel' does not conform to protocol 'Decodable'
Type 'OrderModel' does not conform to protocol 'Encodable'

原因： @Published 也是属性包装器
如果是数组或者字典，内部会处理自动遵守Codable ，但是Publishe内部没有处理，没有遵守Codable

*/
/** 要整个类要遵循Codable 则要实现编码和解码 */
//class OrderModel: Codable, ObservableObject{
//
//    //1.规定那些属性可以进行编码和解码
//    enum CodingKeys: CodingKey {
//        case num, isAddIce, addSugar, name, phone, adress
//    }
//
//    //2. 实现解码功能 要取出来
//    //取值的时候会先走 required init 方法
//    required init(from decoder: Decoder) throws {
//        //throws 会自己 throws
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        num = try container.decode(Int.self, forKey: .num)
//        isAddIce = try container.decode(Bool.self, forKey: .isAddIce)
//        addSugar = try container.decode(Bool.self, forKey: .addSugar)
//        name = try container.decode(String.self, forKey: .name)
//        phone = try container.decode(String.self, forKey: .phone)
//        adress = try container.decode(String.self, forKey: .adress)
//    }
//
//    //3.编码功能
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(num, forKey: .num)
//        try container.encode(isAddIce, forKey: .isAddIce)
//        try container.encode(addSugar, forKey: .addSugar)
//        try container.encode(name, forKey: .name)
//        try container.encode(adress, forKey: .adress)
//    }
//
//
//    init() {
//    }
//    //Published 会自己去刷新UI
//
//    @Published var num = 1
//    @Published var isAddIce = false
//    @Published var addSugar = false
//
//    @Published var name = ""
//    @Published var phone = ""
//    @Published var adress = ""
//
//    @Published var specialRequest = false {
//        didSet{
//            if !specialRequest {
//                isAddIce = false
//                addSugar = false
//            }
//        }
//    }
//
//    var hasInValidAdress: Bool{
//        name.isEmpty || adress.isEmpty || phone.isEmpty
//    }
//
//}

class OrderModel: Codable, ObservableObject{
    
    //1.规定哪些属性需要被编码和解码
    enum CodingKeys: CodingKey {
        case num, isAddIce, isAddSugar, name, phone, address
    }
    
    //2.自定义解码功能
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        num = try container.decode(Int.self, forKey: .num)
        isAddIce = try container.decode(Bool.self, forKey: .isAddIce)
        isAddSugar = try container.decode(Bool.self, forKey: .isAddSugar)
        name = try container.decode(String.self, forKey: .name)
        phone = try container.decode(String.self, forKey: .phone)
        address = try container.decode(String.self, forKey: .address)
    }
    
    //3.自定义编码功能
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(num, forKey: .num)
        try container.encode(isAddIce, forKey: .isAddIce)
        try container.encode(isAddSugar, forKey: .isAddSugar)
        try container.encode(name, forKey: .name)
        try container.encode(phone, forKey: .phone)
        try container.encode(address, forKey: .address)
    }
    
    
    init(){}
    
    @Published var num = 1
    @Published var isAddIce = false
    @Published var isAddSugar = false
    
    @Published var name = ""
    @Published var phone = ""
    @Published var address = ""
    
    @Published var specialRequest = false{
        didSet{
            if !specialRequest{
                isAddIce = false
                isAddSugar = false
            }
        }
    }
    
    var hasInvalidAddress: Bool{
        name.isEmpty || phone.isEmpty || address.isEmpty
    }
}
