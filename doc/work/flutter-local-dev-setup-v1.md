# Flutter Local Dev Setup v1 (macOS)

## 목적
- 로컬에서 iOS/Android 에뮬레이터로 Repeato 앱을 실행/확인할 수 있는 개발 환경을 빠르게 구성한다.

## 현재 상태(2026-02-22 점검)
- `flutter`: 미설치
- `dart`: 미설치
- `adb`: 미설치
- `xcrun`: 설치됨

## 1) 1회 설치
```bash
./scripts/bootstrap_flutter_macos.sh
```

설치 후 수동 작업:
1. Android Studio 실행
2. SDK/Emulator/Command-line Tools 설치
3. Device Manager에서 AVD 1개 이상 생성
4. `flutter doctor --android-licenses` 실행
5. Xcode 설치(ios 필요 시)

## 2) 상태 점검
```bash
./scripts/flutter_doctor_report.sh
```

## 3) 앱 생성
```bash
./scripts/create_flutter_app.sh app
```

## 4) 실행
### iOS Simulator
```bash
./scripts/run_ios_simulator.sh app
```

문제 해결:
- `No available iOS simulator found`:
  1. Xcode > Settings > Platforms에서 iOS Runtime 설치
  2. Xcode > Window > Devices and Simulators에서 iPhone 시뮬레이터 생성
- `CoreSimulatorService connection invalid`:
  1. `sudo xcodebuild -runFirstLaunch`
  2. Xcode 1회 실행 후 초기 설정 완료
  3. Simulator 앱 실행 후 재시도

### Android Emulator
```bash
./scripts/run_android_emulator.sh app
```

## 권장 운영 규칙
- 앱 소스는 `app/` 하위에 관리한다.
- 상세 환경 가이드/트러블슈팅은 이 문서를 버전업(`...-v2.md`)해서 관리한다.
