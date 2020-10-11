//
//  PlanView.swift
//  shenZhouApp
//
//  Created by 崔林豪 on 2020/10/8.
//

import SwiftUI

struct PlanView: View {
	
	//正向传值
	let plan: Plan
	
    var body: some View {
		
		GeometryReader{ geometryProxy in
			
			ScrollView(.vertical){
				
				VStack{
					Image(self.plan.imageName)
						.resizable()
						.scaledToFit()
						//geometryProxy.size.width 屏幕的宽
						.frame(maxWidth: geometryProxy.size.width * 0.7)
						
						.padding(.top)
					Text(self.plan.description)
						.padding()
					
					//下面的宇航员
					if self.plan.member != nil {
						ForEach(self.plan.member!, id:\.name){ member in
							// NavigationLink 比button 好，因为会自动有一个返回按钮
							NavigationLink(destination: AstronautView(name: member.name)){
								HStack{
									Image(member.name)
										.resizable()
										.scaledToFill()
										.frame(width:83, height: 83)
										.clipShape(Capsule())
										.overlay(
											//描边
										Capsule()
											.stroke(Color.primary, lineWidth: 1.0)
											
										)
										
									VStack(alignment:.leading){
										Text(member.name)
											.font(.headline)
										Text(member.birth)
											.font(.headline)
											//淡淡的灰色
											.foregroundColor(.secondary)
									}
									
									//水平退出 ，就是左对齐
									Spacer()
								}
								.padding(.horizontal)
								//保持UI 原生的效果
								.buttonStyle(PlainButtonStyle())
							}
						}
					}
					//距离底部的高度
					Spacer(minLength: 25)
					
				}
			}
			
		}
		
		.navigationBarTitle(Text(plan.name), displayMode: .inline)
		
    }
	
}

struct PlanView_Previews: PreviewProvider {
	
	//static 静态的方法里面只能使用静态的属性
	
	static let plans:[Plan] = Bundle.main.decode("plans.json")
	
    static var previews: some View {
		PlanView(plan: plans[6])
    }
}
