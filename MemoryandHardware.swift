//
//  MemoryandHardware.swift
//
//  Created by Cortney Anderson on 10/5/26.
//

/*
 
// Memory and Hardware 1
 
1. How a computer is put together:

A computer has four main parts: the CPU, RAM, storage, and input/output devices like the keyboard, mouse, and screen. The CPU is basically the brain that processes everything, while RAM holds the stuff the computer is using right now. Storage is where files and programs are saved for later, even after the computer is turned off. RAM is temporary, so it gets cleared when the computer restarts, but anything saved in storage stays there.


2. The stack and the heap in an interview:

The stack and heap are two places the computer uses to hold information while a program is running. The stack is fast and usually holds things like local variables and Swift structs, while class objects usually use the heap. Structs are value types, so if I copy one, I get a separate copy that I can change without changing the original. Classes are reference types, so copying one usually means both variables are pointing to the same object.


3. The transistors in your computer:

The computer I use for class is a 14-inch MacBook Pro with an Apple M5 chip. The M5 has a 10-core CPU, and NanoReview lists it at about 28 billion transistors, compared to only 2,300 transistors in the Intel 4004 from 1971. All of those extra transistors help my computer run much faster, do more things at once, handle better graphics, and run newer things like AI. I used Apple’s M5 information and NanoReview for my research.

 
// Memory and Hardware 2
 
 1. Limits on numbers:
 
 An Int has a biggest and smallest number because the computer only has so many bits to store it, and 8 bits make one byte. If the number gets too big or too small, Swift can give an overflow error because there is no more space for it. A Double can also be a tiny bit off because some decimal numbers cannot be stored perfectly in binary. That is why 0.1 + 0.2 can show up as 0.30000000000000004 instead of exactly 0.3.
 
 2. Why leaks matter to you:
 
 Memory leaks still matter because an app can stay open for a long time and keep using more memory the whole time. If I made an app with a screen that someone opened over and over, that screen could keep taking up more memory every time if it had a leak. After a while, the app could get slow, freeze, or even crash. Using weak or [weak self] helps stop objects from holding onto each other when they are not needed anymore.
 
 3. Inside your chip:
 
 My computer is a 14-inch MacBook Pro with an Apple M5 chip. It has 4 performance cores, 6 efficiency cores, a 10-core GPU, and a 16-core Neural Engine. The Neural Engine helps with AI features, like Apple Intelligence and things that can create or understand images. I used Apple’s website to look up the chip information.

 
 // Systems Archiecture

 1. File system: Helps coordinate moving things around, like storage to RAM and RAM to the CPU.
    Hardware: Includes things like the CPU, screen, camera, memory, files, and running programs.

 2. Your app: Your Swift code.
    Frameworks: Code Apple wrote, like SwiftUI and Foundation.
    Operating system: Handles system services.
    Kernel: The core part of the operating system.
    Hardware: The chip, RAM, storage, screen, and sensors.

 3. Compiled: The whole program is turned into machine code before it runs.
    Interpreted: Another program reads the code and runs it line by line.
 

  // Systems Architecture 2

  1. Program vs. Process:
     A program is the app installed on your phone, like
     Instagram. A process is when you actually open the
     app and it's running. When you quit the app, the
     process stops, but the program stays installed.
     
  2. iOS Sandbox:
     The sandbox keeps apps separated so they can't
     access everything on your phone. An app can access
     its own files, but it has to ask permission to use
     things like your camera or photos.

  3. Threads:
     A thread is a way for an app to work on different
     tasks. The operating system spreads threads across
     available CPU cores so tasks can run at the same
     time.
 
 
  // Systems Architecture 3

  1. Main Thread:
     The main thread handles what the user sees and
     interacts with, like buttons, text, and screens.
     UI updates need to happen on the main thread
     to keep everything working correctly.

  2. iOS App Lifecycle:
     An app has four main states: not running,
     inactive, active, and background. Not running
     means the app isn't open. Inactive means the
     app is temporarily not receiving input. Active
     means you're using the app. Background means
     the app is no longer on screen but may still
     be running.

  3. Background Apps:
     iOS suspends or ends apps to save battery and
     memory. When an app is suspended, it stays in
     memory but stops running code. When it's ended,
     its memory is cleared. 

*/
