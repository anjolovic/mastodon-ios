//
//  DoubleTitleLabelNavigationBarTitleView.swift
//  Mastodon
//
//  Created by BradGao on 2021/4/1.
//

import UIKit
import ActiveLabel

final class DoubleTitleLabelNavigationBarTitleView: UIView {
    
    let containerView = UIStackView()
    
    let titleLabel: ActiveLabel = {
        let label = ActiveLabel(style: .default)
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = Asset.Colors.Label.primary.color
        label.textAlignment = .center
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = Asset.Colors.Label.secondary.color
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        _init()
    }
    
}

extension DoubleTitleLabelNavigationBarTitleView {
    private func _init() {
        containerView.axis = .vertical
        containerView.alignment = .center
        containerView.distribution = .fill
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        containerView.addArrangedSubview(titleLabel)
        containerView.addArrangedSubview(subtitleLabel)
    }
    
    func update(title: String, subtitle: String?, emojiDict: MastodonStatusContent.EmojiDict) {
        titleLabel.configure(content: title, emojiDict: emojiDict)
        if let subtitle = subtitle {
            subtitleLabel.text = subtitle
            subtitleLabel.isHidden = false
        } else {
            subtitleLabel.text = nil
            subtitleLabel.isHidden = true
        }
    }
}

#if canImport(SwiftUI) && DEBUG

import SwiftUI

struct DoubleTitleLabelNavigationBarTitleView_Previews: PreviewProvider {
    
    static var previews: some View {
        UIViewPreview(width: 375) {
            DoubleTitleLabelNavigationBarTitleView()
        }
        .previewLayout(.fixed(width: 375, height: 100))
    }
    
}

#endif

