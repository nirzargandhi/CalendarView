//
//  ViewController.swift
//  CalendarViewDemo
//
//  Created by Nirzar Gandhi on 30/07/24.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: -
    // MARK: - View init Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.config()
    }
}


// MARK: -
// MARK: - Call Back
extension ViewController {
    
    fileprivate func config() {
        
        let calendarView = UICalendarView()
        calendarView.overrideUserInterfaceStyle = .light
        
        calendarView.calendar = Calendar(identifier: .gregorian)
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.fontDesign = .default
        
        
        self.view.addSubview(calendarView)
        
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calendarView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        calendarView.backgroundColor = .white
        calendarView.tintColor = UIColor.systemTeal
        
        calendarView.delegate = self
        calendarView.wantsDateDecorations = false
        calendarView.availableDateRange = DateInterval.init(start: Date.now, end: Date.distantFuture)
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
    }
}


// MARK: - UICalendarView, UICalendarSelectionSingleDate & UICalendarSelectionMultiDate Delegates
extension ViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate, UICalendarSelectionMultiDateDelegate {
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        
        guard let day = dateComponents.day else {
            return nil
        }
        
        if !day.isMultiple(of: 2) {
            return UICalendarView.Decoration.default(color: .systemGreen, size: .large)
        }
        
        return nil
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        print("Selected Date:",dateComponents ?? "No selection")
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
        return true
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
        print("Selected Date:",dateComponents)
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
        print("De-Selected Date:",dateComponents)
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canSelectDate dateComponents: DateComponents) -> Bool {
        return true
    }
    
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canDeselectDate dateComponents: DateComponents) -> Bool {
        return true
    }
}

