//
//  SlidesModel.swift
//  Record
//
//  Created by Алешка on 7.05.22.
//

import Foundation

class SlidesModel {
    
    func getSlides()-> [Slides] {
        
        var slides: [Slides] = []
        
        let slide1 = Slides(id:1, text: "Что разум человека может постигнуть и во что он может поверить, того он способен достичь.", img: #imageLiteral(resourceName: "Slider") )
        let slide2 = Slides(id:2, text: "Ваше время ограничено, не тратьте его, живя чужой жизнью.", img: #imageLiteral(resourceName: "hulk") )
        let slide3 = Slides(id:3, text: " Два самых важных дня в твоей жизни: день, когда ты появился на свет, и день, когда понял, зачем.", img: #imageLiteral(resourceName: "wonderwoman") )
        slides.append(slide1)
        slides.append(slide2)
        slides.append(slide3)
        return slides
    }
}
