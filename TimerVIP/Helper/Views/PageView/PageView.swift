
import UIKit

final class PageView: UIView {
    
    //MARK: - Outlets & Properties
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var pagingScrollView: UIScrollView!
    @IBOutlet private var pageControl: UIPageControl!
    
    private var pages: [UIView] = [] {
        didSet {
            pageControl.isHidden = pages.count <= 1
        }
    }
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    
    public var pageCount: Int {
        pages.count
    }
    
    @IBInspectable var pageSelectedColor: UIColor? {
        get {
            return pageControl.currentPageIndicatorTintColor
        }
        set { pageControl.currentPageIndicatorTintColor = newValue }
    }
    
    @IBInspectable var noneSelectedPageColor: UIColor? {
        get {
            return pageControl.tintColor
        }
        set { pageControl.pageIndicatorTintColor = newValue }
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
    
    override func layoutSubviews() {
//        pagingScrollView.isScrollEnabled = true
    }
    
    //MARK: - Functions
    private func initialSetup() {
        contentView = loadNib()
        backgroundColor = .clear
        addSubview(contentView)
        setupNibConstraints(contentView)
        setNeedsLayout()
        pagingScrollView.delegate = self
    }
    
    func addPage(_ view: UIView) {
        let index = pages.count
        self.pages.append(view)
        pageControl.numberOfPages = pages.count
        let xPos = self.pagingScrollView.frame.width * CGFloat(index)
        view.frame = CGRect(x: xPos, y: 0, width: self.pagingScrollView.frame.width, height: self.pagingScrollView.frame.height)
        pagingScrollView.contentSize.width = pagingScrollView.frame.width * CGFloat(pages.count)
        pagingScrollView.addSubview(view)
//        let xPos2 = self.pagingScrollView.frame.width * CGFloat(index)
//        let f = CGRect(x: xPos2, y: 0, width: self.pagingScrollView.frame.width, height: self.pagingScrollView.frame.height)
//        pagingScrollView.scrollRectToVisible(f, animated: false)
        layoutIfNeeded()
    }
    
    func removePage(_ view: UIView) {
        
    }
//    
//    func setUpView(images: [UIImage]) {
//        self.pages = images
//        photoPageControl.numberOfPages = images.count
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//            self.setupImages()
//            self.startTimer()
//        }
//        layoutIfNeeded()
//    }
//    
//    private func setupImages() {
//        for i in 0..<images.count {
//            let imageView = UIImageView()
//            imageView.cornerRadius = 16
//            imageView.contentMode = .scaleAspectFill
//            imageView.image = images[i]
//            let xPos = self.photoScrollView.frame.width * CGFloat(i)
//            imageView.frame = CGRect(x: xPos, y: 0, width: self.photoScrollView.frame.width, height: self.photoScrollView.frame.height)
//            photoScrollView.contentSize.width = photoScrollView.frame.width * CGFloat(i + 1)
//            photoScrollView.addSubview(imageView)
//        }
//    }
    
}


extension PageView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        currentPage = Int(pageNumber)
    }
}


