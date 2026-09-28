---
id: 1834AE94-C927-4391-ACC0-527FD4F2C399
name: Images
type: lab
assignDay: SB14
dueDay: SB15
location:
---

# Images Lab Requirements - Due Sep 25, 2026

Open the starter project in 2 - Basic SwiftUI/Assignments/Starter - Images Lab/.

When finished, have an instructor sign off on your work.

## Overview

A pet-sitting company wants a page that shows the pets a sitter is caring for this week, so the sitter recognizes each one at the door.

The pets' photos are already in the asset catalog as `pet1`, `pet2` and `pet3`.

## Instructions

Everything happens in `PetsScreen.swift`. The page already scrolls, so you don't need to change the `ScrollView` or the `VStack`. Replace each placeholder `Text` with the real thing.

1. **Build the header.** Replace `Text("Header")` with a `ZStack` that puts `pet1` behind the words "This Week's Pets".
    - The photo is 350 points wide and 220 points tall, covers that whole space, and is clipped to a `RoundedRectangle` with a corner radius of 20.
    - The words sit on top of the photo in `.largeTitle`, bold and white.
2. **Show every pet.** Replace `Text("Pets")` with an `HStack` holding `pet1`, `pet2` and `pet3`.
    - Each photo is 90 by 90 points, covers its whole frame, and is clipped to a `Circle`.
    - Each one has a border at least 3 points wide that follows the circle. (Hint: `.border` won't follow a circle. Look back at how the deck drew a round border.)
3. **Show the care routine.** Replace `Text("Care")` with an `HStack` of three icons. Each one is an SF Symbol with a `Text` under it:
    - `fork.knife` with "Fed twice a day"
    - `figure.walk` with "Two walks"
    - `drop.fill` with "Fresh water"

    Make every symbol `.title` size, and give each one a color.
4. **Show one whole pet.** Replace `Text("Full Photo")` with `pet2` in a frame 350 points wide and 300 points tall. The sitter needs to see the whole pet, nose to tail, so no part of the photo can be cut off, and it can't be stretched.
5. **Optional: add your own pet.** If you have a pet, drag a photo of it into `Assets.xcassets`, give it a name, and add it to the row from step 2 the same way as the others.
6. Run the app and scroll the whole page. Check that no photo looks squashed, and that the photo from step 4 shows the whole pet.

## Black Diamond

Every photo in the row from step 2 repeats the same five modifiers. Move one of them into its own subview called `PetBadge`, with a property for the photo's name, and build the whole row out of `PetBadge`s. Then change the border color in one place and watch every badge update.

## Rubric

- [ ] Header: `pet1` covers a 350 by 220 frame, clipped to a rounded rectangle, with "This Week's Pets" on top of it in a `ZStack`
- [ ] `pet1`, `pet2` and `pet3` in a row, each covering a 90 by 90 frame, clipped to a `Circle`, with a border that follows the circle
- [ ] Three SF Symbols at `.title` size, each with a color and a label under it
- [ ] `pet2` shown whole in a 350 by 300 frame, with nothing cut off
- [ ] No photo on the page is squashed or stretched
