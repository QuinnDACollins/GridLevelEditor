# Using the level editor

- Open up the processing file "levelEditor.pde"
- Once open, you may change the gridW and the gridH variables according to your level size, but it's not necessary
- Now, launch the sketch and you should have the level editor open :)
- Once open, you can press **H** to open the HUD and see everything you can do

## HUD
- In **top left** you'll see a grid of all of your tiles, entities, and the player you can place in the level
- You can navigate this grid using Q & E (Horizontally) or using A & D (Vertically)
- In the **top right** you'll see a white rectangle, which is a textbox you can use to name your level! Click into it and type your level name
- Once you type your level name, you can press *p* to parse and *l* to load. (Loading is still in production be careful not to load a blank level!)
- In the bottom right you will see 4 values with labels on them, ss, ms, js, jh. They stand for **Shoot Speed**, **Move Speed**, **Jump Speed**, and **Jump Height** accordingly.
- These values pertain to the entities in the level so you'll probably want to set them ***BEFORE*** placing any entities.

## Placing Entities
- Once you have an entity, tile or the player hovered, you may place them into the design area by left clicking with the mouse.


# Key
| Key (* means that the HUD must be open) | Function                                                           |
|-----------------------------------------|--------------------------------------------------------------------|
| *A & D                                  | Move the entity selector vertically* (Up & Down respectively)      |
| *Q & E                                  | Move the entity selector horizontally* (Left & Right respectively) |
| *H                                      | Open the HUD                                                       |
| *Arrow Keys                             | Adjust entity properties                                           |
| *Backspace                              | Toggle the eraser.                                      |

## Known Bugs
- When you first start the level editor the spacing for tiles WILL be off, press *D* and then *A* to fix the spacing. 
- Occasional crashes while saving. 
- Tell me other bugs when you find them, thanks.
- 
