//
//  MainViewController.swift
//  ToDos
//
//  Created by Artur Akulich on 21.09.24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private enum Constants {
        enum Strings {
            static let title = "Fetcher"
            static let showResults = "Show Results"
            static let hintViewText = "Tap on the button to fetch todos"
        }
        
        enum Heights {
            static let actionBarHeight: CGFloat = 68
            static let hintViewHeight: CGFloat = 60
        }
    }
    
    // MARK: - Properties
    private var viewModel: MainViewModelProtocol
    
    // MARK: - Components
    private lazy var fetchButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private lazy var actionBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundGrey
        return view
    }()
    
    private lazy var userToggle: UISwitch = {
        let switchView = UISwitch()
        switchView.onTintColor = .appGreen
        switchView.tintColor = .backgroundGrey
        switchView.thumbTintColor = .appWhite
        return switchView
    }()
    
    private lazy var hintView = HintView()
    private lazy var showResultsButton = CustomButton()
    
    // MARK: - Init
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        showResultsButton.layer.cornerRadius = Grid.CornerRadius.button
        actionBarView.layer.cornerRadius = Constants.Heights.actionBarHeight / 2
    }
}

// MARK: - Private functions
private extension MainViewController {
    func setupView() {
        view.backgroundColor = .backgroundBlack
        
        setupActionBarView()
        setupShowResultsButton()
        setupSwitchView()
        setupHintView()
    }
    
    func setupActionBarView() {
        view.addSubview(actionBarView)
        actionBarView.snp.makeConstraints { make in
            make.height.equalTo(Constants.Heights.actionBarHeight)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(Grid.Spacing.m)
            make.horizontalEdges.equalToSuperview().inset(Grid.Spacing.m)
        }
    }
    
    func setupShowResultsButton() {
        actionBarView.addSubview(showResultsButton)
        showResultsButton.attribute = .init(
            buttonStyle: .primary,
            title: Constants.Strings.showResults,
            titleFont: .footnoteButton(),
            onTap: {
                print("Button tapped")
            }
        )
        
        showResultsButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(Grid.Spacing.s)
        }
    }
    
    func setupSwitchView() {
        actionBarView.addSubview(userToggle)
        userToggle.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(Grid.Spacing.m)
            make.centerY.equalToSuperview()
        }
        
        userToggle.onImage = .iconWifi?.withTintColor(.darkGreen)
        userToggle.offImage = .iconWifi?.withTintColor(.backgroundBlack)
    }
    
    func setupHintView() {
        view.addSubview(hintView)
        hintView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(Grid.Spacing.m)
            make.bottom.equalTo(showResultsButton.snp.top).offset(-Grid.Spacing.xl)
            make.height.equalTo(Constants.Heights.hintViewHeight)
        }
        
        hintView.attribute = .init(
            text: Constants.Strings.hintViewText,
            icon: UIImage.iconTouchHandPointUp
        )
    }
    
    func setupNavigationBar() {
        self.setCustomNavigationBarTitle(
            Constants.Strings.title,
            textColor: .appWhite,
            font: .title()
        )
    }
}
