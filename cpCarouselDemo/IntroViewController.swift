//
//  IntroViewController.swift
//  cpCarouselDemo
//
//  Created by Anthony Devincenzi on 2/9/16.
//  Copyright © 2016 Anthony Devincenzi. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImage: UIImageView!
    
    @IBOutlet weak var tileOne: UIImageView!
    @IBOutlet weak var tileTwo: UIImageView!
    @IBOutlet weak var tileThree: UIImageView!
    @IBOutlet weak var tileFour: UIImageView!
    @IBOutlet weak var tileFive: UIImageView!
    @IBOutlet weak var tileSix: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        introScrollView.delegate = self
        introScrollView.contentSize = introImage.image!.size
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    struct tileView {

        var xStart:CGFloat
        var xEnd:CGFloat
        var yStart:CGFloat
        var yEnd:CGFloat
        let scaleStart:CGFloat
        let scaleEnd:CGFloat
        let rotationStart:CGFloat
        let rotationEnd:CGFloat
    }
    
    var tilesById = [ Int: tileView ]()
    
    
    func animateTile(scrollView: UIScrollView, tile: UIView)
    {
        
        //Define all tile params
        tilesById[1] = tileView(xStart:-75, xEnd: 0, yStart: 140, yEnd: 440, scaleStart: 1, scaleEnd: 1, rotationStart: -10, rotationEnd: 0)
        tilesById[2] = tileView(xStart:10, xEnd: 0, yStart: 120, yEnd: 440, scaleStart: 1.3, scaleEnd: 1, rotationStart: -10, rotationEnd: 0)
        tilesById[3] = tileView(xStart:10, xEnd: 0, yStart: 0, yEnd: 440, scaleStart: 1.5, scaleEnd: 1, rotationStart: 15, rotationEnd: 0)
        tilesById[4] = tileView(xStart:70, xEnd: 0, yStart: -15, yEnd: 440, scaleStart: 1.5, scaleEnd: 1, rotationStart: 15, rotationEnd: 0)
        tilesById[5] = tileView(xStart:-75, xEnd: 0, yStart: -30, yEnd: 440, scaleStart: 1.7, scaleEnd: 1, rotationStart: 12, rotationEnd: 0)
        tilesById[6] = tileView(xStart:-45, xEnd: 0, yStart: -60, yEnd: 440, scaleStart: 1.5, scaleEnd: 1, rotationStart: -11, rotationEnd: 0)
        
        let scrollStart:CGFloat = -20
        let scrollEnd:CGFloat = 568
        
        
        var currentIndex = 0
        
        //Set index for array based on tile passed in
        switch tile {
        case tileOne:
            currentIndex = 1
        case tileTwo:
            currentIndex = 2
        case tileThree:
            currentIndex = 3
        case tileFour:
            currentIndex = 4
        case tileFive:
            currentIndex = 5
        case tileSix:
            currentIndex = 6
        default:
            break
        }
        
        //Define all states from array
        let xStart:CGFloat = tilesById[currentIndex]!.xStart
        let xEnd:CGFloat = tilesById[currentIndex]!.xEnd
        let yStart:CGFloat = tilesById[currentIndex]!.yStart
        let yEnd:CGFloat = tilesById[currentIndex]!.yEnd
        let scaleStart:CGFloat = tilesById[currentIndex]!.scaleStart
        let scaleEnd:CGFloat = tilesById[currentIndex]!.scaleEnd
        let rotationStart:CGFloat = tilesById[currentIndex]!.rotationStart
        let rotationEnd:CGFloat = tilesById[currentIndex]!.rotationEnd
        
        //Position
        let posY = convertValue(scrollView.contentOffset.y, r1Min: scrollStart, r1Max: scrollEnd, r2Min: yStart, r2Max: yEnd)
        let posX = convertValue(scrollView.contentOffset.y, r1Min: scrollStart, r1Max: scrollEnd, r2Min: xStart, r2Max: xEnd)
        let translation = CGAffineTransformMakeTranslation(posX, posY)
        
        //Scale
        let converedScale = convertValue(scrollView.contentOffset.y, r1Min: scrollStart, r1Max: scrollEnd, r2Min: scaleStart, r2Max: scaleEnd)
        let scale = CGAffineTransformMakeScale(converedScale, converedScale)
        
        //Rotation
        let convertedRotation = convertValue(scrollView.contentOffset.y, r1Min: scrollStart, r1Max: scrollEnd, r2Min:rotationStart, r2Max:rotationEnd)
        let rotation = CGAffineTransformMakeDegreeRotation(convertedRotation)
        
        //Transform the tile
        tile.transform = CGAffineTransformConcat(translation, CGAffineTransformConcat(rotation, scale))
    }
    

    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        animateTile(scrollView, tile: tileOne);
        animateTile(scrollView, tile: tileTwo);
        animateTile(scrollView, tile: tileThree);
        animateTile(scrollView, tile: tileFour);
        animateTile(scrollView, tile: tileFive);
        animateTile(scrollView, tile: tileSix);

    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    }

}
