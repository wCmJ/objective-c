# objective-c
property: in interface file, with one or more keywords.
@property (strong/week/copy/retain) 

atomic(default):  if you don't type anything, your property is atomic.
                  An atomic property is guarantees that if you try to read from it, you will get back a valid value.
                  It does not make any guarantees about what that value might be, but you will get back good data, not just junk memory.
                  What this allows you to do is if you have multiple threads or multiple processes pointing at a single variable, one thread can read and another thread can write.
                  If they hit at the same time, the reader thread is guaranteed to get one of the two values: either before the change or after the change.
                  What atomic does not give you is any sort of guarantees about which of those values you might get.
                  Atomic is really commonly confused with being thread-safe, and that is not correct.
                  You need to guarantees your thread safety other ways.
                  However, atomic will guarantee that if you try to read, you get back some kind of value.

nonatomic:        On the flip side, non-atomic, as you can probably guess, just means, "don't do that atomic stuff."
                  What you lose is that guarantee that you always get back something.
                  If you try to read in the middle of a write, you could get back garbage data.
                  But, on the other hand, you go a litter bit faster. Because atomic properties have to do some magic to guatantee that you will get back a value, they are a bit slower.
                  If it is a property that you are accessing a lot, you may want to drop down to nonatomic to make sure that you are not incurring that speed penalty.
                  
Access: readonly: readonly makes it so this property is read-only. There is no setter for it at all.
                  It is read-only to everybody, including you.
        readwrite(default): if you want one property that works as readwrite to you, but readonly to everybody else, you would declare it as readonly in your interface file,
                            but in your implementation file, you would create a class extension and redefine it as readwrite.
                            The keyword in the interface communicates to others that they connot write to the property.
                            However, the class extensiion at the top of your implementation (.m) file will redefine the property with the same name, only as readwrite instead, allowing you to write to the property within the implementation file.
                            
The third category of property attributes is one that affects the way that your property stores its value.

strong(default):  Strong just means you have a reference to an object and you will keep that object alive.
                  As long as you hold that reference to the object in that property, that object will not be deallocated and released back into memory.
                 
weak: Weak gives you a reference so you can still "talk" to that object, but you are not keeping it alive.
      If everyone else's strong reference go away, then that object is released, weak will just automatically nil itself out.
      It is safe to send messages to nil and nothing happens.
      
assign: Assign is the keyword used for primitives.
        It is pretty easy to understand: If you do not have an object, you can not use strong, because strong tells the compiler how to work with pointers.
        But if you have a primitive(i.e. int, float, bool, or something without the little asterisk after the type), then you use assign, and that makes it work with primitives.
        
copy: Got one copy of the object        
      
      
      
      
      
      
      
      
      
      
      
      
