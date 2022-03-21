//
//  ViewController.swift
//  FilmTableView
//
//  Created by Никита Коголенок on 17.03.22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    var movies = [Movie]()
    
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatDelegate()
        searchMovies()
    }
    
    // MARK: - Methods
    func creatDelegate() {
        tableView.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
    }
    
    func searchMovies() {
        textField.resignFirstResponder()
        
        guard let text = textField.text,
              !text.isEmpty
        else { return }
        
        let query = text.replacingOccurrences(of: " ", with: "%20")
        let url = URL(string: "https://www.omdbapi.com/?apikey=3aea79ac&s=\(query)&type=movie")
        guard let urlString = url else { return }

        movies.removeAll()
        
        URLSession.shared.dataTask(with: urlString,
                                   completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            // Convert
            var result: MovieResult?
            do {
                result = try JSONDecoder().decode(MovieResult.self, from: data)
            }
            catch {
                print("error")
            }
            
            guard let finalResult = result else {
                return
            }
            
            // Update our movies array
            let newMovies = finalResult.Search
            self.movies.append(contentsOf: newMovies)
            
            // Refresh our table
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }).resume()
    }
}


