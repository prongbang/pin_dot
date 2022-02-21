# pin_dot

A Pin Dot Flutter package. Make it easy to use and minimal code.

![Screenshot](screenshot/pin_dot.png)

## Usage

```dart
// Controller
final TextEditingController _pinController = TextEditingController();

// Set text
_pinController.text = '12';

// Clear text
_pinController.clear();

// Widget
PinDot(
    size: 17,
    length: 4,
    controller: _pinController,
    activeColor: Colors.blue[700],
    borderColor: Colors.yellow[700],
)
```
