//
//  StringEmojiHelper.swift
//  SimpleCounter
//
//  Created by Александр Сироткин on 06.11.2022.
//

import Foundation
import UIKit

protocol ImageViewGetter {
    func getImage() -> UIImage?
}

private func getStringEmojiList() -> [String] {
    var stringEmojiList: [String] = []
    for value in 0x1F601...0x1F64F {
        guard let unicodeScalarValue = UnicodeScalar(value) else {
            continue
        }
        stringEmojiList.append(String(unicodeScalarValue))
    }
    return stringEmojiList
}

private extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 40, height: 40)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.white.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 40)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

class EmojiViewGetter : ImageViewGetter {

    private let stringEmojiList = getStringEmojiList()
    private var counter = 0

    func getImage() -> UIImage? {
        if counter == stringEmojiList.count {
            counter = 0
        }
        let emojiText = stringEmojiList[counter]
        counter += 1
        return emojiText.image()!
    }

}
