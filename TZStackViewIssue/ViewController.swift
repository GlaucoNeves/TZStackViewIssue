import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Init views
        let firstView = CustomView(bgColor: UIColor.redColor())
        let secondView = CustomView(bgColor: UIColor.greenColor())

        // Init stack
        let stackView = TZStackView(arrangedSubviews: [firstView, secondView])
        stackView.distribution = .FillEqually
        stackView.axis = .Vertical

        // Add stack as subview
        view.addSubview(stackView)

        // Configure stack conastraints using SnapKit
        stackView.snp_makeConstraints { (make) -> Void in make.edges.equalTo(view) }

        // Hide second view
        secondView.hidden = true
    }
}

class CustomView: UIView {

    let topLabel = UILabel()
    let bottomLabel = UILabel()

    convenience init(bgColor: UIColor) {
        self.init(frame:CGRectZero)
        backgroundColor = bgColor
        topLabel.text = "Background color"
        bottomLabel.text = bgColor.description
        configureSubviews()
    }

    func configureSubviews() {
        addSubview(topLabel)
        addSubview(bottomLabel)

        topLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
            make.top.equalTo(self).offset(12)
        }

        bottomLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(topLabel.snp_bottom)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
            make.bottom.equalTo(self).offset(-12)
        }
    }
}

