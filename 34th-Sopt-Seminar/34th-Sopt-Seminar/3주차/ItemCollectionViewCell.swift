import UIKit

protocol ItemCollectoinViewCellDelegate: AnyObject {
    func heartButtonDidTapEvent(state: Bool, row: Int)
}

final class ItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ItemCollectionViewCell"
    
    weak var delegate: ItemCollectoinViewCellDelegate?
    var itemRow: Int?
    
    private let itemImageView = UIImageView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private lazy var heartButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setLayout()
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.heartButton.isSelected = false
    }
    
    
    
    private func setStyle() {
        nameLabel.do {
            $0.text = "먀"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = UIFont(name: "Pretendard-Regular", size: 16)
        }
        
        priceLabel.do {
            $0.text = "333원"
            $0.textColor = .orange
            $0.textAlignment = .left
            $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        }
        
        heartButton.do {
            $0.setImage(.heartOff, for: .normal)
            $0.setImage(UIImage(resource: .heartOn), for: .selected)
            $0.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        [itemImageView, nameLabel, priceLabel, heartButton].forEach {
            contentView.addSubview($0)
        }
        
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(9)
            $0.bottom.equalToSuperview().inset(59)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        heartButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(itemImageView).inset(8)
            $0.size.equalTo(16)
        }
    }
    
    @objc func heartButtonDidTap() {
        self.heartButton.isSelected.toggle()
        if let itemRow {
            self.delegate?.heartButtonDidTapEvent(
                state: self.heartButton.isSelected,
                row: itemRow
            )
        }
    }
    
    
}

extension ItemCollectionViewCell {
    func dataBind(_ itemData: ItemModel, itemRow: Int) {
        itemImageView.image = itemData.itemImg
        nameLabel.text = itemData.name
        priceLabel.text =  itemData.price
        heartButton.isSelected = itemData.heartIsSelected
        self.itemRow = itemRow
    }
}
