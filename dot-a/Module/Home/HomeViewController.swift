//
//  HomeViewController.swift
//  dot-a
//
//  Created by yxgg on 03/06/22.
//

import UIKit
import Kingfisher
import RealmSwift

class HomeViewController: UIViewController {
  var heroStats: [HeroStats] = []
  var filteredHero: [HeroStats] = []
  
  // MARK: - Views
  lazy var segmentedControll: UISegmentedControl = {
    let items = ["All", "Carry", "Escape", "Nuker", "Initiator", "Durable", "Disabler", "Jungler", "Support", "Pusher"]
    let segmentedControll = UISegmentedControl(items: items)
    segmentedControll.selectedSegmentIndex = 0
    return segmentedControll
  }()
  
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    return scrollView
  }()
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .clear
    return collectionView
  }()
  
  lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    return stackView
  }()
  
  lazy var activityIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView(style: .large)
    activityIndicator.hidesWhenStopped = true
    return activityIndicator
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    getListHero()
  }
  
  // MARK: - Configure Views
  private func setupViews() {
    title = "Dot-a"
    view.backgroundColor = .white
    setupStackView()
    setupSegmentedControll()
    setupCollectionView()
    setupActivityIndicator()
  }
  
  private func setupStackView() {
    view.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
  
  private func setupSegmentedControll() {
    scrollView.addSubview(segmentedControll)
    stackView.addArrangedSubview(scrollView)
    segmentedControll.translatesAutoresizingMaskIntoConstraints = false
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      scrollView.heightAnchor.constraint(equalToConstant: 50),
      segmentedControll.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
      segmentedControll.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
      segmentedControll.topAnchor.constraint(equalTo: scrollView.topAnchor),
      segmentedControll.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
    ])
    segmentedControll.addTarget(self, action: #selector(tabSelect), for: .valueChanged)
  }
  
  private func setupCollectionView() {
    stackView.addArrangedSubview(collectionView)
    collectionView.register(HeroCollectionViewCell.self, forCellWithReuseIdentifier: "heroCellId")
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
  private func setupActivityIndicator() {
    view.addSubview(activityIndicator)
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
  
  // MARK: - Helpers
  private func getListHero() {
    activityIndicator.startAnimating()
    DotaProvider.shared.getListHero { result in
      switch result {
      case .success(let listHero):
        self.heroStats = listHero
        self.activityIndicator.stopAnimating()
        self.tabSelect()
        self.collectionView.reloadData()
        self.save()
      case .failure(let error):
        self.presentAlert(
          title: "Oops! Something went wrong",
          message: error.localizedDescription,
          titleActionOne: "Try Again", completionActionOne: { _ in
            self.getListHero()
          },
          titleActionTwo: "Dismiss", completionActionTwo: { _ in })
      }
    }
  }
  
  private func filteredHeroes(query: String) -> [HeroStats] {
    return heroStats.filter { heroes in
      return heroes.roles.contains(query)
    }
  }
  
  @objc private func tabSelect() {
    switch segmentedControll.selectedSegmentIndex {
    case 0:
      filteredHero = heroStats
    case 1:
      filteredHero = filteredHeroes(query: "Carry")
    case 2:
      filteredHero = filteredHeroes(query: "Escape")
    case 3:
      filteredHero = filteredHeroes(query: "Nuker")
    case 4:
      filteredHero = filteredHeroes(query: "Initiator")
    case 5:
      filteredHero = filteredHeroes(query: "Durable")
    case 6:
      filteredHero = filteredHeroes(query: "Disabler")
    case 7:
      filteredHero = filteredHeroes(query: "Jungler")
    case 8:
      filteredHero = filteredHeroes(query: "Support")
    case 9:
      filteredHero = filteredHeroes(query: "Pusher")
    default:
      filteredHero = heroStats
    }
    collectionView.reloadData()
  }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return filteredHero.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let heroCell = collectionView.dequeueReusableCell(
      withReuseIdentifier: "heroCellId",
      for: indexPath) as? HeroCollectionViewCell {
      let hero = filteredHero[indexPath.row]
      heroCell.heroNameLabel.text = hero.localizedName
      heroCell.activityIndicator.startAnimating()
      heroCell.heroImageView.kf.setImage(with: URL(string: "https://api.opendota.com\(hero.img)")) { _ in
        heroCell.activityIndicator.stopAnimating()
      }
      return heroCell
    } else {
      return UICollectionViewCell()
    }
  }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let viewController = DetailViewController()
    viewController.heroDetail = filteredHero[indexPath.row]
    self.navigationController?.pushViewController(viewController, animated: true)
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 150, height: 200)
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
}

extension HomeViewController {
  private func save() {
    heroStats.forEach { hero in
      let heroes = Heroes()
      let imgData = Data(hero.img.utf8)
      heroes.img = imgData
      heroes.localizedName = hero.localizedName
      heroes.attackType = hero.attackType
      heroes.primaryAttr = hero.primaryAttr
      heroes.baseHealth = hero.baseHealth
      heroes.baseAttackMax = hero.baseAttackMax
      heroes.moveSpeed = hero.moveSpeed
      heroes.roles.append(objectsIn: hero.roles)
      heroes.baseMana = hero.baseMana
      
      let realm = try! Realm() // swiftlint:disable:this force_try
      try! realm.write({ // swiftlint:disable:this force_try
        realm.add(heroes)
      })
      print(realm.configuration.fileURL!)
    }
  }
}
