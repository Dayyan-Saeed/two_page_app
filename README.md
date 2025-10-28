# flutter_application_1

A new Flutter project.

## Getting Started

# Threads App - Flutter Implementation

A two-page Flutter application that mimics a social media threads/posts interface, built as part of a Flutter Developer Intern assignment.

## Features

### Listing Page (Threads)
- Displays a list of social media posts/threads
- Each post shows:
  - User avatar with colored circular background
  - User name and time posted
  - Post content
  - Like, comment, and share counts with icons
- Clean, modern UI matching the provided design
- Navigation to detail page on post tap
- Bottom navigation bar with home, search, create, heart, and profile icons

### Detail Page (Post)
- Displays the selected post in detail
- Post title "Weekend Getaway" 
- Full post content
- Like, comment, and share statistics
- Comments section with:
  - User avatars and names
  - Comment content and timestamps
  - Like/dislike buttons for each comment
- "Most Relevant" sorting dropdown
- Add comment section at the bottom
- Back navigation to listing page

## Technical Implementation

- **State Management**: Uses StatefulWidget for local state management
- **Navigation**: Navigator.push for page transitions
- **API Integration**: Ready for JSONPlaceholder API integration (https://jsonplaceholder.typicode.com/posts)
- **Models**: Post, ThreadPost, and Comment data models
- **Services**: API service layer for future backend integration
- **UI/UX**: Material Design components with custom styling to match design mockups

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── post.dart            # Data models (Post, ThreadPost, Comment)
├── pages/
│   ├── threads_page.dart    # Main listing page
│   └── post_detail_page.dart # Post detail page
└── services/
    └── api_service.dart     # API service for data fetching
```

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Android Studio or VS Code with Flutter extension
- Android device/emulator or iOS device/simulator

### Installation

1. Clone the repository
2. Navigate to the project directory
3. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

```bash
flutter run
```

### Building APK

You can use the provided batch script:
```bash
build_apk.bat
```

Or run the command directly:
```bash
flutter build apk --release
```

The APK will be generated at: `build\app\outputs\flutter-apk\app-release.apk`

## Design Implementation

The app closely follows the provided design mockups:
- Clean white background
- Proper spacing and typography
- Circular avatars with different colors for each user
- Appropriate icons for actions (heart, chat, share, etc.)
- Modern Material Design components
- Responsive layout

## Future Enhancements

- Integration with real API endpoints
- User authentication
- Real-time comments and likes
- Image/media support in posts
- Pull-to-refresh functionality
- Infinite scroll pagination
- Push notifications

## Assignment Requirements Completed

✅ Two-page app (Listing + Detail)  
✅ API integration setup (JSONPlaceholder)  
✅ State management implementation  
✅ Clean, modern UI matching design mockups  
✅ Navigation between pages  
✅ APK build capability  
✅ GitHub repository ready  

## Dependencies

- `flutter`: SDK
- `http`: ^1.1.0 for API calls
- `cupertino_icons`: ^1.0.6 for iOS-style icons

## Contact

For any questions or clarifications about this implementation, please feel free to reach out.
