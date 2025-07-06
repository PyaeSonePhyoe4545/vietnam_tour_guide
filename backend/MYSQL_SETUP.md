# MySQL Setup Guide for Vietnam Tour Guide

## 🗄️ Database Setup Instructions

### 1. Install MySQL Server

**Option A: MySQL Installer (Recommended for Windows)**
1. Download MySQL Installer from: https://dev.mysql.com/downloads/installer/
2. Run the installer and select "Developer Default" setup
3. Follow the installation wizard
4. Set root password (remember this!)
5. Complete the installation

**Option B: XAMPP (Easier setup)**
1. Download XAMPP from: https://www.apachefriends.org/
2. Install XAMPP
3. Start Apache and MySQL from XAMPP Control Panel

### 2. Create Database

**Using MySQL Command Line:**
```sql
mysql -u root -p
CREATE DATABASE vietnam_tour_guide;
SHOW DATABASES;
```

**Using phpMyAdmin (if using XAMPP):**
1. Open http://localhost/phpmyadmin
2. Click "New" to create database
3. Name it `vietnam_tour_guide`
4. Click "Create"

### 3. Update Environment Variables

The `.env` file is already configured. Update if needed:

```env
# Database Configuration
DB_HOST=localhost
DB_PORT=3306
DB_USERNAME=root
DB_PASSWORD=your_mysql_password
DB_NAME=vietnam_tour_guide

# Server Configuration
PORT=3000
NODE_ENV=development
```

### 4. Test Connection

You can test if MySQL is running:
```bash
mysql -u root -p -e "SHOW DATABASES;"
```

## 🚀 Quick Setup Commands

### If you have MySQL installed:
```bash
# Create database
mysql -u root -p -e "CREATE DATABASE vietnam_tour_guide;"

# Start the backend server
npm run start:dev
```

### If you don't have MySQL yet:
The server will automatically fall back to SQLite for development, so you can start immediately:
```bash
npm run start:dev
```

## 📱 Common MySQL Issues

### Issue: "Access denied for user 'root'"
- Update password in `.env` file
- Or reset MySQL root password

### Issue: "Can't connect to MySQL server"
- Make sure MySQL service is running
- Check if port 3306 is available
- Restart MySQL service

### Issue: "Database doesn't exist"
- Create the database manually:
  ```sql
  CREATE DATABASE vietnam_tour_guide;
  ```

## 🔄 Database Migration

The app uses TypeORM with `synchronize: true` in development, which means:
- Tables are created automatically
- Schema changes are applied automatically
- Perfect for development, but should be disabled in production

## 📊 Sample Data

Once the server is running, you can add sample Vietnamese destinations and accommodations through the API endpoints or create a seeder script.

## 🛠️ Troubleshooting

1. **Check MySQL Status:**
   ```bash
   # Windows
   net start mysql
   
   # Or check in services.msc
   ```

2. **Check Port Usage:**
   ```bash
   netstat -an | findstr 3306
   ```

3. **Reset MySQL Password:**
   - Use MySQL Installer to reset password
   - Or follow MySQL documentation for password reset

## ✅ Verification

Once everything is set up, you should see:
```
Vietnam Tour Guide API is running on http://localhost:3000
API Documentation available at http://localhost:3000/api
```

The database tables will be created automatically on first run!
