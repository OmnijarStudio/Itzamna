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

func delayRunOnMainThread(_ delay: Double, closure: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() +
            Double(Int64(delay * Double(NSEC_PER_SEC))) /
            Double(NSEC_PER_SEC), execute: closure)
}

func delayRunOnGlobalThread(_ delay: Double,
                            qos: DispatchQoS.QoSClass,
                            closure: @escaping () -> ()) {
    DispatchQueue.global(qos: qos).asyncAfter(
        deadline: DispatchTime.now() +
            Double(Int64(delay * Double(NSEC_PER_SEC))) /
            Double(NSEC_PER_SEC), execute: closure
    )
}

extension Date {

    static func startOfMonth(for date: Date,
                             using calendar: Calendar) -> Date? {
        let dayOneComponents =
            calendar.dateComponents([.era, .year, .month], from: date)
        return calendar.date(from: dayOneComponents)
    }

    static func endOfMonth(for date: Date,
                           using calendar: Calendar) -> Date? {
        var lastDayComponents =
            calendar.dateComponents([.era, .year, .month], from: date)
        lastDayComponents.month = lastDayComponents.month! + 1
        lastDayComponents.day = 0
        return calendar.date(from: lastDayComponents)
    }

}

extension Dictionary where Value: Equatable {

    func key(for value: Value) -> Key? {
        guard let index = index(where: { $0.1 == value }) else {
            return nil
        }
        return self[index].0
    }

}
