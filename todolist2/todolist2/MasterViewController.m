//
//  MasterViewController.m
//  todolist2
//
//  Created by Milan Brahmbhatt on 10/20/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "MasterViewController.h"
#import "TodoItemCell.h"
#import "TodoTextField.h"
#import <objc/runtime.h>

static char indexPathKey;

@interface MasterViewController () {
    NSMutableArray *_items;
    NSMutableArray *_persistentList;
    BOOL _inserting;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    _persistentList = [[NSMutableArray alloc] init];
    _items = [[NSMutableArray alloc] init];
    _inserting = NO;
    NSUserDefaults *list = [NSUserDefaults standardUserDefaults];
    NSArray *todoList = [list arrayForKey:@"todoList"];
    
    for (NSString *text in todoList) {
        TodoTextField *textField =[[TodoTextField alloc] init];
        textField.text = text;
        [_persistentList addObject:text];
        textField.becamePrimaryResponder = NO;
        [_items addObject:textField];
    }
    
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    _inserting = YES;
    TodoTextField *textField = [[TodoTextField alloc] init];
    [_items insertObject:textField atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodoItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if ([_items count] != 0) {
        TodoTextField *object = _items[indexPath.row];
        cell.textField.text = object.text;
        if(object.becamePrimaryResponder) {
            [cell.textField becomeFirstResponder];
        }
    }
    objc_setAssociatedObject(cell.textField, &indexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        TodoTextField *textField = _items[indexPath.row];
        [_items removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        objc_setAssociatedObject(textField, &indexPathKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [_persistentList removeObjectAtIndex:indexPath.row];
        [self persistItems];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [_items exchangeObjectAtIndex:fromIndexPath.item withObjectAtIndex:toIndexPath.item];
    [_persistentList exchangeObjectAtIndex:fromIndexPath.item withObjectAtIndex:toIndexPath.item];
    [self persistItems];
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)persistItems {
    NSUserDefaults *list = [NSUserDefaults standardUserDefaults];
    [list setObject:_persistentList forKey:@"todoList"];
}

#pragma UITextFieldDelegate methods
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSIndexPath *indexPath = objc_getAssociatedObject(textField, &indexPathKey);
    TodoTextField *thisTextField = _items[indexPath.row];
    thisTextField.becamePrimaryResponder = YES;
    [self.tableView cellForRowAtIndexPath:indexPath];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.tableView endEditing:YES];
    
    NSIndexPath *indexPath = objc_getAssociatedObject(textField, &indexPathKey);
    if (indexPath != nil) {
        TodoTextField *todoTextField = _items[indexPath.row];
        todoTextField.becamePrimaryResponder=NO;
        todoTextField.text = textField.text;
        if (_inserting) {
            [_persistentList insertObject:textField.text atIndex:0];
            _inserting = NO;
        } else {
            _persistentList[indexPath.row] = textField.text;
        }
        [self persistItems];
        [self.tableView reloadData];
    }
    
    return YES;
}

@end
