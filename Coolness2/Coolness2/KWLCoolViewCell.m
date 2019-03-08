// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "KWLCoolViewCell.h"

const UIEdgeInsets KWLTextInsets = { .top = 7, .left = 12, .bottom = 8, .right = 12 };
const CGPoint KWLTextOrigin = { .x = 12, .y = 7 };

IB_DESIGNABLE
@interface KWLCoolViewCell ()

@property (nonatomic, getter=isHighlighted) BOOL highlighted;
@property (class, nonatomic, readonly) NSDictionary *textAttributes;
@property (nonatomic) IBInspectable CGFloat borderWidth;

@end

@implementation KWLCoolViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (!(self = [super initWithCoder:aDecoder])) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    self.layer.masksToBounds = YES;
}

- (void)configureGestureRecognizers {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bounce)];
    recognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:recognizer];
}

- (void)configureLayer {
    self.layer.borderWidth = 3.0;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.cornerRadius = 10.0;
    self.layer.masksToBounds = YES;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}
- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (void)setHighlighted:(BOOL)highlighted {
    self.alpha = highlighted ? 0.5 : 1.0;
    _highlighted = highlighted;
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
}

// MARK: - Drawing and resizing

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

// MARK: - Animation

- (void)bounce {
    NSLog(@"In %s", __func__);
    [self animateBounceWithDuration:1.0 size:CGSizeMake(120.0, 240.0)];
}

- (void)configureBounceWithSize:(CGSize)size {
    [UIView setAnimationRepeatCount:3.5];
    [UIView setAnimationRepeatAutoreverses:YES];
    CGAffineTransform translation = CGAffineTransformMakeTranslation(size.width, size.height);
    self.transform = CGAffineTransformRotate(translation, M_PI_2);
}

- (void)animateFinalBounceWithDuration:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration animations:^{
        self.transform = CGAffineTransformIdentity;
    }];
}

- (void)animateBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size {
    
    [UIView animateWithDuration:duration
                     animations:^{ [self configureBounceWithSize:size]; }
                     completion:^(BOOL done) { [self animateFinalBounceWithDuration:duration]; }];
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
