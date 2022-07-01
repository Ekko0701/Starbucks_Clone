//
//  HeaderView.swift
//  Starbucks_Clone
//

import UIKit
import SnapKit

class HeaderView: UIView {
    let backgroundImage = UIImageView()
    
    let welcomeLabel = UILabel()
    
    let rewardLabel = UILabel()
    var rewardProgressBar = UIProgressView()
    let currentStarLabel = UILabel()
    let slashLabel = UILabel()
    let maxStarLabel = UILabel()
    
    let messageButton = UIButton()
    let couponButton = UIButton()
    let alaramButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView {
    func style() {
        backgroundImage.image = UIImage(named: "headerBackground")
        backgroundImage.contentMode = .scaleAspectFit
        
        welcomeLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        welcomeLabel.font = welcomeLabel.font.withSize(28)
        welcomeLabel.text = "디카페인 아메리카노 한 잔, 텀플러에 담아 차갑게 즐겨요!"
        welcomeLabel.numberOfLines = 0
        //welcomeLabel.lineBreakMode = .byWordWrapping //단어 기준으로 줄바꿈
        welcomeLabel.lineBreakStrategy = .hangulWordPriority
        
        
        rewardLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        rewardLabel.text = "11★ until next Reward"
        rewardLabel.font = rewardLabel.font.withSize(16)
        
        rewardProgressBar.trackTintColor = .lightGray
        rewardProgressBar.progressTintColor = .yellow
        rewardProgressBar.progress = 0.1
        
        currentStarLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        currentStarLabel.text = "1"
        
        slashLabel.font = UIFont.preferredFont(forTextStyle: .body)
        slashLabel.textColor = .lightGray
        slashLabel.font = slashLabel.font.withSize(25)
        slashLabel.text = "/"
        
        maxStarLabel.font = UIFont.preferredFont(forTextStyle: .body)
        maxStarLabel.textColor = .lightGray
        maxStarLabel.font = maxStarLabel.font.withSize(25)
        maxStarLabel.text = "12★"
        
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        
        let messageImage = UIImage(systemName: "envelope", withConfiguration: configuration)
        messageButton.setImage(messageImage, for: .normal)
        messageButton.imageView?.tintColor = .label
        messageButton.imageView?.contentMode = .scaleAspectFit
        messageButton.setTitle("What's New", for: .normal)
        messageButton.setTitleColor(.label, for: .normal)
        
        let couponImage = UIImage(systemName: "ticket",withConfiguration: configuration)
        couponButton.setImage(couponImage, for: .normal)
        couponButton.imageView?.tintColor = .label
        couponButton.imageView?.contentMode = .scaleAspectFit
        couponButton.setTitle("Coupon", for: .normal)
        couponButton.setTitleColor(.label, for: .normal)
        
        let alarmImage = UIImage(systemName: "bell",withConfiguration: configuration)
        alaramButton.setImage(alarmImage, for: .normal)
        alaramButton.imageView?.tintColor = .label
        alaramButton.imageView?.contentMode = .scaleAspectFit
        
        
        
    }
    
    func layout() {
        addSubview(backgroundImage)
        addSubview(welcomeLabel)
        addSubview(rewardLabel)
        addSubview(rewardProgressBar)
        addSubview(currentStarLabel)
        addSubview(slashLabel)
        addSubview(maxStarLabel)
        addSubview(messageButton)
        addSubview(couponButton)
        addSubview(alaramButton)
        
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        rewardLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        rewardProgressBar.snp.makeConstraints { make in
            make.top.equalTo(rewardLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-120)
            //make.trailing.equalTo(currentStarLabel.snp.leading).offset(-8)
        }
        
        currentStarLabel.snp.makeConstraints { make in
            make.bottom.equalTo(rewardProgressBar.snp.bottom).offset(7)
            //make.leading.equalTo(rewardProgressBar.snp.trailing).offset(40)
            //make.trailing.equalToSuperview().offset(16)
        }
        
        slashLabel.snp.makeConstraints { make in
            make.bottom.equalTo(currentStarLabel.snp.bottom).offset(-3)
            make.leading.equalTo(currentStarLabel.snp.trailing).offset(8)
            
        }
        
        maxStarLabel.snp.makeConstraints { make in
            make.bottom.equalTo(currentStarLabel.snp.bottom)
            make.leading.equalTo(slashLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        messageButton.snp.makeConstraints { make in
            make.top.equalTo(rewardProgressBar.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        couponButton.snp.makeConstraints { make in
            make.top.equalTo(rewardProgressBar.snp.bottom).offset(16)
            make.leading.equalTo(messageButton.snp.trailing).offset(16)
        }
        
        alaramButton.snp.makeConstraints { make in
            make.top.equalTo(rewardProgressBar.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        
        
    }
}
