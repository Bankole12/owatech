# owatech_test

# Architecture
This application is build on MVP architecture.

# Project Structure

After successful build, your application structure should look like this:

```
.
├── android                         - contains files and folders required for running the application on an Android operating system.
├── assets                          - contains all images and fonts of your application.
├── ios                             - contains files required by the application to run the dart code on iOS platforms.
├── lib                             - Most important folder in the project, used to write most of the dart code.
    ├── main.dart                   - starting point of the application
    ├── dependency_injection.dart   - dependency injection
    ├── view
    │   ├── home_page.dart          - contains homepage screen 
    ├── model
    │   ├── home_card_model.dart    - contains the meme card on home page model 
    │   ├── meme_fetch.dart         - contains utils for fetching data from remote api 
    │   └── mock_data.dart          - contains mock data for testing
    ├── presenter                   
    │   └── meme_presenter.dart     - contains the contract for managing views and models
```
### Libraries and tools used

- http - For network calls
https://pub.dev/packages/http