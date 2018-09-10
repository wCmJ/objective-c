app can be launched by a custom URL.
Adding a URL type to your app's info.plist.
    URL types:
        Item 0:
            URL identifier
            URL Schemes: yourstring
Mac OS:
    - (void)applicationWillFinishLaunching:(NSNotification *)notification {
        NSAppleEventManager *appleEventManager = [NSAppleEventManager sharedAppleEventManager];
        [appleEventManager setEventHandler:self
                           andSelector:@selector(handleGetURLEvent:withReplyEvent:)
                         forEventClass:kInternetEventClass
                            andEventID:kAEGetURL];
    }
    - (void)handleGetURLEvent:(NSAppleEventDescriptor *)event
           withReplyEvent:(NSAppleEventDescriptor *)replyEvent
    {
        
    }
    
    
    
    
    
    
    
    
    
