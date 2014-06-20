//
//  Hex_Clock_ScreensaverView.m
//  Hex Clock Screensaver
//
//  Created by Takeru Chuganji on 2014/06/20.
//  Copyright (c) 2014年 Takeru Chuganji. All rights reserved.
//

#import "Hex_Clock_ScreensaverView.h"
#import <WebKit/WebKit.h>

@interface Hex_Clock_ScreensaverView ()
@property (nonatomic, weak) WebView *webView;
@end

@implementation Hex_Clock_ScreensaverView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        self.wantsLayer = YES;
        CALayer *layer = [CALayer layer];
        layer.frame = self.bounds;
        layer.backgroundColor = [NSColor blackColor].CGColor;
        self.layer = layer;
        
        WebView *webView = [[WebView alloc] initWithFrame:self.bounds];
        webView.wantsLayer = YES;
        webView.frameLoadDelegate = self;
        webView.alphaValue = 0;
        [webView.mainFrame loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.jacopocolo.com/hexclock/"]]];
        [self addSubview:webView];
        self.webView = webView;
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
{
    if (frame == self.webView.mainFrame) {
        self.webView.animator.alphaValue = 1;
    }
}

@end
