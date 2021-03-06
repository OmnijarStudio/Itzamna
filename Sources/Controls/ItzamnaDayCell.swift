/**
 The MIT License (MIT)
 Copyright (c) 2016 Omnijar Studio
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

/// The ItzamnaDayCell class defines the attributes and
/// behavior of the cells that appear in ItzamnaCalendarView objects.
open class ItzamnaDayCell: UICollectionViewCell, ItzamnaReusableViewProtocol {

	var view: ItzamnaDayCellView?

    func updateCellView(_ cellInsetX: CGFloat, cellInsetY: CGFloat) {
        let vFrame = self.frame.insetBy(dx: cellInsetX, dy: cellInsetY)
        view!.frame = vFrame
        view!.center = CGPoint(x: self.bounds.size.width * 0.5,
                               y: self.bounds.size.height * 0.5)
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	/// Returns an object initialized from data in a given unarchiver.
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

}
