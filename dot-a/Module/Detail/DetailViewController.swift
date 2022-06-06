//
//  DetailViewController.swift
//  dot-a
//
//  Created by yxgg on 03/06/22.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController { // swiftlint:disable:this type_body_length
  var heroStats: [HeroStats]?
  var heroDetail: HeroStats?
  
  // MARK: - Views
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    return scrollView
  }()
  
  lazy var contentView: UIView = {
    let contentView = UIView()
    return contentView
  }()
  
  lazy var heroImageView: UIImageView = {
    let heroImageView = UIImageView()
    heroImageView.contentMode = .scaleAspectFill
    return heroImageView
  }()
  
  lazy var nameLabel: UILabel = {
    let nameLabel = UILabel()
    nameLabel.textAlignment = .center
    nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    return nameLabel
  }()
  
  lazy var typeLabel: UILabel = {
    let typeLabel = UILabel()
    typeLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    return typeLabel
  }()
  
  lazy var attributeLabel: UILabel = {
    let attributeLabel = UILabel()
    attributeLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    return attributeLabel
  }()
  
  lazy var healthLabel: UILabel = {
    let healthLabel = UILabel()
    healthLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    return healthLabel
  }()
  
  lazy var attackLabel: UILabel = {
    let attackLabel = UILabel()
    attackLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    return attackLabel
  }()
  
  lazy var speedLabel: UILabel = {
    let speedLabel = UILabel()
    speedLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    return speedLabel
  }()
  
  lazy var rolesLabel: UILabel = {
    let rolesLabel = UILabel()
    rolesLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    rolesLabel.numberOfLines = 0
    return rolesLabel
  }()
  
  lazy var similarLabel: UILabel = {
    let similarLabel = UILabel()
    similarLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    return similarLabel
  }()
  
  lazy var similarStackView: UIStackView = {
    let similarStackView = UIStackView()
    similarStackView.axis = .horizontal
    similarStackView.alignment = .fill
    similarStackView.distribution = .equalSpacing
    similarStackView.spacing = 8
    return similarStackView
  }()
  
  lazy var similarImageOne: UIImageView = {
    let similarImageOne = UIImageView()
    similarImageOne.contentMode = .scaleAspectFill
    return similarImageOne
  }()
  
  lazy var similarImageTwo: UIImageView = {
    let similarImageTwo = UIImageView()
    similarImageTwo.contentMode = .scaleAspectFill
    return similarImageTwo
  }()
  
  lazy var similarImageThree: UIImageView = {
    let similarImageThree = UIImageView()
    similarImageThree.contentMode = .scaleAspectFill
    return similarImageThree
  }()
  
  lazy var activityIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView(style: .large)
    activityIndicator.hidesWhenStopped = true
    return activityIndicator
  }()
  
  lazy var activityIndicatorImage: UIActivityIndicatorView = {
    let activityIndicatorImage = UIActivityIndicatorView(style: .large)
    activityIndicatorImage.hidesWhenStopped = true
    return activityIndicatorImage
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    loadHeroDetail()
  }
  
  // MARK: - Configure Views
  private func setupViews() {
    title = "Hero Stats"
    view.backgroundColor = .white
    setupScrollView()
    setupContentView()
    setupHeroImageView()
    setupNameLabel()
    setupTypeLabel()
    setupAttributeLabel()
    setupHealthLabel()
    setupAttackLabel()
    setupSpeedLabel()
    setupRolesLabel()
    setupSimilarLabel()
    setupSimilarStackView()
    setupActivityIndicator()
  }
  
  private func setupScrollView() {
    view.addSubview(scrollView)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
  
  private func setupContentView() {
    scrollView.addSubview(contentView)
    contentView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
    ])
  }
  
  private func setupHeroImageView() {
    contentView.addSubview(heroImageView)
    heroImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      heroImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      heroImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      heroImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      heroImageView.heightAnchor.constraint(equalTo: heroImageView.widthAnchor, multiplier: 0.7)
    ])
  }
  
  private func setupNameLabel() {
    contentView.addSubview(nameLabel)
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      nameLabel.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 16)
    ])
  }
  
  private func setupTypeLabel() {
    contentView.addSubview(typeLabel)
    typeLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16)
    ])
  }
  
  private func setupAttributeLabel() {
    contentView.addSubview(attributeLabel)
    attributeLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      attributeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      attributeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      attributeLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 8)
    ])
  }
  
  private func setupHealthLabel() {
    contentView.addSubview(healthLabel)
    healthLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      healthLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      healthLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      healthLabel.topAnchor.constraint(equalTo: attributeLabel.bottomAnchor, constant: 8)
    ])
  }
  
  private func setupAttackLabel() {
    contentView.addSubview(attackLabel)
    attackLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      attackLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      attackLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      attackLabel.topAnchor.constraint(equalTo: healthLabel.bottomAnchor, constant: 8)
    ])
  }
  
  private func setupSpeedLabel() {
    contentView.addSubview(speedLabel)
    speedLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      speedLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      speedLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      speedLabel.topAnchor.constraint(equalTo: attackLabel.bottomAnchor, constant: 8)
    ])
  }
  
  private func setupRolesLabel() {
    contentView.addSubview(rolesLabel)
    rolesLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      rolesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      rolesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      rolesLabel.topAnchor.constraint(equalTo: speedLabel.bottomAnchor, constant: 8)
    ])
  }
  
  private func setupSimilarLabel() {
    contentView.addSubview(similarLabel)
    similarLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      similarLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      similarLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      similarLabel.topAnchor.constraint(equalTo: rolesLabel.bottomAnchor, constant: 8)
    ])
  }
  
  private func setupSimilarStackView() {
    contentView.addSubview(similarStackView)
    similarStackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      similarStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      similarStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      similarStackView.topAnchor.constraint(equalTo: similarLabel.bottomAnchor, constant: 8),
      similarStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
    ])
    similarStackView.addArrangedSubview(similarImageOne)
    similarStackView.addArrangedSubview(similarImageTwo)
    similarStackView.addArrangedSubview(similarImageThree)
    similarImageOne.translatesAutoresizingMaskIntoConstraints = false
    similarImageTwo.translatesAutoresizingMaskIntoConstraints = false
    similarImageThree.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      similarImageOne.widthAnchor.constraint(equalToConstant: 100),
      similarImageOne.heightAnchor.constraint(equalToConstant: 100),
      similarImageTwo.widthAnchor.constraint(equalToConstant: 100),
      similarImageTwo.heightAnchor.constraint(equalToConstant: 100),
      similarImageThree.widthAnchor.constraint(equalToConstant: 100),
      similarImageThree.heightAnchor.constraint(equalToConstant: 100)
    ])
  }
  
  private func setupActivityIndicator() {
    contentView.addSubview(activityIndicator)
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
  
  private func setupActivityIndicatorImage() {
    contentView.addSubview(activityIndicatorImage)
    activityIndicatorImage.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      activityIndicatorImage.centerXAnchor.constraint(equalTo: heroImageView.centerXAnchor),
      activityIndicatorImage.centerYAnchor.constraint(equalTo: heroImageView.centerYAnchor)
    ])
  }
}

// MARK: - DetailViewController
extension DetailViewController {
  private func loadHeroDetail() {
    activityIndicator.startAnimating()
    DotaProvider.shared.getListHero { result in
      switch result {
      case .success(let detail):
        self.heroStats = detail
        self.activityIndicator.stopAnimating()
        if let result = self.heroDetail {
          self.activityIndicatorImage.startAnimating()
          self.heroImageView.kf.setImage(with: URL(string: "https://api.opendota.com\(result.img)")) { _ in
            self.activityIndicatorImage.stopAnimating()
          }
          self.nameLabel.text = result.localizedName
          self.typeLabel.text = "Attack Type: \(result.attackType)"
          self.attributeLabel.text = "Primary Attribute: \(result.primaryAttr)"
          self.healthLabel.text = "Health: \(result.baseHealth)"
          self.attackLabel.text = "Max Attack: \(result.baseAttackMax)"
          self.speedLabel.text = "Speed: \(result.moveSpeed)"
          self.rolesLabel.text = "Roles: \(result.roles.joined(separator: ", "))"
          self.similarLabel.text = "Similar Heroes:"
          self.similarImageOne.backgroundColor = .purple
          self.similarImageTwo.backgroundColor = .yellow
          self.similarImageThree.backgroundColor = .green
          self.save()
        }
      case .failure(let error):
        self.presentAlert(
          title: "Oops! Something went wrong",
          message: error.localizedDescription,
          titleActionOne: "Try Again", completionActionOne: { _ in
            self.loadHeroDetail()
          },
          titleActionTwo: "Dismiss", completionActionTwo: { _ in
            self.navigationController?.popViewController(animated: true)
          })
      }
    }
  }
}

extension DetailViewController {
  private func save() {
    guard let localizedName = nameLabel.text else { return }
    guard let attackType = typeLabel.text else { return }
    guard let primaryAttr = attributeLabel.text else { return }
    guard let baseHealth = healthLabel.text else { return }
    guard let baseAttackMax = attackLabel.text else { return }
    guard let moveSpeed = speedLabel.text else { return }
    guard let roles = rolesLabel.text else { return }
    guard let img = heroImageView.image, let imgData = img.pngData() as NSData? else { return }
    
    let hero = Hero()
    hero.localizedName = localizedName
    hero.attackType = attackType
    hero.primaryAttr = primaryAttr
    hero.baseHealth = baseHealth
    hero.baseAttackMax = baseAttackMax
    hero.moveSpeed = moveSpeed
    hero.roles.append(roles)
    hero.img = imgData as Data
    
    let realm = try! Realm() // swiftlint:disable:this force_try
    try! realm.write({ // swiftlint:disable:this force_try
      realm.add(hero)
    })
  }
}
