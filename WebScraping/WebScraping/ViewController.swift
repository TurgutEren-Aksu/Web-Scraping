//
//  ViewController.swift
//  WebScraping
//
//  Created by Turgut Eren Aksu on 28.09.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
                       print(headings) // Başlıkları konsolda göster
                       
                       // UI güncellemelerini ana thread'de yap
                       DispatchQueue.main.async {
                          
                       }
                   } catch {
                       print("Error decoding JSON: \(error)")
                   }
               }
           
           task.resume()
       }


}

