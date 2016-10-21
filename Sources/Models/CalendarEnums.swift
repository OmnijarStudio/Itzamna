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

/// Describes the types of out-date cells to be generated.
public enum OutDateCellGeneration {
    /// tillEndOfRow will generate dates till it reaches the end of a row.
    /// endOfGrid will continue generating until it has filled a 6x7 grid.
    /// Off-mode will generate no postdates
    case tillEndOfRow, tillEndOfGrid, off
}

/// Describes the types of out-date cells to be generated.
public enum InDateCellGeneration {
    /// self explanatory
    case forFirstMonthOnly, forAllMonths, off
}

/// Describes which month owns the date
public enum DateOwner: Int {
    /// Describes which month owns the date
    case thisMonth = 0,
        previousMonthWithinBoundary,
        previousMonthOutsideBoundary,
        followingMonthWithinBoundary,
        followingMonthOutsideBoundary
}

/// Selection position of a range-selected date cell
public enum SelectionRangePosition: Int {
    /// Selection position
    case left = 1, middle, right, full, none
}

/// Days of the week. By setting you calandar's first day of week,
/// you can change which day is the first for the week. Sunday is by default.
public enum DaysOfWeek: Int {
    /// Days of the week.
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
}

enum ItzamnaCalendarViewSource {
    case fromXib(String, Bundle?)
    case fromType(AnyClass)
    case fromClassName(String, Bundle?)
}
