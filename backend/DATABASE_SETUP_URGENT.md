# 🚨 Quick Database Setup

## MySQL Database is missing! 

The server can connect to MySQL but the database `vietnam_tour_guide` doesn't exist.

## ✅ Option 1: Create Database via phpMyAdmin (Easiest)

If you have XAMPP installed:
1. Open http://localhost/phpmyadmin
2. Click "New" button
3. Enter database name: `vietnam_tour_guide`
4. Click "Create"

## ✅ Option 2: MySQL Command Line

If MySQL is in your PATH:
```bash
mysql -u root -p
CREATE DATABASE vietnam_tour_guide;
exit
```

## ✅ Option 3: MySQL Workbench

1. Open MySQL Workbench
2. Connect to your local server
3. Click "Create Schema" (database icon)
4. Name: `vietnam_tour_guide`
5. Click "Apply"

## ✅ Option 4: Install XAMPP (Recommended)

1. Download from: https://www.apachefriends.org/
2. Install and start Apache + MySQL
3. Open phpMyAdmin: http://localhost/phpmyadmin
4. Create database as above

## ✅ Option 5: Use SQLite Instead (No setup needed)

Update `.env` file to remove MySQL config:
```env
# Comment out MySQL settings
# DB_HOST=localhost
# DB_PORT=3306
# DB_USERNAME=root
# DB_PASSWORD=
# DB_NAME=vietnam_tour_guide

# Server Configuration
PORT=3000
NODE_ENV=development
```

The app will automatically use SQLite for development.

## 🔄 After Creating Database

Restart the server:
```bash
# Stop current server (Ctrl+C)
npm run start:dev
```

You should see:
```
Vietnam Tour Guide API is running on http://localhost:3000
```
