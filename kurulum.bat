@echo off
echo ================================
echo Mini Katalog Uygulamasi Kurulum
echo ================================
echo.

echo [1/3] Flutter kontrolu yapiliyor...
flutter doctor --version
if %errorlevel% neq 0 (
    echo HATA: Flutter bulunamadi!
    echo Lutfen Flutter SDK'yi kurun: https://flutter.dev
    pause
    exit /b 1
)

echo.
echo [2/3] Paketler yukleniyor...
flutter pub get
if %errorlevel% neq 0 (
    echo HATA: Paketler yuklenemedi!
    pause
    exit /b 1
)

echo.
echo [3/3] Kurulum tamamlandi!
echo.
echo Uygulamayi calistirmak icin:
echo   flutter run
echo.
pause
