import UIKit
import SwiftUI


//Genric 泛型 - 占位符
// max 可以对整数，字符串，浮点数都可以比较，就是泛型
max(1, 2)

//protocol Comparable
//
func max<T>(_ x: T, _ y: T) -> T where T : Comparable{
	return y >= x ? y:x
}


//View 不能作为一个返回类型，是一个关联类型
public protocol View {

	/// The type of view representing the body of this view.
	///
	/// When you create a custom view, Swift infers this type from your
	/// implementation of the required `body` property.
	
	//associatedtype(关联) 定义一个类型，这个类型遵循 body
	
	associatedtype Body : View

	/// The content and behavior of the view.
	
	//body 是一个计算类型
	//协议是不能实例化的，大写的Self 来表示协议
	//body 是View类型
	
	@ViewBuilder var body: Self.Body { get }
}

/** 注释
Protocol 'View' can only be used as a generic constraint because it has Self or associated type requirements
//协议“视图”只能用作通用约束，因为它有Self或相关的类型需求

报错， 因为如果一个协议里面有associatedtype 和Self(Self就是view本身) 那么这个协议就不能作为一个返回类型，只能做一个类型约束，类型约束只能作为一个泛型来使用

func createView() ->View{
	
}
*/

//下面这两种写法式一样的
//<T: View> 这样写 就等同于 where T : Comparable 这样 遵守某个协议
func createView<T>() ->T where T : View {

	let ss  = Text("aa")
	return ss as! T
}



func createView2<T : View>() -> T {
	
	let ss  = Text("aa")
	return ss as! T
}

//struct HomePage: View {
//	var body: View {
//		Text("我是主页")
//	}
//}

//struct HomePage: View {
//	var body: Text {
//		Text("我是主页")
//	}
//}

// some 是  Opaque return type 不透明返回类型
//some 既能保证view 协议有associate 也能保证返回不一样的类型

struct HomePage: View {

	var body: some View{
		//返回必须是单一的，或者是 text 或者是 button
		//下面这样写不行
		let dd = 2
		if dd >= 0 {
			Text("我是首页")
		}else{
			Button(action: {}, label: {
				Text("点我")
			})
		}
	}
}




//some 也叫 反向泛型 意思就是，定义的时候知道什么类型，但是实现的时候，不知道

//**************

//some的好处：
//在保证 associatedtype protocol 的功能的前提下，使用 some 可以不用写具体返回哪种view。
//简化了书写难度，让声明不同 View 的语法上更加统一。


//some和泛型的关系：
//是一种反向泛型
//泛型-写函数时不知道什么类型，调用时知道；
//不透明返回类型-定义协议时知道什么类型（View），实现协议时不知道（只知道是某个some）
















