
import UIKit

final class TapFieldWithIconView: UIView {
    
    //MARK: - Outlets & Properties
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var titleLbl: BarlowMedium15!
    @IBOutlet private var viewIconImgView: UIImageView!
    
    var text: String? {
        get {
            titleLbl.text
        }
        set {
            titleLbl.text = newValue
        }
    }
    
    @IBInspectable var icon: UIImage? {
        didSet {
            viewIconImgView.image = icon
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
    
    @IBAction func viewTapped(_ sender: Any) {
        
    }
}
