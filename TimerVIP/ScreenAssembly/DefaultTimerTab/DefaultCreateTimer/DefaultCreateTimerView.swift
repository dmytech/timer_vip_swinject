//
//  DefaultCreateTimerView.swift
//  CustomizeTimer
//
//  Created by D_K on 14.02.2024.
//

import UIKit

protocol DefaultCreateTimerViewProvider: AnyObject {
    func timerCreated(total timers: Int)
    func defaultSongSet(_ name: String)
    func currentTimerNameSet(_ name: String)
}

extension DefaultCreateTimerView: DefaultCreateTimerViewProvider {
    func timerCreated(total timers: Int) {
        clockDownAnimation()
    }
    
    func defaultSongSet(_ name: String) {
        soundTimerField.text = name
    }
    
    func currentTimerNameSet(_ name: String) {
        nameTimerField.text = name
    }
}

final class DefaultCreateTimerView: BaseView, DefaultTimerViewPage {
    
    @IBOutlet private var actionStackView: UIStackView!
    @IBOutlet private var recentTimerTbl: UITableView!
    @IBOutlet private var soundTimerField: TapFieldWithIconView!
    @IBOutlet private var nameTimerField: InputFieldWithIconView!
    @IBOutlet private var clearAllBtn: UIButton!
    @IBOutlet private var startTimerBtn: UIButton!
    @IBOutlet private var timerPicker: TimePickerView!
    
    private let interactor: DefaultCreateTimerInteractorProvider
    private let coordinator: DefaultCreateTimerCoordinator
    
    private var recentDataSource: [RecentDefaultTimerTableCellModel] = []
    
    var pageNumber: Int = 1
    weak var parentView: DefaultTimerViewParent?
    
    init(
        interactor: DefaultCreateTimerInteractorProvider,
        coordinator: DefaultCreateTimerCoordinator
    ) {
        self.interactor = interactor
        self.coordinator = coordinator
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        interactor.start()
        for _ in 0...1000 {
            let m = RecentDefaultTimerTableCellModel(name: "Num 1", hours: 2, minutes: 2, seconds: 2)
            recentDataSource.append(m)
        }
    }
    
    private func initialize() {
        recentTimerTbl.dataSource = self
        recentTimerTbl.delegate = self
        recentTimerTbl.showsVerticalScrollIndicator = false
        recentTimerTbl.registerCell(RecentDefaultTimerTableCell.self)
        recentTimerTbl.separatorStyle = .none
        recentTimerTbl.rowHeight = UITableView.automaticDimension
        recentTimerTbl.sectionHeaderTopPadding = 0
        var insets = recentTimerTbl.contentInset
        insets.bottom = 45
        recentTimerTbl.contentInset = insets
    }
    
    private func clockDownAnimation() {
        let startPoint = actionStackView.convert(startTimerBtn.center, to: self.view)
        let endPoint = parentView?.timersCountBtnCenter(for: self.view) ?? .zero
        let clockView = AnimateFlightIconView(UIImage.clockWhite16, superView: self.view)
        clockView.startCenterPoint = startPoint
        clockView.moveTo(center: endPoint) {
            self.parentView?.updatedTimers(total: 1)
        }
    }
    
    @IBAction private func startTimerTapped(_ sender: Any) {
        let time = timerPicker.getTimestampOfSelectedTimer()
        interactor.newTimerStarted(nameTimerField.text ?? "#1", timestamp: time)
    }
    
    @IBAction private func clearAllTapped(_ sender: Any) {
    }
    
    
}

extension DefaultCreateTimerView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recentDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecentDefaultTimerTableCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        var model = recentDataSource[indexPath.row]
        model.indexPath = indexPath
        cell.cellModel = model
        cell.delegate = self
        return cell
    }
}

extension DefaultCreateTimerView: RecentDefaultTimerTableCellDelegate {
    func recentDefaultTimerTableCell(_ cell: RecentDefaultTimerTableCell, willDeleteAt indexPath: IndexPath) {
        
    }
    
    func recentDefaultTimerTableCell(_ cell: RecentDefaultTimerTableCell, willStartAt indexPath: IndexPath) {
        
    }
}

extension UITableView {
    func dequeue<Cell: UITableViewCell>(
        _ reusableCellType: Cell.Type,
        for indexPath: IndexPath,
        identifier: String? = nil
    ) -> Cell {
        let identifier = identifier ?? String(describing: reusableCellType)
        register(reusableCellType, forCellReuseIdentifier: identifier)
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Unable to dequeue \(reusableCellType)")
        }
        return cell
    }
}
