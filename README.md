## Installation
  - git clone https://github.com/Rauf54/iOS-Assessment-Task.git
  - cd YOUR-PROJECT-FOLDER
  - pod install
  - open Assessment iOS.xcworkspace

## Language Used
 - Swift 5

 ## Architectures
   This project follows the VIPER architecture pattern, which stands for View, Interactor, Presenter, Entity, and Routing. VIPER is a design pattern commonly used in iOS development for building scalable and maintainable applications.

### Components of VIPER

- **View**: Represents the user interface components. It handles user input and displays data to the user.
- **Interactor**: Contains business logic and performs data operations. It communicates with the data layer (repositories or services) to fetch or manipulate data.
- **Presenter**: Acts as an intermediary between the View and Interactor. It formats data from the Interactor and updates the View accordingly.
- **Entity**: Represents data models or entities used within the application.
- **Routing**: Handles navigation and routing between different modules or screens of the application.

 ### Core Data Integration

- **Core Data**: Utilized for offline data storage and caching. Core Data is an object graph and persistence framework provided by Apple.

