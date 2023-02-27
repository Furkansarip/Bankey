//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Furkan Sarı on 27.02.2023.
//

import UIKit

class AccountSummaryCell : UITableViewCell {
    let typeLabel = UILabel()
    let dividerView = UIView()
    let stackView = UIStackView()
    let accountName = UILabel()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    let chevronImage = UIImageView()
    
    static let rowHeight : CGFloat = 100
    static let reuseID = "AccountSummaryCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "Account Type"
        
        accountName.translatesAutoresizingMaskIntoConstraints = false
        accountName.font = UIFont.preferredFont(forTextStyle: .body)
        accountName.text = "Account Name"
        
        balanceLabel.text = "Some balance"
        balanceLabel.textAlignment = .right
        balanceAmountLabel.text = "$999,626,63"
        balanceAmountLabel.textAlignment = .right
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.addArrangedSubview(balanceLabel)
        stackView.addArrangedSubview(balanceAmountLabel)
        stackView.spacing = 8
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .systemTeal
        
        chevronImage.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "chevron.right")?.withTintColor(.systemTeal, renderingMode: .alwaysOriginal)
        chevronImage.image = image
        contentView.addSubview(typeLabel)
        contentView.addSubview(dividerView)
        contentView.addSubview(accountName)
        contentView.addSubview(stackView)
        contentView.addSubview(chevronImage)
    }
       
   private func layout() {
       NSLayoutConstraint.activate([
        typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
        typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
        
        dividerView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
        dividerView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
        dividerView.widthAnchor.constraint(equalToConstant: 60),
        dividerView.heightAnchor.constraint(equalToConstant: 4),
        
        accountName.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 2),
        accountName.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
        
        stackView.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 0),
        stackView.leadingAnchor.constraint(equalTo: accountName.trailingAnchor, constant: 4),
        trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4),
        
        chevronImage.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 1.5),
        trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImage.trailingAnchor, multiplier: 1)
       
       ])
    }
}
