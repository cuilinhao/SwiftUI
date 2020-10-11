//
//  customeModelFilers.swift
//  ViewsAndModelFilers
//
//  Created by 崔林豪 on 2020/10/5.
//

//*********自定义 视图 修饰符***********
import SwiftUI

struct customeModelFilers: View {
    var body: some View {
		
		//要使用扩展中的两个属性，就要用Vstack
		VStack{
			Text("Hello, World!")
				//.modifier(Title())
				.titleStyle()
				
			Color.blue
				.frame(width: 200, height: 200, alignment: .center)
				
				.waterMark("linlin")
		}
        
    }
}

//自定义修饰符1 - 大标题
struct Title: ViewModifier {
	
	func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(.white)
			.padding()
			.background(Color.green)
			.clipShape(RoundedRectangle(cornerRadius: 25.0))
	}
	
//	func body(content: Content) -> some View {
//
//	}
}

//自定义修饰符 -- 水印
struct  Watermark: ViewModifier {
	
	let text: String
	
	func body(content: Content) -> some View{
		
		ZStack(alignment:.bottomTrailing){
			content
			Text(text)
				.padding(5)
				.font(.caption2)
				.foregroundColor(.white)
				.background(Color.green)
		}
	}
}



//扩展view - 让修饰符写法更简单
extension View{
	
	func titleStyle() -> some View{
		self.modifier(Title())
	}
	
	func waterMark(_ text: String) -> some View{
		
		self.modifier(Watermark(text: text))
	}
}

struct customeModelFilers_Previews: PreviewProvider {
    static var previews: some View {
        customeModelFilers()
    }
}
