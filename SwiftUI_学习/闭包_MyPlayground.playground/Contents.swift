import UIKit

var str = "Hello, playground"

//closure -  闭包/回调函数
let a: Int = 9

let learniOS = {
	print("学习iOS")
}

learniOS()

let learn = {(lan: String) in
	print("学习\(lan)")
}

learn("iOS")

let learn1  = {(lan: String) -> String in
	"学习\(lan)"
}

let res = learn1("iOS")
print(res)

//作为另外一个函数的参数
func findWork(how: ()-> Void){
	print("准备找工作")
	how()
	print("找到工作了")
}

findWork(how: learniOS)

//trailing closure syntax --尾随闭包 如果闭包是最后一个参数
findWork {
	print("跟lean 学习 swift")
}

func findWork2(a: Int, how: (String) -> Void) {
	
	print("准备找工作2")
	how("iOS")
	print("找到工作了2")
}

findWork2(a: a, how: learn)

//尾随闭包还有别的参数
//后面 (lan) in 是一个尾随闭包
findWork2(a: a) { (lan) in
	print("学习\(lan)")
}

//$0, $1..
findWork2(a: a) { (lan) in
	print("还是学习\(lan)")
}

//可以写成
findWork2(a: a) {
	print("还是学习\($0)")
}

//闭包作为函数的返回值
//闭包就是函数类型
func findWork3() -> (String) -> Void {
	//要return (String) -> Void 一个闭包
//	return { str in
//		print(" 还是还是在学习\(str)")
//	}
	
	return {
		print(" 还是还是在学习\($0)")
	}
}

let res2 = findWork3()

res2("iOS")

//闭包捕获
func findWork4() -> (String) -> Void {
	var counter = 1
	
	return {
		print("不要问， 在学习\($0) + \(counter)")
		counter += 1
	}
}

//调用外层函数，res3 是一个闭包
let res3 = findWork4()
res3("iOS")
res3("iOS")
res3("iOS")
res3("iOS")















