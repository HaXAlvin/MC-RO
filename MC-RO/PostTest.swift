//
//  HttpClass.swift
//  MC-RO
//
//  Created by 薛竣祐 on 2020/7/24.
//  Copyright © 2020 薛竣祐. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


struct ServerMessage: Decodable {
    let success:Bool
    let message: String
    let data:[String:String]
}
func saveBase64StringToMP3(_ base64String: String)->URL {

    guard
        let documentsURL = (FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)).last,
        let convertedData = Data(base64Encoded: base64String)
    else {
        //handle error when getting documents URL
        print("url or b64encode error")
        return  saveBase64StringToMP3(base64String)
    }
    
//    documentsURL.appendPathComponent("audioFile.mp3")

    do {
        try convertedData.write(to: documentsURL.appendingPathComponent("audioFile.m4a"))
    } catch {
        //handle write error here
    }
    print(documentsURL)
    return documentsURL
}
class HttpClass: ObservableObject {

    @Published var uiImage:UIImage = UIImage(systemName: "heart")!
    @Published var fileURL:URL = (FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)).last!
    func postLink(link:String) {
        guard let url = URL(string: "http://127.0.0.1:5000") else { return }
        let body: [String: String] = ["link":link]

        let finalBody = try! JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            
            print(123333)
//            print(data)
            let resData = try! JSONDecoder().decode(ServerMessage.self, from: data)
            print(444444)
//            print(resData.success)
//            print(resData.self)
            if resData.success == true {
                DispatchQueue.main.async {
                    let base64img = NSData(base64Encoded: resData.data["img"]!, options: NSData.Base64DecodingOptions(rawValue: 0))
                    self.uiImage = UIImage(data: base64img! as Data)!
                    self.fileURL = saveBase64StringToMP3(resData.data["song"]!)
                }
                
            }
        }.resume()
    }
    
}

struct PostTest: View {
    @ObservedObject var manager = HttpClass()
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(paths)
        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    var body: some View {
        
        VStack {
            Button(action: {
                self.manager.postLink(link: "https://www.youtube.com/watch?v=TBkybgllGRA")
                _ = RecordingRow(audioURL: self.manager.fileURL)
            }) {
                VStack{
                    Image(uiImage:manager.uiImage)
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .scaledToFill()
                    Text("Login")
                    
                }
                .accentColor(Color.white)
                .padding(.vertical, 10)
                .background(Color.red)
                .cornerRadius(5)
                .padding(.horizontal, 40)

            }.buttonStyle(PlainButtonStyle())
            
        }
    }
}

struct PostTest_Previews: PreviewProvider {
    static var previews: some View {
        PostTest()
    }
}
