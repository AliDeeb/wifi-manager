# wifi-manager

Flutter plugin to get wifi status and turn on/off wifi.

# Platform Support

|  Platform   | Status |
| :---------: | :----: |
| **Android** |   ✔️   |

# Usage

### Get wifi status

You can get wifi status with `WifiManager.isWifiEnabled()` API, as shown below:

```dart
final isWifiEnabled = await WifiManager.isWifiEnabled();
```

### Turn on/off wifi

```dart
await WifiManager.turnOnWifi(); // to turn on wifi
await WifiManager.turnOffWifi() // to turn off wifi
```

> **NOTE:** When call these functions in android 11 and above user will be redirected to wifi settings to turn on/off.

# Connect with me

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ali-deeb-62b1561a5)

# Built with

![flutter](https://github.com/AliDeeb/fancy-stepper/assets/47333501/c3895a2d-5975-495e-9af5-11bd37d70edc) ![dart](https://github.com/AliDeeb/fancy-stepper/assets/47333501/12682adf-fa0c-4924-bc8d-af3aa8d3df58)

# Contributions

All contributions are welcome!
