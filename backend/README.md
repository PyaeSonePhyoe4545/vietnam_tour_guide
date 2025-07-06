# Vietnam Tour Guide Backend

This is the backend API for the Vietnam Tour Guide application built with NestJS, TypeORM, and MySQL.

## Features

- **Destinations API**: Manage travel destinations in Vietnam
- **Accommodations API**: Manage hotels, hostels, and other accommodations
- **Search functionality**: Search destinations and accommodations
- **Filter by category, location, price range**
- **Swagger API documentation**
- **MySQL database with TypeORM**

## Prerequisites

- Node.js (v16 or higher)
- MySQL database
- npm or yarn

## Installation

1. Navigate to the backend directory:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. Set up your database:
   - Create a MySQL database named `vietnam_tour_guide`
   - Update the `.env` file with your database credentials

4. Start the development server:
```bash
npm run start:dev
```

The API will be available at `http://localhost:3000`

## API Documentation

Visit `http://localhost:3000/api` to view the Swagger API documentation.

## API Endpoints

### Destinations
- `GET /destinations` - Get all destinations
- `GET /destinations/featured` - Get featured destinations
- `GET /destinations/search?q=query` - Search destinations
- `GET /destinations/category/:category` - Get destinations by category
- `GET /destinations/province/:province` - Get destinations by province
- `GET /destinations/:id` - Get destination by ID
- `POST /destinations` - Create new destination
- `PATCH /destinations/:id` - Update destination
- `DELETE /destinations/:id` - Delete destination

### Accommodations
- `GET /accommodations` - Get all accommodations
- `GET /accommodations/featured` - Get featured accommodations
- `GET /accommodations/search?q=query` - Search accommodations
- `GET /accommodations/type/:type` - Get accommodations by type
- `GET /accommodations/province/:province` - Get accommodations by province
- `GET /accommodations/price-range?min=100&max=500` - Get accommodations by price range
- `GET /accommodations/:id` - Get accommodation by ID
- `POST /accommodations` - Create new accommodation
- `PATCH /accommodations/:id` - Update accommodation
- `DELETE /accommodations/:id` - Delete accommodation

## Scripts

- `npm run start` - Start the application
- `npm run start:dev` - Start in development mode with hot reload
- `npm run start:prod` - Start in production mode
- `npm run build` - Build the application
- `npm run test` - Run tests
- `npm run lint` - Run ESLint

## Environment Variables

Create a `.env` file in the backend directory with the following variables:

```
DB_HOST=localhost
DB_PORT=3306
DB_USERNAME=root
DB_PASSWORD=your_password
DB_NAME=vietnam_tour_guide
PORT=3000
NODE_ENV=development
```
