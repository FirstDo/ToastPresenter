//
//  ToastView.swift
//  ToastPresenter
//
//  Created by FirstDo on 08/04/2022.
//  Copyright (c) 2022 FirstDo. All rights reserved.
//

#if os(iOS)
import UIKit

@available(iOS 13.0, *)
public final class ToastView: UIView {
    
    public enum Position {
        case top(constant: CGFloat)
        case center(constant: CGFloat)
        case bottom(constant: CGFloat)
    }
    
    private let baseStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.alignment = .center
        
        return stackView
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    private let leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        
        return imageView
    }()
    
    public init(message: String, font: UIFont = .preferredFont(forTextStyle: .body)) {
        contentLabel.text = message
        contentLabel.font = .preferredFont(forTextStyle: .body)
        super.init(frame: .zero)
        
        setupLayout()
        setupAttribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(baseStackView)
        
        baseStackView.addArrangedSubview(leftImageView)
        baseStackView.addArrangedSubview(contentLabel)
        
        
        NSLayoutConstraint.activate([
            baseStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            baseStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            baseStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            baseStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            leftImageView.widthAnchor.constraint(equalToConstant: 30),
            leftImageView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func setupAttribute() {
        self.backgroundColor = UIColor.label.withAlphaComponent(0.6)
        self.alpha = 1.0
        self.layer.cornerRadius = 10
    }

    public func setTextColor(_ color: UIColor) -> Self {
        contentLabel.textColor = color
        return self
    }
    
    public func setBackgroundColor(_ color: UIColor, alpha: CGFloat) -> Self {
        self.backgroundColor = color.withAlphaComponent(alpha)
        return self
    }
    
    public func setImage(_ image: UIImage?) -> Self {
        leftImageView.isHidden = false
        leftImageView.image = image
        return self
    }
    
    public func show(in view: UIView, position: Position, holdingTime: TimeInterval, fadeAnimationDuration: TimeInterval) {
        view.addSubview(self)
        
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        switch position {
        case .top(let constant):
            self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
        case .center(let constant):
            self.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: constant).isActive = true
        case .bottom(let constant):
            self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
        }
        
        UIView.animate(withDuration: fadeAnimationDuration, delay: holdingTime, options: .curveEaseIn) {
            self.alpha = 0.0
        } completion: { _ in
            self.removeFromSuperview()
        }
    }
}

#endif
