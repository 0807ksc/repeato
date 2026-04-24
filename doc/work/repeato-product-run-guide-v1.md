# Repeato Product Run Guide v1

## 메타
- 버전: v1
- 작성일: 2026-04-04
- 상태: Active
- 목적: Repeato 제품을 실제로 기동하고 핵심 사용자 흐름을 사용해 볼 때 따를 단일 기준 가이드를 정의한다.

## 1. 이 문서의 역할
- 이 문서는 Repeato 제품 기동과 사용 테스트의 canonical guide다.
- 제품 실행/사용을 다루는 skill이나 workflow는 먼저 이 문서를 읽는다.
- 기존 환경 설정 문서(`doc/work/flutter-local-dev-setup-v1.md`)와 앱 실행 메모(`app/README.md`)는 이 문서로 연결되는 보조 문서로 취급한다.

## 2. 가이드 포맷 규약
앞으로 제품 기동/사용 가이드를 버전업할 때는 아래 섹션 구조를 유지한다.

1. 메타
2. 이 문서의 역할
3. 실행 대상과 경로
4. 사전 조건
5. 기동 절차
6. 핵심 사용 시나리오
7. 증거 수집 형식
8. GUI 제약 시 대체 검증
9. 현재 세션 기준 실행 결과

## 3. 실행 대상과 경로
- 앱 루트 경로: `app/`
- 메인 엔트리: `app/lib/main.dart`
- 데이터 자산:
  - `app/assets/data/m2_beginner_words.json`
  - `app/assets/data/cheonjamun_sample.json`
- 보조 실행 가이드:
  - 환경 설정: `doc/work/flutter-local-dev-setup-v1.md`
  - 간단 실행 메모: `app/README.md`

## 4. 사전 조건
- Flutter 설치 확인:
  - `flutter --version`
- 사용 가능한 타깃 확인:
  - `flutter devices`
- 의존성 설치:
  - `flutter pub get`

## 5. 기동 절차
모든 테스트 세션에서 아래 순서를 기본으로 따른다.

### 5.1 기본 품질 확인
```bash
cd app
flutter pub get
flutter analyze
flutter test
```

### 5.2 실제 제품 기동
가능한 타깃 중 하나를 선택한다.

#### macOS
```bash
cd app
flutter run -d macos
```

#### Chrome
```bash
cd app
flutter run -d chrome
```

#### Web Server
```bash
cd app
flutter run -d web-server --web-port 43123 --web-hostname 127.0.0.1
```

## 6. 핵심 사용 시나리오
기동 후 아래 순서로 확인한다.

### 시나리오 A. Today 첫 학습
1. 앱 진입 후 `Today` 화면 확인
2. 현재 목표 카드 수와 세션 제어 확인
3. 카드 1장을 `알겠음`, `헷갈림`, `모르겠음` 중 하나로 평가

기대 결과:
- 즉시 학습을 시작할 수 있다
- 진행률이 증가한다
- 세션 상태가 상단에 보인다

### 시나리오 B. Decks 확인 후 특정 덱 학습
1. `Decks` 진입
2. 덱 목록 확인
3. 특정 덱 상세 진입
4. `지금 바로 학습` 실행

기대 결과:
- Today로 자연스럽게 이동한다
- 선택한 덱 컨텍스트가 유지된다

### 시나리오 C. Add에서 카드 추가
1. `Add` 진입
2. 앞면/뒷면/덱 입력
3. 저장
4. `Today로 이동` 또는 `계속 추가`

기대 결과:
- 저장 결과가 분명하다
- 최근 덱/최근 입력 UI가 반영된다

### 시나리오 D. Insights 확인
1. 학습 응답 1회 이상 수행
2. `Insights` 진입
3. 오늘 학습 덱, KPI, 약점 요약 확인

기대 결과:
- Today 응답이 Insights에 반영된다
- 다음 행동 CTA가 보인다

### 시나리오 E. Profile 신뢰 정보 확인
1. `Profile` 진입
2. 오늘 학습 요약, 로컬 저장 상태, `Today 이어서 학습` 확인

기대 결과:
- 현재 구현 범위와 미구현 범위가 오해 없이 보인다

## 7. 증거 수집 형식
제품 테스트 결과는 아래 형식으로 남긴다.

- 실행 환경:
- 실행 명령:
- 실제 기동 여부:
- 수행한 시나리오:
- 확인된 정상 동작:
- 발견한 문제:
- 추가 요구사항 후보:
- 자동 진행 가능 여부:

## 8. GUI 제약 시 대체 검증
- GUI 상호작용이 완전하지 않으면 아래를 최소 기준으로 수행한다.
  - `flutter analyze`
  - `flutter test`
  - `flutter run -d web-server ...` 또는 사용 가능한 타깃으로 실제 부팅 확인
- 이 경우 직접 상호작용으로 확인하지 못한 부분은 `문서/테스트/코드 기반 추정`으로 명시한다.

## 9. 현재 세션 기준 실행 결과
- 실행일: 2026-04-04
- 실행 환경:
  - `flutter --version`: `3.41.2`
  - `flutter devices`: `macOS`, `Chrome`
- 실행 명령:
  - `flutter pub get`
  - `flutter analyze`
  - `flutter test`
  - `flutter run -d web-server --web-port 43123 --web-hostname 127.0.0.1`
- 실제 기동 여부:
  - Web Server 기준 부팅 성공
  - 앱 URL 노출 확인: `http://127.0.0.1:43123`
- 수행한 시나리오:
  - Today/Decks/Add/Insights/Profile 주요 흐름은 `flutter test` 15개 시나리오로 통과 확인
- 확인된 정상 동작:
  - 앱 셸 로드
  - Today 학습 루프
  - Deck 상세에서 Today 이동
  - Add 저장/최근 입력/최근 덱
  - Insights KPI/약점 요약/CTA
  - Profile에서 Today 재진입
- 제약:
  - 이번 세션은 CLI 환경이라 실제 GUI 수동 조작은 제한적이었고, 사용자 상호작용 검증은 위젯 테스트로 보강했다
