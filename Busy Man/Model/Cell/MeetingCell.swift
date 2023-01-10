import UIKit
import SnapKit

class MeetingCell: UITableViewCell {
    let test = UILabel(text: "Test", font: UIFont(name: "Avenir Next Demi Bold", size: 20), aligment: .left)
    
    let lessonTime1 = UILabel(text: "09:00", font: UIFont(name: "Avenir Next Demi Bold", size: 15), aligment: .right)
    
    let test1 = UILabel(text: "test2", font: UIFont(name: "Avenir Next Demi", size: 20), aligment: .left)
   
    let stackView = UIStackView(arrangedSubViews: [test, test1], axis: .horizontal, spacing: 200, distribution: .fillEqually)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        self.addSubview(label)
//        label.snp.makeConstraints { make in
//            make.centerX.equalToSuperview().offset(-100)
//            make.centerY.equalToSuperview().offset(-30)
//            make.width.equalTo(200)
//        }
        
        self.addSubview(stackView)
//        stackView.addArrangedSubview(label)
//        stackView.addArrangedSubview(label1)
//        stackView.axis = .horizontal
//        stackView.spacing = 100
//        stackView.distribution = .fillEqually
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-100)
            make.centerY.equalToSuperview().offset(-30)
            make.width.equalTo(200)
        }
        
        self.addSubview(lessonTime1)
        lessonTime1.snp.makeConstraints { make in
            make.bottom.equalTo(-10)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
        }
        
    }
    
    
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
}
