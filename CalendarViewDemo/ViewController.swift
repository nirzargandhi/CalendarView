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
        
        if #available(iOS 16.0, *) {
            
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
            
            calendarView.backgroundColor = .white//UIColor(hex: "#1E1E1E", alpha: 1.0)
            calendarView.tintColor = UIColor.systemTeal
            
            calendarView.delegate = self
            calendarView.wantsDateDecorations = false
            calendarView.availableDateRange = DateInterval.init(start: Date.now, end: Date.distantFuture)
            
            let dateSelection = UICalendarSelectionSingleDate(delegate: self)
            calendarView.selectionBehavior = dateSelection
        }
    }
}


// MARK: - UICalendarView, UICalendarSelectionSingleDate & UICalendarSelectionMultiDate Delegates
extension ViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate, UICalendarSelectionMultiDateDelegate {
    
    @available(iOS 16.0, *)
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        
        guard let day = dateComponents.day else {
            return nil
        }
        
        if !day.isMultiple(of: 2) {
            return UICalendarView.Decoration.default(color: .systemGreen, size: .large)
        }
        
        return nil
    }
    
    fileprivate func addActivityCircle() -> UIView {
        
        let view = UIView()
        view.backgroundColor = .red
        view.clipsToBounds = false
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        return view
    }
    
    @available(iOS 16.0, *)
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        print("Selected Date:",dateComponents ?? "No selection")
    }
    
    @available(iOS 16.0, *)
    func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
        return true
    }
    
    @available(iOS 16.0, *)
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
        print("Selected Date:",dateComponents)
    }
    
    @available(iOS 16.0, *)
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
        print("De-Selected Date:",dateComponents)
    }
    
    @available(iOS 16.0, *)
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canSelectDate dateComponents: DateComponents) -> Bool {
        return true
    }
    
    @available(iOS 16.0, *)
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canDeselectDate dateComponents: DateComponents) -> Bool {
        return true
    }
}

