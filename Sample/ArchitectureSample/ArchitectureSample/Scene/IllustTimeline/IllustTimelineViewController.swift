//
//  SearchIllustViewController.swift
//  ArchitectureSample
//
//  Created by prez on 2020/02/16.
//  Copyright © 2020 prez. All rights reserved.
//

import UIKit

/// イラストタイムライン画面
final class IllustTimelineViewController: UIViewController {
    /// タイムラインテーブルビュー
    @IBOutlet weak var timelineTableView: UITableView!
    
    /// インジケータビュー
    lazy var indicatorView: IndicatorView = {
        let indicatorView = IndicatorView()
        self.view.addAndFit(subview: indicatorView)
        return indicatorView
    }()

    private var scrollBeginingPoint: CGPoint!
    
    private var interactor: IllustTimelineInteractorInput!
    
    private var illustTimelineViewModel = IllustTimelineViewModel(illustDescriptionViewModels: [])
    
    func inject(interactor: IllustTimelineInteractorInput) {
        self.interactor = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.interactor.seeNewIllust()
    }
    
    func setup() {
        self.timelineTableView.register(UINib(nibName: "IllustDescriptionTableViewCell", bundle: nil),
                                        forCellReuseIdentifier: "IllustDescriptionTableViewCell")
        self.timelineTableView.refreshControl = UIRefreshControl()
        self.timelineTableView.refreshControl?.addTarget(self,
                                                         action: #selector(self.timelineTableViewRefresh),
                                                         for: UIControl.Event.valueChanged)
    }

    @objc func timelineTableViewRefresh() {
        self.interactor.refresh()
    }
    
}

extension IllustTimelineViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.illustTimelineViewModel.illustDescriptionViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: IllustDescriptionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "IllustDescriptionTableViewCell") as? IllustDescriptionTableViewCell else {
            return UITableViewCell()
        }
        let viewModel = self.illustTimelineViewModel.illustDescriptionViewModels[indexPath.row]
        cell.setup(viewModel: viewModel)
        return cell
    }
    
}

extension IllustTimelineViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.interactor.seeIllustDetail(of: indexPath.row)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.scrollBeginingPoint = scrollView.contentOffset
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPoint = scrollView.contentOffset
        // 下方向へスクロール
        if scrollBeginingPoint.y < currentPoint.y {
            self.interactor.seeMoreNewIllust()
        }
    }
    
}

extension IllustTimelineViewController: IllustTimelinePresenterOutput {
    
    func show(errorMessage: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "読み込み失敗", message: errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    func indicatorView(isHidden: Bool) {
        DispatchQueue.main.async {
            if isHidden {
                self.indicatorView.stop()
            } else {
                self.indicatorView.start()
            }
        }
    }
    
    func timeline(viewModel: IllustTimelineViewModel) {
        DispatchQueue.main.async {
            self.timelineTableView.refreshControl?.endRefreshing()
            self.illustTimelineViewModel = viewModel
            self.timelineTableView.reloadData()
        }
    }
    
    func transitionToIllustDetail(contentDescription: ContentDescription) {
        DispatchQueue.main.async {
            let vc = IllustContentBuilder().build(contentDescription: contentDescription)
            let nc = UINavigationController(rootViewController: vc)
            self.present(nc, animated: true)
        }
    }

}
