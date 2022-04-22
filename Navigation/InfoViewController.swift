//
//  InfoViewController.swift
//  Navigation
//
//  Created by apple on 14.04.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        makebutton()
        
    }
    private func makebutton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        button.backgroundColor = .systemGray6
        button.center = view.center
        button.backgroundColor = .black
        button.setTitle("Назад", for: .normal)
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc private func tapAction() {
        let alert = UIAlertController(title: "Вернуться назад", message: "Вы точно хотите вернуться назад?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Выйти", style: .default) { _ in
            self.dismiss(animated: true)
            print("Нажата кнопка Выйти")
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            print("Нажата кнопка Отмена")
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
}
