//
//  AboutModifiersOrder.swift
//  ViewsAndModelFilers
//
//  Created by 崔林豪 on 2020/10/5.
//

import SwiftUI

struct AboutModifiersOrder: View {
    var body: some View {
        Text("Hello, World!")
			//background 和 frame 顺序不同 ui显示的也不一样
			.background(Color.green)
			.frame(width: 200, height: 200, alignment: .center)
	
		Text("Hello, World!")
			//background 和 frame 顺序不同 ui显示的也不一样
			.frame(width: 200, height: 200, alignment: .center)
			.background(Color.green)
	
		//总结：
		Text("Hello world")
			//在下面的颜色会框柱上面的颜色
			//padding 会使颜色变大
			.padding()
			.background(Color.orange)
			.padding()
			.background(Color.purple)
			.padding()
			.background(Color.red)
		
    }
}

struct AboutModifiersOrder_Previews: PreviewProvider {
    static var previews: some View {
        AboutModifiersOrder()
    }
}
