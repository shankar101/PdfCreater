//
//  PDFRenderer.h
//  PDFRenderer
//
//  Created by Ray Wenderlich on 12/5/11.
//  Copyright (c) Shankar_iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import <UIKit/UIKit.h>

@interface PDFRenderer : NSObject

-(void)drawPDF:(NSString*)fileName withHdrNme:(NSString *)strHdr withBody:(NSString *)strBdy;
+ (id) sharedaplication;
@end
