//
//  GetAPIData.swift
//  TplusOrders
//
//  Created by 崔林豪 on 2020/11/1.
//

import SwiftUI

//网络数据要DeCode

struct Response: Codable {
	struct Result: Codable {
		let trackId: Int
		let collectionName: String
		let trackName: String
	}
	
	let results: [Result]
}

struct GetAPIData: View {
	
	@State private var results: [Response.Result] = []
	
    var body: some View {
		
		List(results, id: \.trackId){ result in
			VStack(alignment:.leading){
				Text(result.trackName)
				Text(result.collectionName)
			}
		}
		
		.onAppear(perform: loadData)
    }
	
	func loadData(){
		
		guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")
		else {
			return
		}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard let data = data,
				  ////解码
				  let decodeData = try? JSONDecoder().decode(Response.self, from: data) else { return }
			
			DispatchQueue.main.async {
				// 这里是赋值，蛋底层就是更新UI
				self.results = decodeData.results
			}
		}.resume()
		
	}
	
}

struct GetAPIData_Previews: PreviewProvider {
    static var previews: some View {
        GetAPIData()
    }
}
