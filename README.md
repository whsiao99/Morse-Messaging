# Morse-Messaging
ENGR 151 Team Hacks Project
Morse Code Training Application

TODO:
User Interface - Darcy
• Morse character buttons
• Backspace button
• Return button
• Display panel
• etc. (Possible menu interface as initialView? Could practice basic geometrical animation with this.)

Logic
• Decide how we want to distinguish different letter entries
  - Time threshold
    - Pros: User will eventually become familiarized with standard morse code timings
    - Cons: User may often hesitate between inputs, resulting in many mistakes
  - System determines all possible letter combinations of entered morse sequence
    - Pros: We get to practice using Dictionary APIs and create algorithms and whatnot
    - Cons: Difficult to implement, slower calculation

Practice View Code
• Link "database" of words to use in application
  - We can start by just using all the letters and numbers, and the words "Hello" and "World" to make phrase "Hello World"
• Write morse to text and/or text to morse translation code after logic is solved
