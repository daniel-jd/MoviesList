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

    @IBOutlet weak var collectionView: UICollectionView? {
        didSet {
            collectionView?.delegate = self
            collectionView?.dataSource = self
        }
    }
    
    var movies = ["One", "Two", "Three"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        
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
