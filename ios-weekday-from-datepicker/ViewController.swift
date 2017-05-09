//
//  ViewController.swift
//  ios-weekday-from-datepicker
//
//  Created by Kentaro on 2017/05/10.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - @IBAction

    /// datePickerの値が変更されたら呼ばれる
    @IBAction private func didValueChangedDatePicker(_ sender: UIDatePicker) {
        print(createDateString(date: sender.date, calendar: sender.calendar))
    }

    // MARK: - 日時表示用メソッド

    /// 引数から日時の文字列を返す
    private func createDateString(date: Date, calendar: Calendar) -> String {

        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ja_JP")

        // .weekdayは1から始まるので、indexとして利用するために - 1 する
        let weekdayIndex = calendar.component(.weekday, from: date) - 1
        dateFormater.dateFormat = "M月d日 \(dateFormater.shortWeekdaySymbols[weekdayIndex]) H:mm"

        return dateFormater.string(from: date)
    }
}

