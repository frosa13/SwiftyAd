//
//  AdDetailsView.swift
//  SwiftyAd
//
//  Created by Francisco Rosa on 15/03/2025.
//

import SwiftUI

struct AdDetailsViewControllerWrapper: UIViewControllerRepresentable {
    let ad: Ad
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return AdDetailsViewController(ad: ad)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

class AdDetailsViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    private var adImageView: UIImageView!
    private var urgentLabel: UILabel?
    private var contentContainerView: UIView!
    private var contenteStackView: UIStackView!
    private var adDateLabel: UILabel!
    private var adTitleLabel: UILabel!
    private var adCategoryLabel: UILabel!
    private var adPriceLabel: UILabel!
    private var adSiretLabel: UILabel?
    private var adDescriptionLabel: UILabel!
    
    private let ad: Ad
    private var stackViews = [UIView]()
    
    init(ad: Ad) {
        self.ad = ad
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        contentView = UIView()
        scrollView.addSubview(contentView)

        adImageView = UIImageView()
        adImageView.contentMode = .scaleAspectFit
        if let image = ad.imagesURL.small, let url = URL(string: image) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async { [weak self] in
                        self?.adImageView.image = image
                    }
                }
            }
        }
        contentView.addSubview(adImageView)
        
        if ad.isUrgent {
            urgentLabel = UILabel(weight: .bold, size: 16, color: .white, alignment: .center)
            urgentLabel?.text = "Urgent"
            urgentLabel?.backgroundColor = .systemOrange
            urgentLabel?.layer.cornerRadius = Radius.r12.rawValue
            urgentLabel?.layer.masksToBounds = true
            if let urgentLabel {
                adImageView.addSubview(urgentLabel)
            }
        }
        
        contentContainerView = UIView()
        contentContainerView.backgroundColor = .white
        contentContainerView.backgroundColor = .white
        contentContainerView.layer.cornerRadius = Radius.r8.rawValue
        contentContainerView.layer.masksToBounds = false
        contentContainerView.layer.shadowColor = UIColor.black.cgColor
        contentContainerView.layer.shadowOpacity = 0.15
        contentContainerView.layer.shadowRadius = Radius.r32.rawValue
        contentContainerView.layer.shadowOffset = CGSize(width: 0, height: 16)
        contentView.addSubview(contentContainerView)
        
        adDateLabel = UILabel(size: 16, color: .black)
        adDateLabel.text = ad.creationDate.formatDate()
        stackViews.append(adDateLabel)
        
        adTitleLabel = UILabel(weight: .bold, size: 32, color: .black)
        adTitleLabel.text = ad.title
        stackViews.append(adTitleLabel)
        
        adCategoryLabel = UILabel(size: 16, color: .black)
        adCategoryLabel.text = ad.category?.name
        stackViews.append(adCategoryLabel)
        
        adPriceLabel = UILabel(weight: .bold, size: 24, color: .orange)
        adPriceLabel.text = ad.price.formattedPrice()
        stackViews.append(adPriceLabel)
        
        if let siret = ad.siret {
            adSiretLabel = UILabel(size: 16, color: .black)
            adSiretLabel?.text = "Siret: \(siret)"
            if let adSiretLabel {
                stackViews.append(adSiretLabel)
            }
        }
        
        adDescriptionLabel = UILabel(size: 16, color: .black)
        adDescriptionLabel.text = ad.description
        stackViews.append(adDescriptionLabel)
        
        contenteStackView = UIStackView(arrangedSubviews: stackViews)
        contenteStackView.axis = .vertical
        contenteStackView.alignment = .leading
        contenteStackView.spacing = Margin.m12.rawValue
        contentContainerView.addSubview(contenteStackView)
    }
    
    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        adImageView.translatesAutoresizingMaskIntoConstraints = false
        urgentLabel?.translatesAutoresizingMaskIntoConstraints = false
        contentContainerView.translatesAutoresizingMaskIntoConstraints = false
        contenteStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            adImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            adImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            adImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            adImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            contentContainerView.topAnchor.constraint(equalTo: adImageView.bottomAnchor, constant: Margin.m16.rawValue),
            contentContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margin.m16.rawValue),
            contentContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margin.m16.rawValue),
            contentContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Margin.m16.rawValue),
            
            contenteStackView.topAnchor.constraint(equalTo: contentContainerView.topAnchor, constant: Margin.m16.rawValue),
            contenteStackView.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor, constant: Margin.m16.rawValue),
            contenteStackView.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor, constant: -Margin.m16.rawValue),
            contenteStackView.bottomAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: -Margin.m16.rawValue)
        ])
        
        if let urgentLabel {
            NSLayoutConstraint.activate([
                urgentLabel.topAnchor.constraint(equalTo: adImageView.topAnchor, constant: Margin.m12.rawValue),
                urgentLabel.trailingAnchor.constraint(equalTo: adImageView.trailingAnchor, constant: -Margin.m12.rawValue),
                urgentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: Size.s24.rawValue),
                urgentLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: Size.s80.rawValue) // Ensures proper text width
            ])
        }
    }
}
