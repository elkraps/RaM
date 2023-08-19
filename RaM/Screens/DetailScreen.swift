//
//  DetailScreen.swift
//  RaM
//
//  Created by Vlad Dzirko on 19.08.2023.
//

import UIKit

final class DetailScreen: BaseController {
    
    init(viewModel: DetailViewModel) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Resources.Colors.mainBackground
    }
}
