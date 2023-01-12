import UIKit
import SnapKit

class HeaderTask: UITableViewHeaderFooterView {
    
    let label = UILabel(text: "", font: UIFont(name: "New Roman Bold", size: 25), aligment: .left)
    let headerArray = ["Task","Date and time"]
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(200)
            make.bottom.equalToSuperview().offset(-5)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
