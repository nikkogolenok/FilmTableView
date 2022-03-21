//
//  MovieTableViewCell.swift
//  FilmTableView
//
//  Created by Никита Коголенок on 17.03.22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Variable
    static let identifier = "MovieTableViewCell"
    
    // MARK: - Outlet
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Methods
    static func nib() -> UINib {
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }
    
    func configure(with model: Movie) {
        self.movieTitleLabel.text = model.Title
        self.movieYearLabel.text = model.Year
        let url = model.Poster
        guard let urlString = URL(string: url) else { return }
        if let data = try? Data(contentsOf: urlString) {
            self.moviePosterImageView.image = UIImage(data: data)
        }
    }
    
}
