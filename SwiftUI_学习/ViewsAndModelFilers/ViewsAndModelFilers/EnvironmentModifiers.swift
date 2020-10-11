//
//  EnvironmentModifiers.swift
//  ViewsAndModelFilers
//
//  Created by 崔林豪 on 2020/10/5.
//

import SwiftUI

struct EnvironmentModifiers: View {
    var body: some View {
        
		VStack{
			Text("xxx")
				//caption 标题
				.font(.caption)
			Text("yyy")
			Text("zzz")
		}
		
		.font(.largeTitle)
		//blur 常规修饰符 都会变化 在text下面写了，还是模糊
		//还有的是环境修饰符font 可以改变大小（改变整体的）
		.blur(radius: 3.0)
		
    }
}

struct EnvironmentModifiers_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentModifiers()
    }
}
