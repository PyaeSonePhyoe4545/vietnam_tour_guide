@echo off
echo Setting up Vietnam Tour Guide Application...
echo.

echo [1/4] Setting up Backend...
cd backend
echo Installing backend dependencies...
call npm install
if %errorlevel% neq 0 (
    echo Failed to install backend dependencies!
    pause
    exit /b 1
)

echo Creating database (make sure MySQL is running)...
echo Please ensure you have:
echo - MySQL server running
echo - Created database 'vietnam_tour_guide'
echo - Updated .env file with your database credentials
echo.

cd ..

echo [2/4] Setting up Frontend...
cd frontend
echo Installing Flutter dependencies...
call flutter pub get
if %errorlevel% neq 0 (
    echo Failed to install Flutter dependencies!
    pause
    exit /b 1
)

echo [3/4] Generating code...
call flutter packages pub run build_runner build
if %errorlevel% neq 0 (
    echo Warning: Code generation failed. You may need to run this manually later.
)

cd ..

echo [4/4] Setup complete!
echo.
echo To start the application:
echo 1. Start backend: cd backend && npm run start:dev
echo 2. Start frontend: cd frontend && flutter run
echo.
echo Backend will be available at: http://localhost:3000
echo API documentation at: http://localhost:3000/api
echo.
pause
