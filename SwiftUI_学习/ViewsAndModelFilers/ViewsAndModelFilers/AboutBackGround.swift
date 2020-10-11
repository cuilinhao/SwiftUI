//
//  AboutBackGround.swift
//  ViewsAndModelFilers
//
//  Created by 崔林豪 on 2020/10/5.
//

import SwiftUI

struct AboutBackGround: View {
    var body: some View {
        Text("Hello, World!")
			//infinity 无限大，充满整个屏幕
			.frame(maxWidth: .infinity,maxHeight: .infinity)
			.background(Color.green)
			//充满全屏幕
			.edgesIgnoringSafeArea(.all)
		
    }
	
}

struct AboutBackGround_Previews: PreviewProvider {
    static var previews: some View {
        AboutBackGround()
    }
}
