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

internal protocol ItzamnaReusableViewProtocol: class {
    associatedtype ViewType: UIView
    func setupView(_ cellSource: ItzamnaCalendarViewSource)
    var view: ViewType? {get set}
}

extension ItzamnaReusableViewProtocol {

    func setupView(_ cellSource: ItzamnaCalendarViewSource) {
        if let nonNilView = view {
            nonNilView.setNeedsLayout()
            return
        }
        switch cellSource {
        case let .fromXib(xibName, bundle):
            let bundleToUse = bundle ?? Bundle.main
            let viewObject = bundleToUse
                .loadNibNamed(xibName, owner: self, options: [:])
            guard let view = viewObject?[0] as? ViewType else {
                print("xib: \(xibName), " +
                    "file class does not conform to the ItzamnaViewProtocol")
                assert(false)
                return
            }
            self.view = view
            break
        case let .fromClassName(className, bundle):
            let bundleToUse = bundle ?? Bundle.main
            guard let theCellClass =
                bundleToUse.classNamed(className) as? ViewType.Type else {
                    print("Error loading registered class: '\(className)'")
                    print("Make sure that: \n\n(1) It is a subclass of: " +
                        "'UIView' and conforms to 'ItzamnaViewProtocol'")
                    print("(2) You registered your class using the fully " +
                        "qualified name like so --> " +
                        "'theNameOfYourProject.theNameOfYourClass'\n")
                    assert(false)
                    return
            }
            self.view = theCellClass.init()
            break
        case let .fromType(cellType):
            guard let theCellClass = cellType as? ViewType.Type else {
                print("Error loading registered class: '\(cellType)'")
                print("Make sure that: \n\n(1) It is a subclass of: " +
                    "'UIView' and conforms to 'ItzamnaViewProtocol'\n")
                assert(false)
                return
            }
            self.view = theCellClass.init()
            break
        }
        guard
            let validSelf = self as? UIView,
            let validView = view else {
                print("Error setting up views. \(developerErrorMessage)")
                return
        }
        validSelf.addSubview(validView)
    }

}
