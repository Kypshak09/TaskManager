import UIKit
import SnapKit

class TasksCell: UITableViewCell {

    let taskTitle = UILabel(text: "Calisma", font: UIFont(name: "Times New Roman", size: 20), aligment: .left)
    
    let descriptionText = UILabel(text: "Study for math", font: UIFont(name: "Times New Roman", size: 15), aligment: .left)
    
    let buttonCheck: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    @objc func buttonTouched() {
        print("yeah boy")
        if buttonCheck.currentImage == UIImage(systemName: "circle") {
            buttonCheck.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        } else {
            buttonCheck.setImage(UIImage(systemName: "circle"), for: .normal)
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        buttonCheck.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubViews: [taskTitle,descriptionText], axis: .vertical, spacing: 15, distribution: .fillEqually)
        
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(200)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview()
        }
        
        self.addSubview(buttonCheck)
        buttonCheck.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        selectionStyle = .none
        descriptionText.numberOfLines = 2
        
    }
}
