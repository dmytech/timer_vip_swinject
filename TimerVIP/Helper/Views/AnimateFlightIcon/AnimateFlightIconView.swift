
import UIKit

final class AnimateFlightIconView: UIView {
    
    private struct Constants {
        static let size = CGSize(width: 28, height: 28)
        static let startAlpha = 0.8
        static let endAlpha = 0.1
        static let duration = 1.0
    }
    
    //MARK: - Outlets & Properties
    @IBOutlet private var iconImgView: UIImageView!
    @IBOutlet private var contentView: UIView!
    
    private var superView2: UIView?
    private var icon: UIImage?
    
    var startCenterPoint: CGPoint {
        get {
            center
        }
        set {
            center = newValue
        }
    }
    
    //MARK: - Lifecycle
    init(_ icon: UIImage, superView: UIView) {
        self.icon = icon
        self.superView2 = superView
        super.init(frame: CGRect(origin: .zero, size: Constants.size))
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
        iconImgView.contentMode = .scaleToFill
        iconImgView.image = icon
        alpha = Constants.startAlpha
    }
    
    func moveTo(center point: CGPoint, completion: Closure? = nil) {
        superView2?.insertSubview(self, at: 0)
        UIView.animate(withDuration: Constants.duration, animations: {
            self.alpha = Constants.endAlpha
            self.center = point
        }) { _ in
            self.removeFromSuperview()
            completion?()
        }
    }
}
