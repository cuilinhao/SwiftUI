//
//  childView.swift
//  ViewsAndModelFilers
//
//  Created by 崔林豪 on 2020/10/5.
//

import SwiftUI

struct childView: View {
    var body: some View {
        
		VStack(alignment: .center, spacing: 10){
//			Text("子视图1")
//				.font(.largeTitle)
//				.padding()
//				.foregroundColor(.blue)
//				.background(Color.yellow)
//				.clipShape(Capsule())
			
//			Text("子视图2")
//				.font(.largeTitle)
//				.padding()
//				.foregroundColor(.orange)
//				.background(Color.blue)
//				.clipShape(Capsule())
			
			//传入的参数 是CapsuleText中的一个属性
			CapsuleText(text: "子视图1")
				//foregroundColor 是前景色，就是字体颜色
				.foregroundColor(.blue)
			CapsuleText(text: "子视图21")
				.foregroundColor(.red)
		}
    }
}

//MARK: #pragma mark - 子视图
struct CapsuleText: View {
	
	let text: String
	
	var body: some View {
		
//		VStack(alignment: .center, spacing: 10){
//
//		}
		Text(text)
			.font(.largeTitle)
			.padding()
			
			.background(Color.yellow)
			.clipShape(Capsule())
		
	}
	
}


struct childView_Previews: PreviewProvider {
    static var previews: some View {
        childView()
    }
}
