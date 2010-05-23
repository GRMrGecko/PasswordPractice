//
//  MGMController.m
//  Password Practice
//
//  Created by Mr. Gecko's Media on 5/21/10.
//

#import "MGMController.h"

NSString * const MGMSoundsKey = @"sounds";

@implementation MGMController
- (void)awakeFromNib {
	[ppSounds setState:([[NSUserDefaults standardUserDefaults] boolForKey:MGMSoundsKey] ? NSOnState : NSOffState)];
	total = 0;
	correct = 0;
	mistakes = 0;
	[passwordWindow makeKeyAndOrderFront:self];
}
- (void)dealloc {
	if (password!=nil)
		[password release];
	[super dealloc];
}

- (IBAction)pwContinue:(id)sender {
	if ([[pwPassword stringValue] isEqualToString:[pwVerify stringValue]]) {
		password = [[pwPassword stringValue] copy];
		[pwPassword setStringValue:@""];
		[pwVerify setStringValue:@""];
		[passwordWindow orderOut:self];
		[practiceWindow makeKeyAndOrderFront:self];
	} else {
		NSBeep();
		NSAlert *theAlert = [[NSAlert new] autorelease];
		[theAlert setMessageText:@"Incorrect Password"];
		[theAlert setInformativeText:@"The Passwords you have entered does not match. Please try again."];
		[theAlert addButtonWithTitle:@"Ok"];
		[theAlert runModal];
	}
}

- (IBAction)ppCheck:(id)sender {
	total++;
	if ([[ppPassword stringValue] isEqualToString:password]) {
		correct++;
		if ([ppSounds state]==NSOnState && sound==nil) {
			sound = [[NSSound soundNamed:@"Glass"] retain];
			[sound setDelegate:self];
			[sound play];
		}
	} else {
		if ([ppSounds state]==NSOnState && sound==nil) {
			sound = [[NSSound soundNamed:@"Basso"] retain];
			[sound setDelegate:self];
			[sound play];
		}
		mistakes++;
	}
	[ppTotal setIntValue:total];
	[ppCorrect setIntValue:correct];
	[ppMistakes setIntValue:mistakes];
	[ppAccuracy setStringValue:[NSString stringWithFormat:@"%.0f%%", ((float)correct/(float)total)*100]];
	[ppPassword setStringValue:@""];
}
- (IBAction)ppSounds:(id)sender {
	[[NSUserDefaults standardUserDefaults] setBool:([ppSounds state]==NSOnState) forKey:MGMSoundsKey];
}
- (void)sound:(NSSound *)theSound didFinishPlaying:(BOOL)finishedPlaying {
	if (finishedPlaying) {
		if (theSound==sound) {
			[sound release];
			sound = nil;
		}
	}
}
@end