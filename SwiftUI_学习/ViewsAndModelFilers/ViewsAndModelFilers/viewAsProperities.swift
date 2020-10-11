//
//  viewAsProperities.swift
//  ViewsAndModelFilers
//
//  Created by 崔林豪 on 2020/10/5.
//

import SwiftUI

struct viewAsProperities: View {
	
	//变量可以是一个view 然后再body中循环使用
	let x = Text("xxx")
	let y = Text("yyy")
	
	@State private var zz = "zz"
	/*
	* let z = TextField("z", text: $zz) 报错，不能引用同一层级的属性， 如果想要就要用计算属性
	*/
	//计算属性 z 且是一个some view类型 就可以使用同一层级的zz
	var z : some View{
		TextField("z", text: $zz)
	}
	
	
    var body: some View {
		
		VStack{
			x
				.foregroundColor(.blue)
				.font(.largeTitle)
			y
				.foregroundColor(.green)
				.font(.largeTitle)
			z
				.foregroundColor(.blue)
				.font(.largeTitle)
		}
    }
}

struct viewAsProperities_Previews: PreviewProvider {
    static var previews: some View {
        viewAsProperities()
    }
}
