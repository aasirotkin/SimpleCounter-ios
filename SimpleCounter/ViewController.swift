//
//  ViewController.swift
//  SimpleCounter
//
//  Created by Александр Сироткин on 06.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!

    @IBOutlet weak var counterButton: UIButton!

    @IBOutlet weak var counterImageView: UIImageView!

    private let counterLabelBaseText = "Значение счётчика: "
    private let counterButtonText = "Нажми меня"
    private var counter = 0
    private let imageViewGetter: ImageViewGetter = EmojiViewGetter() as ImageViewGetter

    override func viewDidLoad() {
        super.viewDidLoad()

        counterLabel.text = getCounterLabelText()
        counterImageView.image = imageViewGetter.getImage()
        counterButton.setTitle(counterButtonText, for: .normal)
    }

    private func getCounterLabelText() -> String {
        return counterLabelBaseText + String(counter)
    }

    @IBAction func counterButtonClicked() {
        counter += 1
        counterLabel.text = getCounterLabelText()
        counterImageView.image = imageViewGetter.getImage()
    }

}
