
import UIKit

final class InputFieldWithIconView: UIView {
    
    //MARK: - Outlets & Properties
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var editableIconImgView: UIImageView!
    @IBOutlet private var inputField: UITextField!
    @IBOutlet private var arrowImgView: UIImageView!
    
    var text: String? {
        get {
            inputField.text
        }
        set {
            inputField.text = newValue
        }
    }
    
    @IBInspectable var icon: UIImage? {
        didSet {
            editableIconImgView.image = icon
        }
    }
    
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
    
    private func makeTappable() {
        
    }
    
}
