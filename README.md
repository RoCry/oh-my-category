- feel free to use, all things wrote by me all rights ```unreserved```
- some code was copy from others, please notify the LICENSE

### what can these thing do
1.convert between lunar date(阴历) and solar date(阳历)

``` objective-c
    NSDate *date = [NSDate getDateWithDateString:@"2000-07-07 00:14:35"   
                                    formatString:@"yyyy-MM-dd HH:mm:ss"];
                                    
    NSLog(@"your input date = %@",date);
    NSLog(@"input lunar date = %@",[date lunarForSolar]);
    
    NSLog(@"your next birthday by lunar date and display by solar date = %@",[date nextLunarBirthDateWithSolarDate]);
    NSLog(@"your next birthday by lunar date and display by lunar date = %@",[[date nextLunarBirthDateWithSolarDate]lunarForSolar]);
```

2.shake the view like when u input a wrong password on mac login window

``` objective-c
    [self.view shake];
```