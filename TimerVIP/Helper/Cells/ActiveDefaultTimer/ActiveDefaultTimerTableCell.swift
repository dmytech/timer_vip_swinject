//
//  ActiveDefaultTimerTableCell.swift
//  CustomizeTimer
//
//  Created by D_K on 19.02.2024.
//

import UIKit

protocol ActiveDefaultTimerTableCellDelegate: AnyObject {
    func activeDefaultTimerTableCell(_ cell: ActiveDefaultTimerTableCell, willDeleteAt indexPath: IndexPath)
    func activeDefaultTimerTableCell(_ cell: ActiveDefaultTimerTableCell, willStartAt indexPath: IndexPath)
    func activeDefaultTimerTableCell(_ cell: ActiveDefaultTimerTableCell, willStopAt indexPath: IndexPath)
}

class ActiveDefaultTimerTableCell: UITableViewCell {
    
    @IBOutlet private var endTimeTimerLbl: BarlowMedium18!
    @IBOutlet private var nameLbl: BarlowMedium14!
    @IBOutlet private var hoursLbl: BarlowMedium40!
    @IBOutlet private var minutesLbl: BarlowMedium40!
    @IBOutlet private var secondsLbl: BarlowMedium40!
    @IBOutlet private var startPauseBtn: UIButton!

    var cellModel: ActiveDefaultTimerTableCellModel! {
        didSet {
            setupCell()
        }
    }
    
    weak var delegate: ActiveDefaultTimerTableCellDelegate?
    
    private func setupCell() {
        nameLbl.text = cellModel.name
        hoursLbl.text = cellModel.hours.timeFormatString
        minutesLbl.text = cellModel.minutes.timeFormatString
        secondsLbl.text = cellModel.seconds.timeFormatString
        endTimeTimerLbl.text = cellModel.endTime
        startPauseBtn.isSelected = cellModel.isActive
        startPauseBtn.setImage(UIImage.playWhite24, for: .normal)
        startPauseBtn.setImage(UIImage.pauseWhite24, for: .selected)
    }
    
    @IBAction func closeTimerTapped(_ sender: Any) {
//        delegate?.activeDefaultTimerTableCell(self, willDeleteAt: cellModel.indexPath)
    }
    
    @IBAction func startPauseTapped(_ sender: Any) {
//        cellModel.isActive.toggle()
//        delegate?.activeDefaultTimerTableCell(self, willStartAt: cellModel.indexPath)
    }
}
