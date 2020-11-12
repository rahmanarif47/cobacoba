//
//  MathpixRequest.swift
//  ReadingView
//
//  Created by Arif Rahman Sidik on 12/11/20.
//

import Foundation

class MathpixRequest {
    private static let session = URLSession.shared
    
    static func post(urlString: String, image: String, completion: @escaping (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()){
        var request = getURLRequestByURLString(urlString: urlString)
        request.httpMethod = "POST"
        request.setValue("alhanancms_gmail_com_693836_725533", forHTTPHeaderField: "app_id")
        request.setValue("3859edc25e05accfae43", forHTTPHeaderField: "app_key")
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let postString = "{\"src\":\"data:image/jpeg;base64,\(image)\"}"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        let task = session.dataTask(with: request) { data, response, error in
            guard data == nil else {
                completion(data, response, error)
                return
            }
            if let data = data, let utf8Representation = String(data: data, encoding: .utf8) {
                print("response: ", utf8Representation)
            } else {
                print("no readable data received in response")
            }
            
        }
        task.resume()
    }
    
    private static func getURLRequestByURLString(urlString: String) -> URLRequest {
        return URLRequest(url: URL(string: urlString)!)
    }
}
