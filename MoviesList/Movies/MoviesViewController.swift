//
//  ViewController.swift
//  MoviesList
//
//  Created by Daniel Yamrak on 15.06.2021.
//

import UIKit

class MoviesViewController: UIViewController {
    
    private let movieCellNibName = "MovieCollectionViewCell"
    private let movieCellIdn = "MovieCollectionViewCell"
    
    private let baseUrl = "https://api.themoviedb.org/3/movie/popular?api_key="
    private let apiKey = "02c993458c7380c40c21e2e8bb7069a8"
    var stringUrl: String {
        return baseUrl + apiKey
    }
    
    let strUrl = "https://jsonplaceholder.typicode.com/users/1/todos"

    @IBOutlet weak var collectionView: UICollectionView? {
        didSet {
            collectionView?.delegate = self
            collectionView?.dataSource = self
        }
    }
    
    var movies = ["One", "Two", "Three"]
//    var tests = [Test]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        
        let session = URLSession.shared
        guard let url = URL(string: strUrl) else {
            return
        }
        let task = session.dataTask(with: url) { data, response, error in
            let test = try? JSONDecoder().decode([Test].self, from: data!)
            for item in test! {
                print(item)
            }
        }
        task.resume()
        
    }
    
    private func registerCells() {
        collectionView?.register(UINib(nibName: movieCellNibName, bundle: nil), forCellWithReuseIdentifier: movieCellIdn)
    }


}

// MARK: CpllectionView Delegate & DataSource

extension MoviesViewController: UICollectionViewDelegate {
    
}

extension MoviesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellIdn, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    
}
