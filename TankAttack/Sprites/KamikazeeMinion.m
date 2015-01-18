//
//  KamikazeeMinion.m
//  TankAttack
//
//  Created by Ruslan Ardashev on 1/17/15.
//  Copyright (c) 2015 Ruslan Ardashev. All rights reserved.
//

#import "KamikazeeMinion.h"

@implementation KamikazeeMinion

- (id)initWithX:(double)x WithY:(double)y IntoWorld:(World *)world {
    
    self = [super initWithImageNamed:MINION_IMAGE_NAME];
    
    if (self) {
        
        
        [self initHealthBar];
        [self setPosition:CGPointMake(x, y)];
        [self setScale:SMALL_TANK_SCALE_FACTOR];
        
        [world addChild:self];
        return self;
        
    }
    
    else {
        
        return nil;
        
    }
    
}

- (void)replaceImageWithFire {
    
    [self setTexture:[SKTexture textureWithImageNamed:@"bossDeath"]];
    
}

- (void)initHealthBar {
    
    HealthBar *hb;
    
    if ([GameViewController difficulty] == 1) {
        
        hb = [[HealthBar alloc] initWithHealth:50.0 WithParentWidth:self.size.width WithParentHeight:self.size.height WithParent:self];
        
    }
    
    else if ([GameViewController difficulty] == 2) {
        
        hb = [[HealthBar alloc] initWithHealth:100.0 WithParentWidth:self.size.width WithParentHeight:self.size.height WithParent:self];
        
    }
    
    else if ([GameViewController difficulty] == 3) {
        
        hb = [[HealthBar alloc] initWithHealth:200.0 WithParentWidth:self.size.width WithParentHeight:self.size.height WithParent:self];
        
    }
    
    [self setHealthBar:hb];
    
}

- (void)updateEnemyXYWithPlayerX:(CGFloat)playerX WithPlayerY:(CGFloat)playerY {
    
    if (![self isAlive]) {
        
        return;
        
    }
    
    [self updateX:playerX];
    [self updateY:playerY];
    
}

- (void)updateX:(CGFloat)playerX {
    
    // Eliminate jitter
    if (ABS(playerX - [self position].x) < 1) {
        
        return;
        
    }
    
    else if (playerX > [self position].x) {
        
        [self goRight];
        
    }
    
    else {
        
        [self goLeft];
        
    }
    
}

- (void)updateY:(CGFloat)playerY {
    
    // Eliminate jitter
    if (ABS(playerY - [self position].y) < 1) {
        
        return;
        
    }
    
    else if (playerY > [self position].y) {
        
        [self goUp];
        
    }
    
    else {
        
        [self goDown];
        
    }
    
}

- (void)goUp {
    
    CGPoint newPosition = CGPointMake([self position].x, [self position].y+ KAMIKAZEE_MINION_SPEED);
    [self setPosition:newPosition];
    
}

- (void)goDown {
    
    CGPoint newPosition = CGPointMake([self position].x, [self position].y- KAMIKAZEE_MINION_SPEED);
    [self setPosition:newPosition];
    
}

- (Boolean)isFiring {
    
    return false;
    
}

- (void)goRight {
    
    CGPoint newPosition = CGPointMake([self position].x + BOSS_SPEED, [self position].y);
    [self setPosition:newPosition];
    
}

- (void)goLeft {
    
    CGPoint newPosition = CGPointMake([self position].x - BOSS_SPEED, [self position].y);
    [self setPosition:newPosition];
    
}

@end



















