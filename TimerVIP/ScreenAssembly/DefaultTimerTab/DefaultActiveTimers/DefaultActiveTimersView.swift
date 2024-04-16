//
//  DefaultActiveTimersView.swift
//  CustomizeTimer
//
//  Created by D_K on 18.01.2024.
//

import UIKit

protocol DefaultActiveTimersViewProvider: AnyObject {
    
}

final class DefaultActiveTimersView: BaseView, DefaultTimerViewPage, DefaultActiveTimersViewProvider {
    
    @IBOutlet var activeTimersTbl: UITableView!
    private let interactor: DefaultActiveTimersInteractorProvider
    private let coordinator: DefaultActiveTimersCoordinator
    
    var pageNumber: Int = 0
    weak var parentView: DefaultTimerViewParent?
    
    private var activeDataSource: [ActiveDefaultTimerTableCellModel] = []
    
    init(interactor: DefaultActiveTimersInteractorProvider,
         coordinator: DefaultActiveTimersCoordinator) {
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
    }
    
    private func initialize() {
        activeTimersTbl.dataSource = self
        activeTimersTbl.delegate = self
        activeTimersTbl.showsVerticalScrollIndicator = false
        activeTimersTbl.registerCell(ActiveDefaultTimerTableCell.self)
        activeTimersTbl.separatorStyle = .none
        activeTimersTbl.rowHeight = UITableView.automaticDimension
        activeTimersTbl.sectionHeaderTopPadding = 0
        var insets = activeTimersTbl.contentInset
        insets.top = 8
        insets.bottom = 45
        activeTimersTbl.contentInset = insets
    }
}

extension DefaultActiveTimersView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        activeDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ActiveDefaultTimerTableCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        var model = activeDataSource[indexPath.row]
        model.indexPath = indexPath
        cell.cellModel = model
        cell.delegate = self
        return cell
    }
}

extension DefaultActiveTimersView: ActiveDefaultTimerTableCellDelegate {
    func activeDefaultTimerTableCell(_ cell: ActiveDefaultTimerTableCell, willDeleteAt indexPath: IndexPath) {
        
    }
    
    func activeDefaultTimerTableCell(_ cell: ActiveDefaultTimerTableCell, willStartAt indexPath: IndexPath) {
        
    }
    
    func activeDefaultTimerTableCell(_ cell: ActiveDefaultTimerTableCell, willStopAt indexPath: IndexPath) {
        
    }
    
}
