//
//  ViewController.h
//  PDFCreater
//
//  Created by Shankar Mallick on 11/04/16.
//  Copyright © 2016 Customer First. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>
{
    NSMutableArray *arr4name;
    __weak IBOutlet UITableView *tblVw4datashow;
    NSString *str4name;
    NSString *strSoclNtwrk;
    NSString *strSchlName;
    NSString *streducatnQlfctn;
    NSString *strjbPrfl;
    NSString *strcmpnyNm;
    NSString *strClgNm;
    NSString *strprflNM;
    NSString *strcmnts;
    UIView *vw4dropdown;
    NSMutableArray *arr4sclNtwrk;
    NSMutableArray *arr4EductnQualification;
    NSMutableArray *arrjbPrfl;
    int selectedIndexpath;
    
}
@end

