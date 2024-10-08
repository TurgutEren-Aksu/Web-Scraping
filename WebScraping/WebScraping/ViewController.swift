//
//  ViewController.swift
//  WebScraping
//
//  Created by Turgut Eren Aksu on 28.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    func fetchData(){
           guard let url = URL(string: "http://127.0.0.1:5000/data") else { return }
           let task = URLSession.shared.dataTask(with: url) { data, response, error in
                   if let error = error {
                       print("Error fetching data: \(error)")
                       return
                   }
                   guard let data = data else { return }
                   
                   do {
                       // JSON verisini parse et
                       let headings = try JSONDecoder().decode([String].self, from: data)
                       print(headings)
                       
                       
                       DispatchQueue.main.async {
                           self.labelText.text = headings.first
                       }
                   } catch {
                       print("Error decoding JSON: \(error)")
                   }
               }
           
           task.resume()
       }


}

