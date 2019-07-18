# Some worst case runtimes of the things you can do within the level editor.
### Entities
* O(1) for adding entities
* O(n) for removig entities
* O(1) for cycling through entities

### Utility
* O(n^2) for loading/reloading images to be used in the editor
* O(n) for saving to file
* O(n) for loading from file
* O(1) for error messages on screen