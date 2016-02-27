//
//  TestHistoryViewController.m
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "TestHistoryViewController.h"
#import "TestResultViewController.h"
#import "DiagnosticLabManager.h"
#import "TestHistoryCell.h"
#import "UIManager.h"


#define kTestHistoryCellHeight      100


@interface TestHistoryViewController() <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSArray *tests;
@property (nonatomic, strong) NSArray *filteredTests;

@end


@implementation TestHistoryViewController

#pragma mark - Private Methods
- (NSArray *)filteredTestWithText:(NSString *)text {
    
    NSMutableArray *filteredTests = [NSMutableArray new];
    
    for (Test *test in _tests) {
        if ([[test.user.name lowercaseString] containsString:[text lowercaseString]]) {
            [filteredTests addObject:test];
        }
    }
    
    return [NSArray arrayWithArray:filteredTests];
}


#pragma mark - Life Cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tests = [[DiagnosticLabManager sharedInstance] getAllTests];
    _filteredTests = _tests;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_filteredTests count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *budgetHeaderCellIdentifier = @"TestHistoryCell";
    
    TestHistoryCell *testHistoryCell = [tableView dequeueReusableCellWithIdentifier:budgetHeaderCellIdentifier forIndexPath:indexPath];
    Test *test = _filteredTests[indexPath.row];
    [testHistoryCell fillWithTest:test];
    
    return testHistoryCell;
}


#pragma mark - UITableViewDelegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kTestHistoryCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Test *test = _tests[indexPath.row];
    UIViewController *viewController = [[UIManager sharedManager] viewControllerWithClass:[TestResultViewController class]
                                                                     inStoryboardWithName:kStoryboardMain];
    [(TestResultViewController *)viewController setTest:test];
    [self.navigationController pushViewController:viewController animated:YES];
}


#pragma mark - UISearchBarDelegate Methods
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    if (searchText.length > 0) {
        _filteredTests = [self filteredTestWithText:searchText];
    }
    else {
        _filteredTests = _tests;
    }
    [_tableView reloadData];
}

@end
