//
//  ViewController+Ext.swift
//  FilmTableView
//
//  Created by Никита Коголенок on 17.03.22.
//

import UIKit
import SafariServices

extension ViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    // Methods for TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier,
                                                       for: indexPath) as? MovieTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(with: movies[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let url = "https://www.imdb.com/title/\(movies[indexPath.row].imdbID)/"
        guard let urlString = URL(string: url) else { return }
        let vc =  SFSafariViewController(url: urlString)
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    // Methods for TextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchMovies()
        
        return true
    }
    
    
}
