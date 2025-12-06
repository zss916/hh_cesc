plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.cescpro"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.cescpro"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {

        create("release") {
            if (System.getenv()["CI"]) {
                storeFile = file(System.getenv()["CM_KEYSTORE_PATH"] as String)
                storePassword = System.getenv()["CM_KEYSTORE_PASSWORD"] as String
                keyAlias = System.getenv()["CM_KEY_ALIAS"] as String
                keyPassword = System.getenv()["CM_KEY_PASSWORD"] as String
            } else {
                storeFile = file(project.property("storeFile") as String)
                storePassword = project.property("storePassword") as String
                keyAlias = project.property("keyAlias") as String
                keyPassword = project.property("keyPassword") as String
            }
        }


        /*create("release") {
            storeFile = file(project.property("storeFile") as String)
            storePassword = project.property("storePassword") as String
            keyAlias = project.property("keyAlias") as String
            keyPassword = project.property("keyPassword") as String
        }*/
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            //signingConfig = signingConfigs.getByName("debug")
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            ndk {
                ndk.abiFilters.clear()
                ndk.abiFilters.addAll(listOf("arm64-v8a", "armeabi-v7a"))
            }
        }

        debug {
            isMinifyEnabled = false
            isShrinkResources = false
            ndk {
                abiFilters += listOf("armeabi-v7a", "arm64-v8a")
            }
        }
    }
}

flutter {
    source = "../.."
}
