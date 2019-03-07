// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "KWLCoolViewCell.h"

const UIEdgeInsets KWLTextInsets = { .top = 7, .left = 12, .bottom = 8, .right = 12 };
const CGPoint KWLTextOrigin = { .x = 12, .y = 7 };

@interface KWLCoolViewCell ()

@property (nonatomic, getter=isHighlighted) BOOL highlighted;
@property (class, nonatomic, readonly) NSDictionary *textAttributes;

@end

@implementation KWLCoolViewCell

//@synthesize highlighted = _highlighted;

- (void)setHighlighted:(BOOL)highlighted {
    self.alpha = highlighted ? 0.5 : 1.0;
    _highlighted = highlighted;
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [self.text sizeWithAttributes:self.class.textAttributes];
    newSize.width += KWLTextInsets.left + KWLTextInsets.right;
    newSize.height += KWLTextInsets.top + KWLTextInsets.bottom;
    return newSize;
}

+ (NSDictionary *)textAttributes {
    static NSDictionary *attributes;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        attributes = @{ NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
                        NSForegroundColorAttributeName : UIColor.whiteColor };
    });
    return attributes;
//    return @{ NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
//              NSForegroundColorAttributeName : UIColor.whiteColor };
}

- (void)drawRect:(CGRect)rect {
    [self.text drawAtPoint:KWLTextOrigin withAttributes:self.class.textAttributes];
}

@end


// MARK: - UIResponder methods

@implementation KWLCoolViewCell (KWLTouchHandling)

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.superview bringSubviewToFront:self];
    self.highlighted = YES;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:nil];
    CGPoint prevLocation = [touch previousLocationInView:nil];
    
    CGPoint newLocation = self.center;
    newLocation.x += currLocation.x - prevLocation.x;
    newLocation.y += currLocation.y - prevLocation.y;
    self.center = newLocation;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

@end
