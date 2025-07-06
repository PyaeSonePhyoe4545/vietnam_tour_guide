# Vietnam Tour Guide

A comprehensive mobile application for exploring Vietnam's travel destinations and accommodations. Built with Flutter for the frontend and NestJS for the backend.

## 🌟 Features

### Frontend (Flutter)
- **Beautiful UI**: Modern, Vietnamese-themed design with custom colors and fonts
- **State Management**: BLoC pattern for predictable state management
- **Destinations**: Browse, search, and filter travel destinations
- **Accommodations**: Find hotels, hostels, and other lodging options
- **Search & Filter**: Advanced search with category, location, and price filters
- **Maps Integration**: Google Maps integration for location viewing
- **Offline Support**: Cached data for better performance
- **Responsive Design**: Works on phones and tablets

### Backend (NestJS)
- **RESTful API**: Well-structured API endpoints
- **Database**: MySQL with TypeORM for data persistence
- **Swagger Documentation**: Auto-generated API documentation
- **Data Validation**: Request/response validation with class-validator
- **Error Handling**: Comprehensive error handling and logging
- **CORS Support**: Configured for Flutter app integration

## 🏗️ Project Structure

```
vietnam_tour_guide/
├── backend/                 # NestJS backend
│   ├── src/
│   │   ├── destinations/    # Destinations module
│   │   ├── accommodations/  # Accommodations module
│   │   ├── app.module.ts    # Main app module
│   │   └── main.ts         # Application entry point
│   ├── package.json
│   └── README.md
├── frontend/               # Flutter frontend
│   ├── lib/
│   │   ├── core/          # Core utilities, config, theme
│   │   ├── features/      # Feature modules (destinations, accommodations)
│   │   └── shared/        # Shared widgets and utilities
│   ├── assets/            # Images, icons, fonts
│   ├── pubspec.yaml
│   └── README.md
└── README.md              # This file
```

## 🚀 Getting Started

### Prerequisites

- **Flutter**: 3.0+ with Dart SDK
- **Node.js**: 18+ with npm/yarn
- **MySQL**: 8.0+ for database
- **VS Code**: Recommended IDE with Flutter and Dart extensions

### Backend Setup

1. Navigate to backend directory:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. Set up MySQL database:
   - Create database named `vietnam_tour_guide`
   - Update `.env` file with your database credentials

4. Start development server:
```bash
npm run start:dev
```

Backend will be available at `http://localhost:3000`
API documentation at `http://localhost:3000/api`

### Frontend Setup

1. Navigate to frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate code for JSON serialization:
```bash
flutter packages pub run build_runner build
```

4. Run the app:
```bash
flutter run
```

## 📱 Features Overview

### Destinations
- Browse all destinations in Vietnam
- Filter by category (historical, nature, cultural, etc.)
- Filter by province/region
- Search destinations by name or description
- View detailed information including:
  - High-quality images
  - Descriptions and tips
  - Opening hours and entry fees
  - Transportation information
  - Location on map
  - User ratings and reviews

### Accommodations
- Browse hotels, hostels, resorts, and more
- Filter by accommodation type
- Filter by price range
- Filter by amenities (WiFi, breakfast, parking, etc.)
- View detailed information including:
  - Photo galleries
  - Room types and prices
  - Amenities and facilities
  - Contact information
  - Cancellation policies
  - Location and nearby attractions

### Search & Discovery
- Smart search across destinations and accommodations
- Featured content highlighting top recommendations
- Category-based browsing
- Location-based filtering
- Price range filtering for accommodations

## 🛠️ Technology Stack

### Frontend
- **Flutter**: Cross-platform mobile framework
- **BLoC**: State management pattern
- **Dio**: HTTP client for API calls
- **GoRouter**: Declarative routing
- **Google Maps**: Map integration
- **Cached Network Image**: Image caching
- **Shared Preferences**: Local storage

### Backend
- **NestJS**: Progressive Node.js framework
- **TypeORM**: Object-relational mapping
- **MySQL**: Relational database
- **Swagger**: API documentation
- **Class Validator**: Data validation
- **Class Transformer**: Data transformation

## 🎨 Design System

### Colors
- **Primary**: Vietnam Green (#2E7D32)
- **Secondary**: Vietnamese Red (#FF5722)
- **Accent**: Gold/Yellow (#FFC107)
- **Background**: Light Gray (#F5F5F5)

### Typography
- **Font Family**: Poppins
- **Weights**: Regular, Medium, SemiBold, Bold

### Components
- Custom cards for destinations and accommodations
- Consistent button styles
- Vietnamese-themed color gradients
- Material Design 3 components

## 📊 API Endpoints

### Destinations
- `GET /destinations` - Get all destinations
- `GET /destinations/featured` - Get featured destinations
- `GET /destinations/search?q=query` - Search destinations
- `GET /destinations/category/:category` - Filter by category
- `GET /destinations/province/:province` - Filter by province
- `GET /destinations/:id` - Get destination details

### Accommodations
- `GET /accommodations` - Get all accommodations
- `GET /accommodations/featured` - Get featured accommodations
- `GET /accommodations/search?q=query` - Search accommodations
- `GET /accommodations/type/:type` - Filter by type
- `GET /accommodations/province/:province` - Filter by province
- `GET /accommodations/price-range?min=X&max=Y` - Filter by price
- `GET /accommodations/:id` - Get accommodation details

## 🔧 Development

### Running Tests
```bash
# Backend tests
cd backend
npm run test

# Frontend tests
cd frontend
flutter test
```

### Building for Production
```bash
# Backend build
cd backend
npm run build

# Frontend build
cd frontend
flutter build apk  # for Android
flutter build ios  # for iOS
```

### Code Generation
```bash
# Generate JSON serialization code
cd frontend
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## 🌐 Environment Configuration

### Backend (.env)
```
DB_HOST=localhost
DB_PORT=3306
DB_USERNAME=root
DB_PASSWORD=your_password
DB_NAME=vietnam_tour_guide
PORT=3000
NODE_ENV=development
```

### Frontend
Update `lib/core/config/api_config.dart` for API endpoint configuration.

## 📄 License

This project is licensed under the MIT License.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📞 Support

For support, email support@vietnamtourguide.com or create an issue in this repository.
