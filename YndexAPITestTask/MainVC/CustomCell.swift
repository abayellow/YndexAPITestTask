import UIKit

class CustomCell: UITableViewCell {
    
    static let cellID = "customCellID"
    
    //  MARK: -
    private let cityLabel = UILabel(text: "Moscow", fontSize: 15, weight: .regular)
    private let conditionLabel = UILabel(text: "Cloudy", fontSize: 15, weight: .light)
    private let tempLabel = UILabel(text: "7℃", fontSize: 15, weight: .regular)
    
    //  MARK: - Initialisator
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCinstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Constraints
    private func setCinstraints() {
        [cityLabel, conditionLabel, tempLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            cityLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            conditionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            conditionLabel.trailingAnchor.constraint(equalTo: tempLabel.leadingAnchor, constant: -20),
            
            tempLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            tempLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
            
        
        ])
        
    }
    
}
