import Foundation
import MondrianLayout
import SnapshotTesting
import XCTest

final class SizingTests: XCTestCase {

  func test_sizing() {
    let view =  ExampleView(width: 200, height: 200) { (view: UIView) in
      view.mondrian.buildSubviews {
        ZStackBlock {

          HStackBlock {
            VStackBlock(alignment: .leading) {
              UIView.mock(
                backgroundColor: .layeringColor,
                preferredSize: .init(width: 36, height: 36)
              )
              .viewBlock
              .alignSelf(.fill)

              UIView.mock(
                backgroundColor: .layeringColor,
                preferredSize: .init(width: 36, height: 36)
              )
              .viewBlock
              .alignSelf(.fill)
            }
            .width(20)

            VStackBlock(alignment: .leading) {
              UIView.mock(
                backgroundColor: .layeringColor,
                preferredSize: .init(width: 36, height: 36)
              )
              .viewBlock
              .alignSelf(.fill)

              UIView.mock(
                backgroundColor: .layeringColor,
                preferredSize: .init(width: 36, height: 36)
              )
              .viewBlock
              .alignSelf(.fill)
            }
            .width(40)

            UIView.mock(
              backgroundColor: .layeringColor,
              preferredSize: .init(width: 36, height: 36)
            )
            .viewBlock
            .padding(10)
            .width(.max(30))

          }
          .height(50)

        }
      }
    }
    assertSnapshot(matching: view, as: .image, record: _record)
  }

}
