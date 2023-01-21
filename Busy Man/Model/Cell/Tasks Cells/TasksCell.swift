import UIKit
import SnapKit

class TasksCell: UITableViewCell {
    let data = TaskData()
    let taskTitle = UILabel(text: "Calisma", font: UIFont(name: "Times New Roman", size: 20), aligment: .left)
    
    let descriptionText = UILabel(text: "Study for math", font: UIFont(name: "Times New Roman", size: 15), aligment: .left)
    
    let buttonCheck: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    func configure(data: TaskData) {
        taskTitle.text = data.titleOfTask
        descriptionText.text = data.descriptionOfTask
        if data.taskDone == false {
            buttonCheck.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        } else {
            buttonCheck.setBackgroundImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        }
        
        
    }
    
    weak var cellTaskDelegate: PressButton?
    var index: IndexPath?
    
    @objc func buttonTouched() {
        guard let index = index else {return}
        cellTaskDelegate?.readyButton(index: index)
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
        
        self.contentView.addSubview(buttonCheck)
        buttonCheck.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        
        selectionStyle = .none
        descriptionText.numberOfLines = 2
        
    }
}
