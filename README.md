# flutter_guide_project

Anyone can use this project to understand how to structure a project effectively, use singleton pattern, make API calls, use Future builders correctly..

## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to use

### If you just want to study this,

Download or clone this repo by using the link below:
```
https://github.com/JayaShakthi97/Flutter_Guide_Project.git
```

Go to project root and execute the following command in console to get the required dependencies:
```
flutter pub get
```

### If you are willing to contribute this,

Fork this repo into your account first. Then download or clone the repo in your account and use it. 

Refer [this](https://help.github.com/en/github/getting-started-with-github/fork-a-repo) to know how to fork and keep your forked repo synced with original repo.

```
git clone https://github.com/YOUR-USERNAME/Flutter_Guide_Project
git remote add upstream https://github.com/JayaShakthi97/Flutter_Guide_Project
```
Syncing with remote repo
```
git fetch upstream
git merge upstream/origin

```

Feel free to open issues and pull requests are warmly welcome.

## Folder Structure
Here is the core folder structure which flutter provides.
```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project
```
lib/
|- _api/
|- _models/
|- _utils/
|- constants/
|- screens/
|- widgets/
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.
```
1. _api - API calling functions. Between UI and http client
2. _models - All the data classes 
3. _utils - Contains the utilities/common functions of application
4. constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `preferences` and `strings` 
5. screens — Contains all the pages of project 
6. widgets — Contains the common widgets for applications. For example, Button, TextField etc.
```