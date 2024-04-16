//
//  DefaultTimerView.swift
//  CustomizeTimer
//
//  Created by D_K on 17.12.2023.
//

import UIKit

final class DefaultTimerView: BaseView {
    
    @IBOutlet private var pageContolView: UIPageControl!
    @IBOutlet private var pageParentView: UIView!
    @IBOutlet private var addTimerBtn: UIButton!
    @IBOutlet private var timersCountBtnView: TimerCountActionView!
    
    private lazy var pageController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal
    )
    
    private let coordinator: DefaultTimerCoordinator
    
    private let pages: (list: DefaultTimerViewPage, create: DefaultTimerViewPage)
    private var currentPage = 1 {
        didSet {
            self.pageContolChenges()
            self.setupPagesButtons()
        }
    }

    init(coordinator: DefaultTimerCoordinator,
         pages: (list: DefaultTimerViewPage, create: DefaultTimerViewPage)) {
        self.coordinator = coordinator
        self.pages = pages
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize() {
        navigationItem.title = L.text(.default_timer_title)
        pages.create.parentView = self
        pages.list.parentView = self
        timersCountBtnView.delegate = self
        pageControllerStartSetup()
        pageContolChenges()
    }
    
    private func pageControllerStartSetup() {
        pageController.delegate = self
        pageController.view.backgroundColor = .clear
        pageController.view.frame = CGRect(x: 0,y: 0,width: pageParentView.frame.width,height: pageParentView.frame.height)
        self.addChild(pageController)
        pageParentView.addSubview(pageController.view)
        pageController.didMove(toParent: self)
        setVisibleCreatePage()
    }
        
    private func setupListPage(timerCount new: Int) {
        pageController.dataSource = new < 1 ? nil : self
        setupPagesButtons()
        pageContolChenges()
    }
    
    private func setupPagesButtons() {
        let isVisibleCountView = timersCountBtnView.counts >= 1 && currentPage == pages.create.pageNumber
        let isVisibleAddBtn = currentPage == pages.list.pageNumber
        view.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.15) {
            self.timersCountBtnView.isVisible = isVisibleCountView
            self.addTimerBtn.isVisible = isVisibleAddBtn
            self.timersCountBtnView.alpha = isVisibleCountView ? 1 : 0
            self.addTimerBtn.alpha = isVisibleAddBtn ? 1 : 0
        }
    }
    
    private func pageContolChenges() {
        pageContolView.currentPage = currentPage
        pageContolView.isVisible = timersCountBtnView.counts >= 1
    }
    
    private func setVisibleCreatePage() {
        currentPage = pages.create.pageNumber
        view.isUserInteractionEnabled = false
        pageController.setPage(pages.create, direction: .forward) 
        { [weak self] isSuccess in
            guard let self, isSuccess else {return}
            view.isUserInteractionEnabled = true
        }
    }
    
    private func setVisibleListPage() {
        currentPage = pages.list.pageNumber
        view.isUserInteractionEnabled = false
        pageController.setPage(pages.list, direction: .reverse) 
        { [weak self] isSuccess in
            guard let self, isSuccess else {return}
            view.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func addTimerTapped(_ sender: Any) {
        setVisibleCreatePage()
    }
}

extension DefaultTimerView: DefaultTimerViewParent {
    func updatedTimers(total count: Int) {
        timersCountBtnView.counts = count
        setupListPage(timerCount: count)
    }
    
    func timersCountBtnCenter(for view: UIView) -> CGPoint {
        return self.view.convert(timersCountBtnView.center, to: view)
    }
}

extension DefaultTimerView: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let page = pageViewController.viewControllers?.first as? DefaultTimerViewPage  else { return }
        currentPage = page.pageNumber
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        currentPage = -1
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return viewController == pages.create ? pages.list : nil
    }
        
    func pageViewController(_ pageViewController: UIPageViewController, 
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return viewController == pages.list ? pages.create : nil
    }
}

extension DefaultTimerView: TimerCountActionViewDelegate {
    func timerCountActionView(_ view: TimerCountActionView, viewDidTap: Void) {
        setVisibleListPage()
    }
}


