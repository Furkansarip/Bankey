//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Furkan Sarı on 27.02.2023.
//

import UIKit

class AccountSummaryCell : UITableViewCell {
    
    enum AccountType: String {
        case Banking
        case CreditCard
        case Investment
    }
    
    struct ViewModel {
        let accountType: AccountType
        let accountName: String
    }

    let viewModel: ViewModel? = nil
    
    
    let typeLabel = UILabel()
    let dividerView = UIView()
    let stackView = UIStackView()
    let accountName = UILabel()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    let chevronImage = UIImageView()
    
    static let rowHeight : CGFloat = 112
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
        balanceAmountLabel.attributedText = makeFormattedBalance(dollars: "999,466", cents: "23")
        balanceAmountLabel.textAlignment = .right
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.addArrangedSubview(balanceLabel)
        stackView.addArrangedSubview(balanceAmountLabel)
        
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

extension AccountSummaryCell {
    private func makeFormattedBalance(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
    
    func configure(with vm: ViewModel) {
        
        typeLabel.text = vm.accountType.rawValue
        accountName.text = vm.accountName
        switch vm.accountType {
        case .Banking:
            balanceLabel.text = "Current balance"
            dividerView.backgroundColor = .systemTeal
        case .CreditCard:
            balanceLabel.text = "Current balance"
            dividerView.backgroundColor = .systemOrange
        case .Investment:
            balanceLabel.text = "Value"
            dividerView.backgroundColor = .systemPurple
        }
    }
    
    
}

