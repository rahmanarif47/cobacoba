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
}


struct MathpixManager {
    
    // MARK: - Constants
    let mathpixURL = "//api.mathpix.com/v3/text"
    
    // MARK: - Variabel and properties
    var delegate : MathpixManagerDelegate?
    
    func fetchMathpixOcr(text : String) {
        let urlString = "\(mathpixURL)"
        
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let mathpix = self.parseJSON(safeData){
                        //self.delegate?.didUpdateMathpix(mathpixManager: self, mathpix: mathpix)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ mathpixData: Data) -> MathpixModel?{
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(MathpixData.self, from: mathpixData)
            let text = decodeData.text.debugDescription
            let data = decodeData.data[0].value
            
            let mathpix = MathpixModel()
            
            return mathpix
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
