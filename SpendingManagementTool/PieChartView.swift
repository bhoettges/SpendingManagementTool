//
//  PieChartView.swift
//  SpendingManagementTool
//
//  Created by Balthasar Hoettges on 13/05/2021.
//  Inspired by hamishknight on github https://github.com/hamishknight/Pie-Chart-View
//

import UIKit


struct Segment {

  var color: UIColor

 var name: String

  var value: CGFloat
}

class PieChartView : UIView {

  var segments = [Segment]() {
    didSet {
      setNeedsDisplay() //
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    initialize()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initialize()
  }

  private func initialize() {

    isOpaque = false
  }


  override func draw(_ rect: CGRect) {

    guard let ctx = UIGraphicsGetCurrentContext() else { return }

    let radius = min(frame.size.width, frame.size.height) * 0.4

    let viewCenter = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)

    let valueCount = segments.reduce(0, {$0 + $1.value})

    var startAngle = -CGFloat.pi * 0.5

    for segment in segments {

        ctx.setFillColor(segment.color.cgColor)

      let endAngle = startAngle + 2 * .pi * (segment.value / valueCount)

      ctx.move(to: viewCenter)

    
      ctx.addArc(center: viewCenter, radius: radius,
                 startAngle: startAngle, endAngle: endAngle, clockwise: false)

      ctx.fillPath()

      startAngle = endAngle
    }
  }
}
