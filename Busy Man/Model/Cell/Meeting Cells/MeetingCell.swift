import UIKit
import SnapKit

class MeetingCell: UITableViewCell {
    
    let typeOfMeeeting = UILabel(text: "", font: UIFont(name: "Avenir Next Demi Bold", size: 20), aligment: .left)
    
    let meetingTime = UILabel(text: "", font: UIFont(name: "Avenir Next Demi Bold", size: 13), aligment: .left)
    
    let namePerson = UILabel(text: "", font: UIFont(name: "Avenir Next Demi", size: 20), aligment: .left)
    
    let date = UILabel(text: "", font: UIFont(name: "Avenir Next Demi", size: 15), aligment: .left)
    
    let city = UILabel(text: "", font: UIFont(name: "Times New Roman", size: 20), aligment: .left)
    
    let address = UILabel(text: "", font: UIFont(name: "Times New Roman", size: 20), aligment: .left)
    
    
    func configure(data: MeetingData) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        
        typeOfMeeeting.text = data.typeOfMeeting
        namePerson.text = data.name
        city.text = data.city
        address.text = data.address
        guard let time = data.time else {return}
        meetingTime.text = timeFormatter.string(from: time)
        guard let dateOfMeeting = data.date else {return}
        date.text = dateFormatter.string(from: dateOfMeeting)
        backgroundColor = UIColor().color(data.color)
        
        
    }

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
        
        self.addSubview(meetingTime)
        meetingTime.snp.makeConstraints { make in
            make.bottom.equalTo(-10)
            make.centerX.equalToSuperview()
            make.trailing.equalToSuperview().offset(-30)
        }
        
        self.addSubview(date)
        date.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview().offset(20)
        }
        
        self.addSubview(city)
        city.snp.makeConstraints { make in
            make.leading.equalTo(meetingTime).offset(35)
            make.centerY.equalTo(meetingTime)
        }
    
        self.addSubview(address)
        address.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
    }
}
