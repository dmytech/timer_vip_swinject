
import UIKit

protocol ValueDescriptionPickerViewDelegate: AnyObject {
    func valueDescriptionPickerView(_ view: ValueDescriptionPickerView,
                                    didSelect value: String,
                                    valueType: ValueDescriptionPickerView.ValueType)
}

final class ValueDescriptionPickerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    enum ValueType: String {
        case hours
        case minutes
        case seconds
    }
    
    //MARK: - Outlets & Properties
    @IBOutlet var contentView: UIView!
    
    @IBOutlet private var descriptionLbl: BarlowBold16!
    @IBOutlet private var lblPickerView: UIPickerView!
    
    var valueType: ValueType = .hours
    
    var pickerData: [CustomStringConvertible] = [] {
        didSet {
            setupView()
        }
    }
    
    var optionText: String = "" {
        didSet {
            descriptionLbl.text = optionText
        }
    }
    
    weak var delegate: ValueDescriptionPickerViewDelegate?
    
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
    }
    
    private func setupView() {
        lblPickerView.delegate = self
        lblPickerView.dataSource = self
        descriptionLbl.text = optionText
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        pickerView.bounds.width
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return Constants.selectionHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        pickerView.subviews[1].isHidden = true
        let label = UILabel()
        label.text = pickerData[row].description
        label.textAlignment = .right
        label.font = Constants.pickerFont
        label.textColor = Constants.fontColor
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.valueDescriptionPickerView(self, didSelect: pickerData[row].description, valueType: valueType)
    }
    
    private struct Constants {
         static let pickerFont = AppFont.Barlow_Bold_28
         static let descriptionFont = AppFont.Barlow_Bold_16
         static let fontColor: UIColor = .uiTextWhite
         static let isSelectionHides: Bool = true
         static let selectionHeight: CGFloat = 35
    }
}

