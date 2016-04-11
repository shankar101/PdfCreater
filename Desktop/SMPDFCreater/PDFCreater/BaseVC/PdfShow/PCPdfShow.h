//
//  PCPdfShow.h
//  PDFCreater
//
//  Created by Shankar Mallick on 11/04/16.
//  Copyright © 2016 Customer First. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface PCPdfShow : UIViewController<MFMailComposeViewControllerDelegate,UINavigationControllerDelegate>
{
    
}
@property(nonatomic,strong)NSString *str4Bdy;
@property(nonatomic,strong)NSString *str4Hdr;
@property(nonatomic,strong)NSString *str4PdfName;

@end
