import UIKit
import SnapKit

class MeetingCell: UITableViewCell {
    
    let typeOfMeeeting = UILabel(text: "Програмирование", font: UIFont(name: "Avenir Next Demi Bold", size: 20), aligment: .left)
    
    let lessonTime1 = UILabel(text: "09:00", font: UIFont(name: "Avenir Next Demi Bold", size: 10), aligment: .left)
    
    let namePerson = UILabel(text: "Дядя степа", font: UIFont(name: "Avenir Next Demi", size: 20), aligment: .left)
    
    let date = UILabel(text: "13.02.2023", font: UIFont(name: "Avenir Next Demi", size: 15), aligment: .left)
    
    let city = UILabel(text: "Karaganda", font: UIFont(name: "Times New Roman", size: 10), aligment: .left)

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        selectionStyle = .none
        
        let stackView = UIStackView(arrangedSubViews: [typeOfMeeeting, namePerson], axis: .horizontal, spacing: 80, distribution: .fillEqually)
        
        
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-30)
            make.leading.equalToSuperview().offset(20)
        }
        
        self.addSubview(lessonTime1)
        lessonTime1.snp.makeConstraints { make in
            make.bottom.equalTo(-10)
            make.centerX.equalToSuperview()
            make.trailing.equalToSuperview().offset(-30)
        }
        
    }
}
