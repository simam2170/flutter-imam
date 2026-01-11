plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.imamsu1"

    // 🔹 WAJIB (plugin minta SDK tinggi)
    compileSdk = 36

    // 🔹 FIX WARNING NDK
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    defaultConfig {
        applicationId = "com.example.imamsu1"

        // 🔹 Biarkan Flutter yang atur
        minSdk = flutter.minSdkVersion

        // 🔹 Samakan dengan compileSdk
        targetSdk = 36

        versionCode = 1
        versionName = "1.0"

        multiDexEnabled = true
    }

    buildTypes {
        release {
            // Debug signing supaya tidak ribet testing
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
