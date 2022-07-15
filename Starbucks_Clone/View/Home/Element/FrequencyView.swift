//
//  FrequencyView.swift
//  Starbucks_Clone
//
//  Created by Ekko on 2022/07/05.
//
import UIKit
import SnapKit


class FrequencyView: UITableViewCell {
    
    static let cellId = "FrequencyCell" // cell ID
    
    let backgroundImage = UIImageView()
    
    let titleLabel = UILabel()
    
    let subtitleLabel1 = UILabel()
    let subtitleLabel2 = UILabel()
    
    let beverageImage1 = UIImageView()
    let beverageImage2 = UIImageView()
    
    let beverageCountLabel1 = UILabel()
    let beverageCountLabel2 = UILabel()
    
    let bodyLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        backgroundImage.image = UIImage(named: "frequency_back")
        //backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.contentMode = .scaleToFill
        
        
        //titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        //titleLabel.font = titleLabel.font.withSize(20)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        titleLabel.text = "22 SUMMER e-Frequency"
        titleLabel.numberOfLines = 1
        
        subtitleLabel1.font = UIFont.preferredFont(forTextStyle: .body)
        subtitleLabel1.font = subtitleLabel1.font.withSize(14)
        subtitleLabel2.font = subtitleLabel1.font.withSize(14)
        subtitleLabel1.textColor = .gray
        subtitleLabel2.textColor = .gray
        subtitleLabel1.text = "[적립기간] 510(화)~711(월)]"
        subtitleLabel2.text = "[예약/증정기간 510(화)~718(월)]"
        
        beverageImage1.image = UIImage(named: "beverage1")
        beverageImage1.contentMode = .scaleAspectFit
    
        beverageCountLabel1.font = UIFont.preferredFont(forTextStyle: .body)
        beverageCountLabel1.text = "1"
        
        beverageCountLabel2.font = UIFont.preferredFont(forTextStyle: .body)
        beverageCountLabel2.text = "2"
        
        bodyLabel.text = "증정품은 매장별 예약 가능 일자 및 재고가 상이할 수 있으며, 한정 수량 제작되어 조기 소진 될 수 있습니다."
        bodyLabel.font = bodyLabel.font.withSize(12)
        bodyLabel.numberOfLines = 0
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension FrequencyView {
    
    
    func layout() {
        addSubview(backgroundImage)
        addSubview(titleLabel)
        addSubview(subtitleLabel1)
        addSubview(subtitleLabel2)
        addSubview(beverageImage1)
        addSubview(beverageCountLabel1)
        addSubview(bodyLabel)
        
        
        backgroundImage.snp.makeConstraints { make in
            make.height.equalTo(260)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.top).offset(24)
            make.leading.equalTo(backgroundImage.snp.leading).offset(16)
        }
        
        subtitleLabel1.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        subtitleLabel2.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel1.snp.bottom).offset(8)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        beverageImage1.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel2.snp.bottom).offset(16) // 16
            make.bottom.equalTo(bodyLabel.snp.top).offset(-32) // -32
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalTo(backgroundImage.snp.trailing).offset(-320)
        }
        
        beverageCountLabel1.snp.makeConstraints { make in
            //make.top.equalTo(subtitleLabel2.snp.bottom).offset(32)
            make.centerY.equalTo(beverageImage1.snp.centerY)
            make.leading.equalTo(beverageImage1.snp.trailing).offset(5)
        }
        
        bodyLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-88)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        
    }
    
    func style() {
        backgroundImage.image = UIImage(named: "frequency_back")
        backgroundImage.contentMode = .scaleAspectFill
        
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        //titleLabel.font = titleLabel.font.withSize(20)
        
        titleLabel.text = "22 SUMMER e-Frequency"
        titleLabel.numberOfLines = 1
        
        subtitleLabel1.font = UIFont.preferredFont(forTextStyle: .body)
        subtitleLabel1.font = subtitleLabel1.font.withSize(15)
        subtitleLabel1.text = "[적립기간] 510(화)~711(월)]"
        subtitleLabel2.text = "[예약/증정기간 510(화)~718(월)]"
        
        beverageImage1.image = UIImage(named: "beverage1")
        beverageImage1.contentMode = .scaleAspectFill
    
        beverageImage2.image = UIImage(named: "beverage2")
        beverageImage2.contentMode = .scaleAspectFill
        
        beverageCountLabel1.font = UIFont.preferredFont(forTextStyle: .body)
        beverageCountLabel1.text = "1"
        
        beverageCountLabel2.font = UIFont.preferredFont(forTextStyle: .body)
        beverageCountLabel2.text = "2"
        
        bodyLabel.text = "증정품은 매장별 예약 가능 일자 및 재고가 상이할 수 있으며, 한정 수량 제작되어 조기 소진 될 수 있습니다."
    }
}
