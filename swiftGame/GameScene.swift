//
//  GameScene.swift
//  swiftGame
//
//  Created by Julien Xu on 19/06/2018.
//  Copyright © 2018 Julien. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var boss = SKSpriteNode()
    private var bossFrames: [SKTexture] = []
    
    override func didMove(to view: SKView) {
        buildBoss()
        animateBoss()
    }
    
    func buildBoss() {
        
        let bossAnimatedAtlas = SKTextureAtlas(named: "cagney_first")
        var Frames: [SKTexture] = []
        var numFrame: String

        for i in 1...bossAnimatedAtlas.textureNames.count {
            
            if i < 10 {
                numFrame = "0\(i)"
            }else{
                numFrame = "\(i)"
            }
            
            let bossTextureName = "frame-\(numFrame)"
            Frames.append(bossAnimatedAtlas.textureNamed(bossTextureName))
        
        }
        
        bossFrames = Frames
        
        let firstFrameTexture = bossFrames[0]
        boss = SKSpriteNode(texture: firstFrameTexture)
        boss.position = CGPoint(x: frame.maxX - 170, y: frame.midY)
        addChild(boss)
        
    }
    
    func animateBoss() {
        boss.run(SKAction.repeatForever(
            SKAction.animate(with: bossFrames,
                             timePerFrame: 0.1,
                             resize: false,
                             restore: true)),
                 withKey:"walkingInPlaceBear")
    }
    
    //SKPhysicContactDelegate
    func didBegin(_ contact: SKPhysicsContact)
    {
    
    }
    
}
