//
//  AudioBookViewController.swift
//  YegriTunesSearchEX
//
//  Created by YJ on 8/10/24.
//

import UIKit
import WebKit
import SnapKit

final class AudioBookViewController: UIViewController {
    // MARK: UI
    let screenView = UIView()
    let webView = WKWebView()
    
    // MARK: Properties
    var previewLink: String?
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureWebView()
    }
    
    private func configureUI() {
        view.addSubviews([screenView, webView])
        
        screenView.snp.makeConstraints {
            $0.centerY.equalTo(view.safeAreaLayoutGuide.snp.centerY)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.height.equalTo(screenView.snp.width)
        }
        
        webView.snp.makeConstraints {
            $0.edges.equalTo(screenView.snp.edges)
        }
    }
    
    private func configureWebView() {
        guard let previewLink = previewLink else { return }
        if let detailURL = URL(string: previewLink) {
            let request = URLRequest(url: detailURL)
            webView.load(request)
        }
    }
}
