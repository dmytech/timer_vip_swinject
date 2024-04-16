
import UIKit

final class TimePickerView: UIView {
    
    //MARK: - Outlets & Properties
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var hoursPicker: ValueDescriptionPickerView!
    @IBOutlet private var minutesPicker: ValueDescriptionPickerView!
    @IBOutlet private var secondsPicker: ValueDescriptionPickerView!
    
    private var time: TimeBase = TimeBase(hours: 0, minutes: 0, seconds: 0)
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    override func prepareForInterfaceBuilder() {
        initialSetup()
    }
    //MARK: - Functions
    private func initialSetup() {
        contentView = loadNib()
        backgroundColor = .clear
        addSubview(contentView)
        setupNibConstraints(contentView)
        setNeedsLayout()
        
        hoursPicker.valueType = .hours
        hoursPicker.pickerData = TimeConstant.hours
        hoursPicker.optionText = L.text(.time_hour_long)
        hoursPicker.delegate = self
        
        minutesPicker.valueType = .minutes
        minutesPicker.pickerData = TimeConstant.minutes
        minutesPicker.optionText = L.text(.time_min_short)
        minutesPicker.delegate = self
        
        secondsPicker.valueType = .seconds
        secondsPicker.pickerData = TimeConstant.seconds
        secondsPicker.optionText = L.text(.time_sec_short)
        secondsPicker.delegate = self
    }
    
    func getTimestampOfSelectedTimer() -> Double {
        return time.getTimeStamp()
    }
    
    private func setTime() {
        
    }
    
//    override func viewd() {
//        timePicker.subviews[1].isHidden = true
//        timePicker.subviews[2].isHidden = true
//            }
    
}

extension TimePickerView: ValueDescriptionPickerViewDelegate {
    func valueDescriptionPickerView(_ view: ValueDescriptionPickerView, didSelect value: String, valueType: ValueDescriptionPickerView.ValueType) 
    {
        switch valueType {
        case .hours:
            time.hours = Int(value) ?? 0
        case .minutes:
            time.minutes = Int(value) ?? 0
        case .seconds:
            time.seconds = Int(value) ?? 0
        }
    }
}
//
//extension TimePickerView: UIPickerViewDelegate, UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        
//                return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        20
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        120
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//        90
//    }
////    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
////        let text = NSAttributedString(string: "WOOD", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.uiWhiteHeader])
////       return text
////    }
//    
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
////        pickerView.subviews.forEach({
////                    $0.isHidden = $0.frame.height < 1.0
////                })
//        pickerView.subviews[1].isHidden = true
//        pickerView.subviews[0].subviews.first?.backgroundColor = .blue
//        pickerView.subviews[0].subviews.first?.tintColor = .green
////        pickerView.subviews[0].tintColor = .green
////        pickerView.subviews[1].tintColor = .brown
//        print("#### PICKER SUBVIEW", pickerView.subviews[0].subviews.count)
//        let label = UILabel()
//        label.font = AppFont.Barlow_Bold_28
//        label.textColor = .uiWhiteHeader
//        label.text = "Moon"
//        return label
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
////        print("#### PICKER SUBVIEW", pickerView.subviews.count)
////        let transparent = UIColor(red: 255.0 , green: 255.0, blue: 255.0, alpha: 0.0)
////        pickerView.subviews[1].isHidden = true
////        pickerView.subviews[0].backgroundColor = .cyan
////        pickerView.subviews[0].tintColor = .green
////        pickerView.subviews[1].tintColor = .brown
//        
////        pickerView.subviews[0].isHidden = true
////        pickerView.subviews[1].isHidden = true
//    }
//    
//    
//}


