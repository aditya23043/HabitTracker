# Habit Tracker App

> Track your habits so that you feel guilty about not going to the Gym!

- Currently targetting Android only

## Dependencies

- None, if you are downloading the .APK releases
- If you are building yourself:
  - flutter

> Note: As of now, the project is still a WIP and hence I have not released any .APK yet.

## How to run?

```
git clone https://github.com/aditya23043/HabitTracker
cd HabitTracker/src/
flutter run
```

## Development Log

- Code refactored
- moved from a single stateful widget to multiple smaller stateful widgets so that they are more manageable
- but facing a bug -> multiple dates being "highlighted" when tapped on
- this issue was caused because I had local shallow copies of the variable focussed_index
  https://github.com/user-attachments/assets/feccc307-7559-4280-9202-71d7ec9dbc61

- Did a big brain bug solve
- Take this case:
  - We have two widgets A and B withing a parent widget C
  - When we execute `setState` in an `onTap` in widget A, I wanted widget B to rebuild as well
  - So instead of manually updating widget B, I have moved the `setState` from widget A to C and now both widget A and widget B update
  - In this instance
    - Widget A: DateWidget
    - Widget B: TaskWidget
    - Widget C: HomePage
https://github.com/user-attachments/assets/a9b4add0-de1f-465c-949c-b4313506bfa9
