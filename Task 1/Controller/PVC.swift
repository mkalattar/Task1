//
//  PVC.swift
//  Task 1
//
//  Created by Mohamed Attar on 06/10/2021.
//

import UIKit

class PVC: UIPageViewController {
    
    lazy var subViewControllers:[UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharityViewController") as! CharityViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OffersViewController") as! OffersViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        setViewControllerFromIndex(index: 2)
    }
    
    func setViewControllerFromIndex(index:Int) {
        self.setViewControllers([subViewControllers[index]], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
    }
}

extension PVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if currentIndex <= 0 {
            return nil
        }
        return subViewControllers[currentIndex-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if currentIndex >= subViewControllers.count-1 {
            return nil
        }
        return subViewControllers[currentIndex+1]
    }
}
