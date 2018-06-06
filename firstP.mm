NSArray<NSRunningApplication *> *mail = [NSRunningApplication runningApplicationsWithBundleIdentifier:@"yourBundleIdentifier"];
//yourBundleIdentifier is in your Info.plist file.
dispatch_source_t source;
for(NSRunningApplication *app in mail)
{
    pid_t const pid = app.processIdentifier;]
    
    __block int result = 1;
    
    source = dispatch_source_create(DISPATCH_SOURCE_TYPE_PROC, pid, DISPATCH_PROC_EXIT, DISPATCH_TARGET_QUEUE_DEFAULT);
    
    dispatch_source_set_event_handle(source, ^(){
        result = 2;    
    });
    return result;
}

/*
    above codes try to detect app with BundleIndentifier yourBundleIdentifier exits or not.
    when result equals 2, it means this app exited.   
*/

NSTask *task = [[NSTask alloc] init];
[task setLaunchPath:@"/bin/rm"];
[task setArguments:@[@"-rf",fileName]];
[task launch];
[task waitUntilExit];
[task realease];

/*
    NSTask can start another task to achieve something.
*/

NSTask *task = [[NSTask alloc] init];
[task setLaunchPath:@"/bin/sh"];
[task setArguments:[NSArray arrayWithObjects:[[NSBundle mainBundle] pathForResource:filename ofType:@"sh"],nil];
[task launch];
[task waitUntilExit];
[task realease];
/*
    run .sh file
*/
 
 
