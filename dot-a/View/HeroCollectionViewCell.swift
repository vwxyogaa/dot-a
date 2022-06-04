//
//  HeroCollectionViewCell.swift
//  dot-a
//
//  Created by yxgg on 04/06/22.
//

import UIKit

class HeroCollectionViewCell: UICollectionViewCell {
  // MARK: - Views
  lazy var containerView: UIView = {
    let containerView = UIView()
    containerView.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 255/255, alpha: 1)
    containerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
    containerView.layer.shadowOpacity = 1
    containerView.layer.shadowOffset = .zero
    containerView.layer.shadowRadius = 4
    return containerView
  }()
  
  lazy var heroImageView: UIImageView = {
    let heroImageView = UIImageView()
    return heroImageView
  }()
  
  lazy var heroNameLabel: UILabel = {
    let heroNameLabel = UILabel()
    heroNameLabel.textAlignment = .center
    heroNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
    return heroNameLabel
  }()
  
  lazy var activityIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView(style: .large)
    activityIndicator.hidesWhenStopped = true
    return activityIndicator
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupViews()
  }
  
  // MARK: - Configure Views
  private func setupViews() {
    backgroundColor = .clear
    setupContainerView()
    setupHeroImageView()
    setupHeroNameLabel()
    setupActivityIndicator()
  }
  
  private func setupContainerView() {
    contentView.addSubview(containerView)
    containerView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  private func setupHeroImageView() {
    containerView.addSubview(heroImageView)
    heroImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      heroImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
      heroImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
      heroImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
      heroImageView.heightAnchor.constraint(equalToConstant: 153)
    ])
  }
  
  private func setupHeroNameLabel() {
    containerView.addSubview(heroNameLabel)
    heroNameLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      heroNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
      heroNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
      heroNameLabel.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 16),
      heroNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
    ])
  }
  
  private func setupActivityIndicator() {
    containerView.addSubview(activityIndicator)
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      activityIndicator.centerXAnchor.constraint(equalTo: heroImageView.centerXAnchor),
      activityIndicator.centerYAnchor.constraint(equalTo: heroImageView.centerYAnchor)
    ])
  }
}
