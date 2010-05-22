//
//  MGMController.h
//  Password Practice
//
//  Created by Mr. Gecko's Media on 5/21/10.
//

#import <Cocoa/Cocoa.h>

@interface MGMController : NSObject {
	IBOutlet NSWindow *passwordWindow;
	IBOutlet NSTextField *pwPassword;
	IBOutlet NSTextField *pwVerify;
	NSString *password;
	
	IBOutlet NSWindow *practiceWindow;
	IBOutlet NSTextField *ppPassword;
	IBOutlet NSTextField *ppTotal;
	IBOutlet NSTextField *ppCorrect;
	IBOutlet NSTextField *ppMisstakes;
	IBOutlet NSTextField *ppAccuracy;
	int total;
	int correct;
	int mistakes;
	IBOutlet NSButton *ppSounds;
	NSSound *sound;
}
- (IBAction)pwContinue:(id)sender;
- (IBAction)ppCheck:(id)sender;
- (IBAction)ppSounds:(id)sender;
@end