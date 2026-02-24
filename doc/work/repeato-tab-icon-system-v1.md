# Repeato Tab Icon System v1

## 목적
- 메인 5개 메뉴의 아이콘을 일관된 스타일로 정의한다.
- Flutter 구현 시 SVG, SF Symbol, Emoji fallback을 모두 지원한다.

## 제공 자산
- 경로: `doc/work/assets/icons/repeato-tab-icons-v1/`
- 파일:
  - `today.svg`
  - `decks.svg`
  - `add.svg`
  - `insights.svg`
  - `profile.svg`
  - `icon-manifest.json`

## 아이콘 매핑
1. Today
- 기본 아이콘: `today.svg`
- SF Symbol: `house`
- Emoji fallback: `🏠`

2. Decks
- 기본 아이콘: `decks.svg`
- SF Symbol: `books.vertical`
- Emoji fallback: `📚`

3. Add
- 기본 아이콘: `add.svg`
- SF Symbol: `plus.circle`
- Emoji fallback: `➕`

4. Insights
- 기본 아이콘: `insights.svg`
- SF Symbol: `chart.bar`
- Emoji fallback: `📊`

5. Profile
- 기본 아이콘: `profile.svg`
- SF Symbol: `person`
- Emoji fallback: `👤`

## Flutter 적용 예시
사전 준비:
1. 아이콘 파일을 Flutter 앱으로 복사
- 자동 설치: `./scripts/install_repeato_tab_icons.sh app`
- 수동 설치 경로: `app/assets/icons/tab/`
2. `app/pubspec.yaml`에 assets 등록

```yaml
flutter:
  assets:
    - assets/icons/tab/
```

3. `flutter_svg` 패키지 추가
```bash
cd app
flutter pub add flutter_svg
```

샘플 코드:
```dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

BottomNavigationBarItem tabItem(String asset, String label) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
      'assets/icons/tab/$asset',
      width: 22,
      height: 22,
      colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
    ),
    activeIcon: SvgPicture.asset(
      'assets/icons/tab/$asset',
      width: 22,
      height: 22,
      colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
    ),
    label: label,
  );
}
```

## Noun Project 대체 사용 가이드
- 현재 v1은 즉시 사용 가능한 자체 SVG 세트를 제공한다.
- Noun Project 무료 아이콘을 대체 적용하려면 `icon-manifest.json`의 `nounproject_search` 링크에서 아이콘을 선택해 교체한다.
- 무료 라이선스 아이콘은 제작자 표기(Attribution) 조건을 확인하고, 앱 내 credits 또는 설정 화면에 표시한다.

## 품질 기준
- 24x24 viewport
- 단색 stroke 기반
- 탭 아이콘 간 시각적 무게 통일
- iOS 기본 탭바 크기에서 식별 가능해야 함
