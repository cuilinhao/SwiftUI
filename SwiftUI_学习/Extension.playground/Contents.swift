import UIKit

var str = "Hello, playground"

let xx = pow(3, 2)

extension Int{
	func squared() -> Int {
		return self * self
	}
	
	//扩展里面可以使用计算属性 不能使用存储属性
	var isEven: Bool {
		return self % 2 == 0
	}
}


let xxx = 3.squared()
print("结果是\(xxx)")

4.isEven

//2. 协议扩展
let arr = ["语文","数学","英语","语文","数学","英语"]
let s = Set(["小明","小王","小李"])

//Collection （如果是 数组,集合，等同样扩展一个东西的话，就要对遵循的协议进行扩展）
extension Collection {
	func  summarize(){
		print("一共有\(count)个")
		
		for  name in self {
			print(name)
		}
	}
}

arr.summarize()
s.summarize()























