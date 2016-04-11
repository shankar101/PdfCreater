//
//  PCPdfShow.m
//  PDFCreater
//
//  Created by Shankar Mallick on 11/04/16.
//  Copyright © 2016 Shankar_iOS. All rights reserved.
//

#import "PCPdfShow.h"
#import "PDFRenderer.h"

@interface PCPdfShow ()

@property (weak, nonatomic) IBOutlet UIWebView *wbVw4pdf;
- (IBAction)Back_Press:(id)sender;
- (IBAction)sendPdfThrowMail:(id)sender;
@end

@implementation PCPdfShow

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* fileName = [self getPDFFileName];
    
    [[PDFRenderer sharedaplication] drawPDF:fileName withHdrNme:_str4Hdr withBody:_str4Bdy];
    [self showPDFFile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(NSString*)getPDFFileName
{
    NSString* fileName = [NSString stringWithFormat:@"%@.PDF",_str4PdfName];//@"Invoice.PDF";
    
    NSArray *arrayPaths =
    NSSearchPathForDirectoriesInDomains(
                                        NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    NSString *path = [arrayPaths objectAtIndex:0];
    NSString* pdfFileName = [path stringByAppendingPathComponent:fileName];
    
    return pdfFileName;
    
}

-(void)showPDFFile
{
    NSString* fileName = [NSString stringWithFormat:@"%@.PDF",_str4PdfName];//@"Invoice.PDF";
    
    NSArray *arrayPaths =
    NSSearchPathForDirectoriesInDomains(
                                        NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    NSString *path = [arrayPaths objectAtIndex:0];
    NSString* pdfFileName = [path stringByAppendingPathComponent:fileName];
    
    
    
    NSURL *url = [NSURL fileURLWithPath:pdfFileName];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_wbVw4pdf setScalesPageToFit:YES];
    [_wbVw4pdf loadRequest:request];
    
}
- (IBAction)Back_Press:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sendPdfThrowMail:(id)sender {
    if ([MFMailComposeViewController canSendMail])
        
    {
        MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
        picker.mailComposeDelegate = self;
        
        [picker setSubject:@"mail test"];
        [picker setToRecipients:[NSArray arrayWithObjects:@"imstkgp@gnail.com", nil]];
        [picker setMessageBody:@"Hello bro" isHTML:NO];
        NSString* fileName = [NSString stringWithFormat:@"%@.PDF",_str4PdfName];
        NSArray *arrayPaths =
        NSSearchPathForDirectoriesInDomains(
                                            NSDocumentDirectory,
                                            NSUserDomainMask,
                                            YES);
        NSString *path = [arrayPaths objectAtIndex:0];
        NSString* pdfFileName = [path stringByAppendingPathComponent:fileName];
        NSData *myData = [NSData dataWithContentsOfFile:pdfFileName];
        
        [picker addAttachmentData:myData mimeType:@"application/pdf" fileName:@"the PDF"];
        //[self presentModalViewController:picker animated:YES];
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }
    
}
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"You sent the email.");
            [self dismissViewControllerAnimated:YES completion:NULL];
            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved a draft of this email");
            [self dismissViewControllerAnimated:YES completion:NULL];
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"You cancelled sending this email.");
            [self dismissViewControllerAnimated:YES completion:NULL];
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed:  An error occurred when trying to compose this email");
            [self dismissViewControllerAnimated:YES completion:NULL];
            break;
        default:
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }
    
    
}


@end
