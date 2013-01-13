//
//  MIBlock.m
//  MatchIt
//
//  Created by Bill on 12-12-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MIBlock.h"
#import "MIBlockDelegate.h"

@implementation MIBlock

@synthesize blockSprite;
@synthesize selected;
@synthesize delegate;
@synthesize blockPosition;

#pragma mark - init

-(id)init{
    if(self=[super init]){
        blockSprite=[[[CCSprite alloc]init]autorelease];
        self.selected=NO;
        blockPosition=MIPositionMake(-1, -1);
    }
    return self;
}

+(id)block{
    return [[[self alloc] init]autorelease];
}

-(id)initWithSpriteFrameName:(NSString*)spriteFrameName{
    if(self=[self init]){
        blockSprite=[[[CCSprite alloc]initWithSpriteFrameName:spriteFrameName]autorelease];
    }
    return self;
}

+(id)blockWithSpriteFrameName:(NSString*)spriteFrameName{
    return [[[self alloc]initWithSpriteFrameName:spriteFrameName]autorelease];
}

-(id)initWithBlockPosition:(struct MIPosition)position_{
    if(self=[self init]){
        blockPosition=position_;
    }
    return self;
}

+(id)blockWithBlockPosition:(struct MIPosition)position_{
    return [[[self alloc]initWithBlockPosition:position_]autorelease];
}

#pragma mark - Blocks Management

-(void)setBlockSpriteFrameWithFileName:(NSString*)spriteFrameName{
    [blockSprite setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:spriteFrameName]];
}

-(void)blockBeingSelected{
    self.selected=!self.selected;
    if(delegate){
        [delegate blockBeingSelected:self Index:MIPositionToIndex(blockPosition.x, blockPosition.y) NowSelected:self.selected];
    }
}

#pragma mark - Memory Management

-(void)dealloc{
    [delegate release];
    [super dealloc];
}

@end