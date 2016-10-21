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


protocol ItzamnaCalendarDelegateProtocol: class {
    var itemSize: CGFloat? {get set}
    var registeredHeaderViews: [ItzamnaCalendarViewSource] {get set}
    var cachedConfiguration: ConfigurationParameters {get set}
    var monthInfo: [Month] {get set}
    var monthMap: [Int: Int] {get set}
    var totalDays: Int {get}
    func numberOfRows() -> Int
    func cachedDate() -> (start: Date, end: Date, calendar: Calendar)
    func numberOfMonthsInCalendar() -> Int
    func numberOfPreDatesForMonth(_ month: Date) -> Int

    func referenceSizeForHeaderInSection(_ section: Int) -> CGSize
    func firstDayIndexForMonth(_ date: Date) -> Int
    func rowsAreStatic() -> Bool
    func preDatesAreGenerated() -> InDateCellGeneration
    func postDatesAreGenerated() -> OutDateCellGeneration
}

extension ItzamnaCalendarView: ItzamnaCalendarDelegateProtocol {

    func cachedDate() -> (start: Date, end: Date, calendar: Calendar) {
        return (start: cachedConfiguration.startDate,
                end: cachedConfiguration.endDate,
                calendar: cachedConfiguration.calendar)
    }

    func numberOfRows() -> Int {
        return cachedConfiguration.numberOfRows
    }

    func numberOfMonthsInCalendar() -> Int {
        return numberOfMonths
    }

    func numberOfPreDatesForMonth(_ month: Date) -> Int {
        return firstDayIndexForMonth(month)
    }

    func preDatesAreGenerated() -> InDateCellGeneration {
        return cachedConfiguration.generateInDates
    }

    func postDatesAreGenerated() -> OutDateCellGeneration {
        return cachedConfiguration.generateOutDates
    }

    func referenceSizeForHeaderInSection(_ section: Int) -> CGSize {
        return calendarViewHeaderSizeForSection(section)
    }

    func rowsAreStatic() -> Bool {
        // jt101 is the inDateCellGeneration check needed? because tillEndOfGrid will always compenste
        return cachedConfiguration.generateInDates != .off &&
            cachedConfiguration.generateOutDates == .tillEndOfGrid
    }

}
