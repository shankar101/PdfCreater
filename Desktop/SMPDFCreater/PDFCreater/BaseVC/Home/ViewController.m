//
//  ViewController.m
//  PDFCreater
//
//  Created by Shankar Mallick on 11/04/16.
//  Copyright © 2016 Shankar_iOS. All rights reserved.
//

#import "ViewController.h"
#import "PCPdfShow.h"

@interface ViewController ()
- (IBAction)createPdf:(id)sender;
@end

//Cell Identifire-------------------
#define cellData @"cell4data"
#define Commentcell @"cell4comments"
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    arr4name                =   [NSMutableArray arrayWithObjects:@"Name",@"Social Network",@"School Name",@"Education Qualification",@"Job Profile",@"Company Name",@"Collage Name",@"Profile Name",@"Comments", nil];
   
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    tblVw4datashow.separatorStyle=UITableViewCellSeparatorStyleNone;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark - TableView Datasource & Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arr4name count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==[arr4name count]-1){
        return 165;
    }
    return 61;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==[arr4name count]-1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Commentcell];
        
        UILabel *lbl4Nm = (UILabel *)[cell.contentView viewWithTag:101];
        lbl4Nm.text=[arr4name objectAtIndex:indexPath.row];
        UITextView *txtVw=(UITextView *)[cell viewWithTag:102];
        txtVw.layer.borderWidth=1;
        txtVw.layer.borderColor=[[UIColor grayColor] CGColor];
        txtVw.delegate=self;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellData];
        
        UILabel *lbl4Nm = (UILabel *)[cell.contentView viewWithTag:101];
        lbl4Nm.text=[arr4name objectAtIndex:indexPath.row];
        UITextField *txtFld=(UITextField *)[cell viewWithTag:102];
        txtFld.delegate=self;
        //txtFld.tag=indexPath.row;
        txtFld.placeholder=[arr4name objectAtIndex:indexPath.row];
        
        txtFld.userInteractionEnabled=YES;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
    selectedIndexpath=(int)indexPath.row;

}
#pragma mark---------------------
#pragma mark Keyboard Method
- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    tblVw4datashow.contentInset=UIEdgeInsetsMake(0, 0, kbSize.height-60, 0);
}
-(void)keyboardWillHide:(NSNotification *)note {
    tblVw4datashow.contentInset=UIEdgeInsetsMake(0, 0,0, 0);
}
#pragma mark-----------------------
#pragma mark TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    UITableViewCell *cell;
    if(SYSTEM_VERSION>=8.0){
        cell = (UITableViewCell *)[[textField superview] superview];
    }else{
        cell = (UITableViewCell *)[[[textField superview] superview] superview];
        
    }
    NSIndexPath *indexpath4txtfld=[tblVw4datashow indexPathForCell:cell];
    NSIndexPath *indexPath= [NSIndexPath indexPathForRow:indexpath4txtfld.row+1 inSection:0];
    selectedIndexpath=(int)indexPath.row;
    if(indexpath4txtfld.row==arr4name.count-2){
        UITableViewCell *tablecell = [tblVw4datashow cellForRowAtIndexPath:indexPath];
        UITextView *txtVw=(UITextView *)[tablecell viewWithTag:102];
        txtVw.text=@"";
        txtVw.textColor=[UIColor blackColor];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, .1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [txtVw becomeFirstResponder];
        });
        
    }else{
        
        UITableViewCell *tablecell = [tblVw4datashow cellForRowAtIndexPath:indexPath];
        UITextField *txtfld=(UITextField *)[tablecell viewWithTag:102];
        [txtfld becomeFirstResponder];
    }
    return YES;
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    UITableViewCell *cell;
    if(SYSTEM_VERSION>=8.0){
        cell = (UITableViewCell *)[[textField superview] superview];
    }else{
        cell = (UITableViewCell *)[[[textField superview] superview] superview];
        
    }
    NSIndexPath *indexpath4txtfld=[tblVw4datashow indexPathForCell:cell];
    
    switch (indexpath4txtfld.row) {
        case 0:
            
            str4name=[textField.text stringByReplacingCharactersInRange:range withString:string];
            break;
            
        case 1:
            strSoclNtwrk=[textField.text stringByReplacingCharactersInRange:range withString:string];
            break;
        case 2:
            strSchlName=[textField.text stringByReplacingCharactersInRange:range withString:string]   ;
            break;
        case 3:
            streducatnQlfctn=[textField.text stringByReplacingCharactersInRange:range withString:string]   ;
            break;
        case 4:
            strjbPrfl=[textField.text stringByReplacingCharactersInRange:range withString:string]   ;
            break;
        case 5:
            strcmpnyNm=[textField.text stringByReplacingCharactersInRange:range withString:string];
            break;
        case 6:
            strClgNm=[textField.text stringByReplacingCharactersInRange:range withString:string];
            break;
        case 7:
            strprflNM=[textField.text stringByReplacingCharactersInRange:range withString:string];
            break;
            
        default:
            break;
    }
    return YES;
}
#pragma mark-------------------
#pragma mark TextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    if([textView.text isEqualToString:@"Comment"]){
        textView.text=@"";
        textView.textColor=[UIColor blackColor];
    }
    
    return YES;
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:8 inSection:0];
    [tblVw4datashow scrollToRowAtIndexPath:indexPath
                          atScrollPosition:UITableViewScrollPositionMiddle
                                  animated:NO];
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if(textView.text.length==0){
        textView.textColor=[UIColor grayColor];
        textView.text=@"Comment";
    }
    
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    strcmnts=[textView.text stringByReplacingCharactersInRange:range withString:text];
    
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    vw4dropdown.alpha=0;
}
- (IBAction)createPdf:(id)sender {
    PCPdfShow *mPCPdfShow = [self.storyboard instantiateViewControllerWithIdentifier:@"PCPdfShow"];
    mPCPdfShow.str4Hdr=@"Shankar Pdf creater";
    mPCPdfShow.str4PdfName=@"Pdf Creater Demo";
    mPCPdfShow.str4Bdy=[NSString stringWithFormat:@"Name : %@\nSocial Network : %@\nSchool Name : %@\nEducation Qualification : %@\nJob Profile : %@\nCompany Name : %@\nCollage Name : %@\nProfile Name : %@\nComments : %@",[self NULLInputinitWithString:str4name],[self NULLInputinitWithString:strSoclNtwrk],[self NULLInputinitWithString:strSchlName],[self NULLInputinitWithString:streducatnQlfctn],[self NULLInputinitWithString:strjbPrfl],[self NULLInputinitWithString:strcmpnyNm],[self NULLInputinitWithString:strClgNm],[self NULLInputinitWithString:strprflNM],[self NULLInputinitWithString:strcmnts]];
    [self.navigationController pushViewController:mPCPdfShow animated:YES];
}
-(NSString *)NULLInputinitWithString:(NSString*)InputString {
    
    if( (InputString == nil) ||(InputString ==(NSString*)[NSNull null])||([InputString isEqual:nil])||([InputString length] == 0)||([InputString isEqualToString:@""])||([InputString isEqualToString:@"(NULL)"])||([InputString isEqualToString:@"<NULL>"])||([InputString isEqualToString:@"<null>"]||([InputString isEqualToString:@"(null)"])||([InputString isEqualToString:@"NULL"]) ||([InputString isEqualToString:@"null"])))
        
        return @"";
    else
        return InputString ;
}
@end
