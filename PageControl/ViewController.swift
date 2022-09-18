//
//  ViewController.swift
//  PageControl
//
//  Created by Nour Sandid on 18/09/2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var pageControl: PageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reuse")
        collectionView.dataSource = self
        collectionView.delegate = self
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = collectionView.bounds.size
        collectionViewLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = collectionViewLayout
        pageControl.numberOfPages = 5
        pageControl.currentPage = 1
        pageControl.dotRadius = 4
        pageControl.dotSpacings = 8
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuse", for: indexPath)
        cell.backgroundColor = .red
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.scrollViewDidScroll(scrollView)
    }
    
}

