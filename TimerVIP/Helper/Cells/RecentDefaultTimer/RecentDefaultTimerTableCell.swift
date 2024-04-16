//
//  RecentDefaultTimerTableCell.swift
//  CustomizeTimer
//
//  Created by D_K on 16.02.2024.
//

import UIKit

protocol RecentDefaultTimerTableCellDelegate: AnyObject {
    func recentDefaultTimerTableCell(_ cell: RecentDefaultTimerTableCell, willDeleteAt indexPath: IndexPath)
    func recentDefaultTimerTableCell(_ cell: RecentDefaultTimerTableCell, willStartAt indexPath: IndexPath)
}

final class RecentDefaultTimerTableCell: UITableViewCell {

    @IBOutlet private var nameLbl: BarlowMedium14!
    @IBOutlet private var hoursLbl: BarlowMedium40!
    @IBOutlet private var minutesLbl: BarlowMedium40!
    @IBOutlet private var secondsLbl: BarlowMedium40!
    @IBOutlet private var startBtn: UIButton!
    
    var cellModel: RecentDefaultTimerTableCellModel! {
        didSet {
            setupCell()
        }
    }
    
    weak var delegate: RecentDefaultTimerTableCellDelegate?
    
    private func setupCell() {
        nameLbl.text = cellModel.name
        hoursLbl.text = cellModel.hours.timeFormatString
        minutesLbl.text = cellModel.minutes.timeFormatString
        secondsLbl.text = cellModel.seconds.timeFormatString
    }
    
    @IBAction private func deleteBtnTapped(_ sender: Any) {
        guard let indexPath = cellModel.indexPath else {return}
        delegate?.recentDefaultTimerTableCell(self, willDeleteAt: indexPath)
    }
    
    @IBAction private func startBtnTapped(_ sender: Any) {
        guard let indexPath = cellModel.indexPath else {return}
        delegate?.recentDefaultTimerTableCell(self, willStartAt: indexPath)
    }
}
