//
//  ViewController.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 02/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class HomeListView: UIViewController {
    
    var presenter: HomePresenterInput!
    
    var pokemons: [HomeItem] = []
    
    let boxView: BoxView = {
        let viewBox = BoxView()
        viewBox.translatesAutoresizingMaskIntoConstraints = false
        return viewBox
    }()
    
    let imagePokeboll: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(imageLiteralResourceName: "Pokeball-top")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var collectionView : UICollectionView = {
        let layout  = UICollectionViewFlowLayout()
        let colletion  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletion.translatesAutoresizingMaskIntoConstraints = false
        colletion.backgroundColor = .white
        colletion.delegate = self
        colletion.dataSource = self
        layout.sectionInset.top = 40
        return colletion
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupLayout()
        presenter.viewDidLoad()
        
    }
    
    func setupLayout() {
        let nibName = UINib(nibName: "HomeCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: HomeCell.identifier)
        let nibNameLoading = UINib(nibName: "LoadingCell", bundle: nil)
        collectionView.register(nibNameLoading, forCellWithReuseIdentifier: LoadingCell.identifier)
        guard let navigationBar = navigationController?.navigationBar else {
            return
        }
        
        
        navigationBar.addSubview(boxView)
        view.addSubview(imagePokeboll)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            boxView.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 80),
            boxView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor),
            boxView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor,  constant: 320),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            boxView.heightAnchor.constraint(equalToConstant: 200),
            imagePokeboll.topAnchor.constraint(equalTo: view.topAnchor),
            imagePokeboll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imagePokeboll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imagePokeboll.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: #imageLiteral(resourceName: "filter"), style: .plain, target: self, action: #selector(sendFilter(_:))),
            UIBarButtonItem(image: #imageLiteral(resourceName: "order"), style: .plain, target: self, action: #selector(sendOrderBy(_:))),
            UIBarButtonItem(image: #imageLiteral(resourceName: "generatios"), style: .plain, target: self, action: #selector(sendGeneration(_:))),
            
        ]
    }
    
    @objc  func sendGeneration(_ sender: Any?) {
        presenter.didTap(item: .generation)
    }
    
    @objc  func sendFilter(_ sender: Any?) {
        presenter.didTap(item: .filter)
    }
    @objc  func sendOrderBy(_ sender: Any?) {
        presenter.didTap(item: .order)
    }
    
    
}
extension HomeListView: HomePresenterOutput {
    func result(paginate: [HomeItem]) {
        self.pokemons = paginate
        collectionView.reloadItemsInSection(sectionIndex: 0, newCount: self.pokemons.count) {
            let indexPathsForVisibleItems = self.collectionView.indexPathsForVisibleItems
            if !self.presenter.finishPagination {
                self.collectionView.reloadItems(at: indexPathsForVisibleItems)
            }
        }
    }
    func result(generactions: [HomeItem]) {
        self.pokemons = generactions
        collectionView.reloadData()
    }
    
    func result(pokemons: [HomeItem]) {
        self.pokemons = pokemons
        collectionView.reloadData()
    }
}

extension HomeListView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if pokemons[indexPath.row] is HomeItemLoading{
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingCell.identifier, for: indexPath) as! LoadingCell
            return cell
        }else {
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
            cell.populate(item: pokemons[indexPath.row])
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width - 40, height: 135)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if pokemons[indexPath.row] is HomeItemLoading, !presenter.finishPagination {
            presenter.paginate()
        }
    }
}
