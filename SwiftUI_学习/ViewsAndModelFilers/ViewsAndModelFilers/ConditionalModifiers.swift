//
//  ConditionalModifiers.swift
//  ViewsAndModelFilers
//
//  Created by 崔林豪 on 2020/10/5.
//

import SwiftUI

struct ConditionalModifiers: View {
	
	@State private var changeColor = false
	
    var body: some View {
        
		/*
		Button("hello World"){
			//toggle 就是真假值之间来回切换
			self.changeColor.toggle()
		}
		.frame(width: 200, height: 200, alignment: .center)
		.background(changeColor ? Color.green : Color.yellow)
    */
		
		/**
		Function declares an opaque return type, but the return statements in its body do not have matching underlying types
		if 和else中返回不同的view就会报错
		if changeColor {
			return Text("xxx")
		}else{
			return Text("YYY").background(Color.red)
		}
		
		*/
		
		//VStack 竖方向 一般手机是这样的
		//if else 一般写在VStack内层
		VStack{
			if changeColor {
				 Text("xxx")
			}else{
				 Text("YYY").background(Color.red)
			}
		}
		
		
    }
}

struct ConditionalModifiers_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalModifiers()
    }
}
