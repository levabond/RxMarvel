//
//  HeroListViewModel.swift
//  FunctionalMarvel
//
//  Created by Segii Shulga on 10/8/15.
//  Copyright © 2015 Sergey Shulga. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct HeroListViewModel {
   
   let title:Variable<String>
   let thumbnailType = ThumbnailType.portraitSmall
   let thumbnailPath:Variable<NSURL>
   
   init(hero:Hero) {
      self.title = Variable(hero.name)
      self.thumbnailPath = Variable(NSURL(string:hero.thumbnail.pathForType(self.thumbnailType))!)
   }
   
   static func transform(heroes:[Hero]) -> [HeroListViewModel] {
      return heroes.map(HeroListViewModel.init)
   }
   
}

extension HeroListViewModel:VariableProvidable {
   var variable:Variable<VariableProvidable> {
      return Variable(self)
   }
}

extension HeroListViewModel:ReuseableViewClassProvidable {
   var reusableViewClass:ReusableView.Type {
      return HeroListTableViewCell.self
   }
}



