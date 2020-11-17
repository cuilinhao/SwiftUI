//
//  AstronautView.swift
//  shenZhouApp
//
//  Created by 崔林豪 on 2020/10/8.
//

import SwiftUI

struct AstronautView: View {
	
	let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
	
	let name: String
	
	//通过name找到宇航员，然后 再找到对应信息
	//定义计算属性
	var astronaut: Astronaut {
		//在astronauts 数组中找到 name first { where 会循环astronauts 把数组里面的东西拿出来
		
		//Value of optional type 'Astronaut?' must be unwrapped to a value of type 'Astronaut' 不解包报错
		self.astronauts.first(where: { $0.name == self.name})!
	}
	
    var body: some View {
		//Text(astronauts[0].name)
       // environment(WritableKeyPath<EnvironmentValues, V>, <#T##value: V##V#>)
		GeometryReader{ geometry in
			
			ScrollView{
				VStack{
					Image(self.astronaut.name)
						.resizable()
						.scaledToFit()
						.frame(maxWidth: geometry.size.width)
						.padding(.top)
					
					Text(astronaut.description)
						.padding()
				}
			}
			
		}
		.navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static var previews: some View {
		AstronautView(name: "")
    }
}
