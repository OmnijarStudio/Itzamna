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

/// Default delegate functions
public extension ItzamnaCalendarViewDelegate {

    func calendar(_ calendar: ItzamnaCalendarView,
                  canSelectDate date: Date,
                  cell: ItzamnaDayCellView,
                  cellState: CellState) -> Bool {
        return true
    }

    func calendar(_ calendar: ItzamnaCalendarView,
                  canDeselectDate date: Date,
                  cell: ItzamnaDayCellView,
                  cellState: CellState) -> Bool {
        return true
    }

    func calendar(_ calendar: ItzamnaCalendarView,
                  didSelectDate date: Date,
                  cell: ItzamnaDayCellView?,
                  cellState: CellState) {}

    func calendar(_ calendar: ItzamnaCalendarView,
                  didDeselectDate date: Date,
                  cell: ItzamnaDayCellView?,
                  cellState: CellState) {}

    func calendar(_ calendar: ItzamnaCalendarView,
                  didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {}

    func calendar(_ calendar: ItzamnaCalendarView,
                  willDisplayCell cell: ItzamnaDayCellView,
                  date: Date, cellState: CellState) {}

    func calendar(_ calendar: ItzamnaCalendarView,
                  willResetCell cell: ItzamnaDayCellView) {}

    func calendar(_ calendar: ItzamnaCalendarView,
                  willDisplaySectionHeader header: ItzamnaHeaderView,
                  range: (start: Date, end: Date), identifier: String) {}

    func calendar(_ calendar: ItzamnaCalendarView,
                  sectionHeaderIdentifierFor range: (start: Date, end: Date),
                  belongingTo month: Int) -> String {
        return ""
    }

    func calendar(_ calendar: ItzamnaCalendarView,
                  sectionHeaderSizeFor range: (start: Date, end: Date),
                  belongingTo month: Int) -> CGSize {
        return CGSize.zero
    }

}

/// The ItzamnaCalendarViewDataSource protocol is adopted by an
/// The object that mediates the application’s data model for a
/// The ItzamnaCalendarViewDataSource object. data source provides the
/// The calendar-view object with the information it needs to construct and
/// The modify it self
public protocol ItzamnaCalendarViewDataSource: class {
    /// Asks the data source to return the start and end boundary dates
    /// as well as the calendar to use. You should properly configure
    /// your calendar at this point.
    /// - Parameters:
    ///     - calendar: The JTAppleCalendar view requesting this information.
    /// - returns:
    ///     - ConfigurationParameters instance:
    func configureCalendar(
        _ calendar: ItzamnaCalendarView) -> ConfigurationParameters
}

/// The delegate of a ItzamnaCalendarView object must adopt the              .
/// ItzamnaCalendarViewDelegate protocol Optional methods of the protocol    .
/// allow the delegate to manage selections, and configure the cells         .
public protocol ItzamnaCalendarViewDelegate: class {

    /// Asks the delegate if selecting the date-cell with a specified date is
    /// allowed
    /// - Parameters:
    ///     - calendar: The JTAppleCalendar view requesting this information.
    ///     - date: The date attached to the date-cell.
    ///     - cell: The date-cell view. This can be customized at this point.
    ///     - cellState: The month the date-cell belongs to.
    /// - returns: A Bool value indicating if the operation can be done.
    func calendar(_ calendar: ItzamnaCalendarView,
                  canSelectDate date: Date,
                  cell: ItzamnaDayCellView,
                  cellState: CellState) -> Bool

    /// Asks the delegate if de-selecting the
    /// date-cell with a specified date is allowed
    /// - Parameters:
    ///     - calendar: The JTAppleCalendar view requesting this information.
    ///     - date: The date attached to the date-cell.
    ///     - cell: The date-cell view. This can be customized at this point.
    ///     - cellState: The month the date-cell belongs to.
    /// - returns: A Bool value indicating if the operation can be done.
    func calendar(_ calendar: ItzamnaCalendarView,
                  canDeselectDate date: Date,
                  cell: ItzamnaDayCellView,
                  cellState: CellState) -> Bool

    /// Tells the delegate that a date-cell with a specified date was selected
    /// - Parameters:
    ///     - calendar: The JTAppleCalendar view giving this information.
    ///     - date: The date attached to the date-cell.
    ///     - cell: The date-cell view. This can be customized at this point.
    ///             This may be nil if the selected cell is off the screen
    ///     - cellState: The month the date-cell belongs to.
    func calendar(_ calendar: ItzamnaCalendarView,
                  didSelectDate date: Date,
                  cell: ItzamnaDayCellView?,
                  cellState: CellState)
    /// Tells the delegate that a date-cell
    /// with a specified date was de-selected
    /// - Parameters:
    ///     - calendar: The JTAppleCalendar view giving this information.
    ///     - date: The date attached to the date-cell.
    ///     - cell: The date-cell view. This can be customized at this point.
    ///             This may be nil if the selected cell is off the screen
    ///     - cellState: The month the date-cell belongs to.
    func calendar(_ calendar: ItzamnaCalendarView,
                  didDeselectDate date: Date,
                  cell: ItzamnaDayCellView?,
                  cellState: CellState)

    /// Tells the delegate that the JTAppleCalendar view
    /// scrolled to a segment beginning and ending with a particular date
    /// - Parameters:
    ///     - calendar: The JTAppleCalendar view giving this information.
    ///     - startDate: The date at the start of the segment.
    ///     - endDate: The date at the end of the segment.
    func calendar(_ calendar: ItzamnaCalendarView,
                  didScrollToDateSegmentWith visibleDates: DateSegmentInfo)

    /// Tells the delegate that the JTAppleCalendar is about to display
    /// a date-cell. This is the point of customization for your date cells
    /// - Parameters:
    ///     - calendar: The JTAppleCalendar view giving this information.
    ///     - cell: The date-cell that is about to be displayed.
    ///     - date: The date attached to the cell.
    ///     - cellState: The month the date-cell belongs to.

    func calendar(_ calendar: ItzamnaCalendarView,
                  willDisplayCell cell: ItzamnaDayCellView,
                  date: Date, cellState: CellState)
    /// Tells the delegate that the JTAppleCalendar is about to reset
    /// a date-cell. Reset your cell here before being reused on screen.
    /// Make sure this function exits quicky.
    /// - Parameters:
    ///     - cell: The date-cell that is about to be reset.
    func calendar(_ calendar: ItzamnaCalendarView,
                  willResetCell cell: ItzamnaDayCellView)

    /// Implement this function to use headers in your project.
    /// Return your registered header for the date presented.
    /// - Parameters:
    ///     - date: Contains the startDate and endDate for the
    ///             header that is about to be displayed
    /// - Returns:
    ///   String: Provide the registered header you wish to show for this date
    func calendar(_ calendar: ItzamnaCalendarView,
                  sectionHeaderIdentifierFor range: (start: Date, end: Date),
                  belongingTo month: Int) -> String

    /// Implement this function to use headers in your project.
    /// Return the size for the header you wish to present
    /// - Parameters:
    ///     - date: Contains the startDate and endDate for
    ///             the header that is about to be displayed
    /// - Returns:
    ///   CGSize: Provide the size for the header
    ///           you wish to show for this date

    func calendar(_ calendar: ItzamnaCalendarView,
                  sectionHeaderSizeFor range: (start: Date, end: Date),
                  belongingTo month: Int) -> CGSize

    /// Tells the delegate that the JTAppleCalendar is about to
    /// display a header. This is the point of customization for your headers
    /// - Parameters:
    ///     - calendar: The JTAppleCalendar view giving this information.
    ///     - header: The header view that is about to be displayed.
    ///     - date: The date attached to the header.
    ///     - identifier: The identifier you provided for the header
    func calendar(_ calendar: ItzamnaCalendarView,
                  willDisplaySectionHeader header: ItzamnaHeaderView,
                  range: (start: Date, end: Date), identifier: String)
}
