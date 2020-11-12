//
//  MathpixManager.swift
//  ReadingView
//
//  Created by Arif Rahman Sidik on 10/11/20.
//

import Foundation

protocol MathpixManagerDelegate {
    func didUpdateMathpix( mathpixManager : MathpixManager, mathpix: MathpixData)
    
    func didFailWithError(error: Error)
    
    func getResponse()
}


struct MathpixManager {
    private static var appId : String?
    private static var appKey : String?
    
    // MARK: - Constants
    let mathpixURL = "//api.mathpix.com/v3/text"
    
    // MARK: - Variabel and properties
    var delegate : MathpixManagerDelegate?
    
    func fetchMathpixOcr(text : String) {
        let urlString = "\(mathpixURL)"
        
    }
    
    public static func setAPIKeys(appId: String, appKey: String) {
        MathpixManager.appId = "alhanancms_gmail_com_693836"
        MathpixManager.appKey = "7ad85bbd3665a9fc42fe"
    }
    
//    func performRequest(with urlString: String) {
//        if let url = URL(string: urlString) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error != nil {
//                    self.delegate?.didFailWithError(error: error!)
//                    return
//                }
//
//                if let safeData = data {
//                    if let mathpix = self.parseJSON(safeData){
//                        //self.delegate?.didUpdateMathpix(mathpixManager: self, mathpix: mathpix)
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
    
//    func parseJSON(_ mathpixData: Data) -> MathpixModel?{
//        let decoder = JSONDecoder()
//        do {
//            let decodeData = try decoder.decode(MathpixData.self, from: mathpixData)
//            let text = decodeData.text.debugDescription
//            let data = decodeData.data[0].value
//
//            //let mathpix = MathpixModel()
//
//            return mathpix
//        } catch {
//            delegate?.didFailWithError(error: error)
//            return nil
//        }
//    }
}
