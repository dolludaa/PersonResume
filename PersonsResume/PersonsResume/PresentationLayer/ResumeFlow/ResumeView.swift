//
//  ResumeView.swift
//  PersonsResume
//
//  Created by Людмила Долонтаева on 2023-08-01.
//

import Foundation
import UIKit

final class ResumeView: UIView {

    weak var delegate: ResumeViewControllerDelegate?

    private let scrollView = UIScrollView()
    private let scrollContainerView = UIView()
    private let topFillerView = UIView()
    private let topViewContainer = UIView()
    private let titleLabel = UILabel()
    private let avatarImageView = UIImageView()
    private let editButton = UIButton()
    private let fullNameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let townLabel = UILabel()
    private let aboutMeLabel = UILabel()
    private let textMyDescription = UILabel()
    private let mySkillsLabel = UILabel()

    private let avatarSize = 150.0

    private let alignedFlowLayout = LeftAlignedCollectionViewFlowLayout()
    lazy var collectionView = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: alignedFlowLayout)

    private func setUpLayout() {
        let scrollContentGuide = scrollView.contentLayoutGuide

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.translatesAutoresizingMaskIntoConstraints = false
        topViewContainer.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        townLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        textMyDescription.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        mySkillsLabel.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        topFillerView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(topFillerView)
        addSubview(scrollView)
        scrollView.addSubview(scrollContainerView)
        scrollContainerView.addSubview(topViewContainer)
        scrollContainerView.addSubview(aboutMeLabel)
        scrollContainerView.addSubview(textMyDescription)
        scrollContainerView.addSubview(collectionView)
        scrollContainerView.addSubview(mySkillsLabel)
        scrollContainerView.addSubview(editButton)
        topViewContainer.addSubview(titleLabel)
        topViewContainer.addSubview(avatarImageView)
        topViewContainer.addSubview(fullNameLabel)
        topViewContainer.addSubview(descriptionLabel)
        topViewContainer.addSubview(townLabel)

        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            topFillerView.topAnchor.constraint(equalTo: topAnchor),
            topFillerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topFillerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topFillerView.bottomAnchor.constraint(greaterThanOrEqualTo: scrollContainerView.topAnchor),

            scrollContainerView.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            scrollContainerView.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),
            scrollContainerView.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor),
            scrollContainerView.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),

            scrollContainerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContainerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            topViewContainer.topAnchor.constraint(equalTo: scrollContainerView.topAnchor),
            topViewContainer.bottomAnchor.constraint(equalTo: townLabel.bottomAnchor, constant: 19),
            topViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            topViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor),

            titleLabel.topAnchor.constraint(equalTo: topViewContainer.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor),

            avatarImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 42),
            avatarImageView.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 120),
            avatarImageView.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -120),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarSize),

            fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            fullNameLabel.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 100),
            fullNameLabel.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -100),

            descriptionLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -30),

            townLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            townLabel.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 30),
            townLabel.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -30),

            mySkillsLabel.topAnchor.constraint(equalTo: townLabel.bottomAnchor, constant: 40),
            mySkillsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            editButton.topAnchor.constraint(equalTo: townLabel.bottomAnchor, constant: 40),

            collectionView.topAnchor.constraint(equalTo: mySkillsLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            aboutMeLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 24),
            aboutMeLabel.leadingAnchor.constraint(equalTo: scrollContainerView.leadingAnchor, constant: 16),

            textMyDescription.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 8),
            textMyDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textMyDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textMyDescription.bottomAnchor.constraint(equalTo: scrollContainerView.bottomAnchor)

        ])
    }

    private func setUpStyle() {

        let image = UIImage(named: "town")
        let attachment = NSTextAttachment()
        let attributedString = NSMutableAttributedString(string: "town".localized)

        backgroundColor = .white

        topViewContainer.backgroundColor = AppColorEnum.backgroundColor.color

        scrollView.frame = bounds
        scrollView.clipsToBounds = true
        scrollView.contentInsetAdjustmentBehavior = .always

        titleLabel.text = "profile".localized
        titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        titleLabel.textAlignment = .center

        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = avatarSize / 2

        fullNameLabel.text = "name".localized
        fullNameLabel.numberOfLines = 0
        fullNameLabel.adjustsFontSizeToFitWidth = true
        fullNameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        fullNameLabel.textAlignment = .center

        descriptionLabel.text = "experience".localized
        descriptionLabel.textColor = AppColorEnum.descriptionTextColor.color
        descriptionLabel.numberOfLines = 2
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textAlignment = .center


        attachment.image = image
        attributedString.insert(NSAttributedString(attachment: attachment), at: 0)
        townLabel.attributedText = attributedString
        townLabel.textColor = AppColorEnum.descriptionTextColor.color
        townLabel.numberOfLines = 1
        townLabel.adjustsFontSizeToFitWidth = true
        townLabel.font = .systemFont(ofSize: 14, weight: .regular)
        townLabel.textAlignment = .center

        aboutMeLabel.text = "about".localized
        aboutMeLabel.textAlignment = .left
        aboutMeLabel.font = .systemFont(ofSize: 16, weight: .medium)

        textMyDescription.text = "about me".localized
        textMyDescription.textAlignment = .left
        textMyDescription.numberOfLines = 0
        textMyDescription.font = .systemFont(ofSize: 14, weight: .regular)

        collectionView.dataSource = delegate
        collectionView.register(SkillCell.self, forCellWithReuseIdentifier: SkillCell.reuseIdentifier)
        collectionView.register(AddCell.self, forCellWithReuseIdentifier: AddCell.reuseIdentifier)

        alignedFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize

        mySkillsLabel.text = "my skills".localized
        mySkillsLabel.font = .systemFont(ofSize: 16, weight: .medium)

        scrollView.isScrollEnabled = true
        editButton.setImage(UIImage(named: "editButton"), for: .normal)

        topFillerView.backgroundColor = AppColorEnum.backgroundColor.color
    }

    private func setUp() {
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
    }

    @objc
    private func editButtonTapped() {
        delegate?.editDidTap()
    }
}

extension ResumeView: ResumeViewProtocol {
    var collectionForCell: UICollectionView {
        collectionView
    }

    func deleteItemsInCollectionView(indexPath: IndexPath) {
        collectionView.deleteItems(at: [indexPath])
    }

    func buttonChange(image: UIImage?) {
        editButton.setImage(image, for: .normal)
    }

    func reloadData() {
        collectionView.reloadData()
    }

    func didLoad() {
        setUpStyle()
        setUpLayout()
        setUp()
    }
}
