
import UIKit

protocol TimerCountActionViewDelegate: AnyObject {
    func timerCountActionView(_ view: TimerCountActionView, viewDidTap: Void)
}

@IBDesignable final class TimerCountActionView: UIView {
    
    //MARK: - Outlets & Properties
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var countLbl: UILabel!
    
    weak var delegate: TimerCountActionViewDelegate?
    
    var counts: Int {
        get {
            let counts = countLbl.text ?? "0"
            return Int(counts) ?? 0
        }
        set {
            countLbl.text = "\(newValue)"
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
        
        contentView.layer.cornerRadius = bounds.width / 2
    }
    
    @IBAction func tapAction(_ sender: Any) {
        delegate?.timerCountActionView(self, viewDidTap: ())
    }
}
