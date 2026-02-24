# Repeato M2 Initial Build v1

## 메타
- 버전: v1
- 작성일: 2026-02-22
- 상태: Active
- 목적: 중2 초급 영어 1차 콘텐츠로 동작하는 초기 앱 버전

## 구현 범위
- Flutter 앱 초기 버전 구현 (`app/`)
- 메인 5탭 구조 적용:
  - Today
  - Decks
  - Add
  - Insights
  - Profile
- Today 탭에서 실제 카드 학습 루프 동작

## 데이터 소스
- 원본 PDF: `~/Downloads/중등 수능필수영단어 1800.pdf`
- 생성 데이터: `app/assets/data/m2_beginner_words.json`
- 단어 수: 120

## 데이터 생성 스크립트
1. PDF 텍스트 추출
- `scripts/extract_pdf_text.swift`

2. 중2 초급 데이터셋 생성
- `scripts/build_m2_beginner_dataset.py`

실행:
```bash
./scripts/build_m2_beginner_dataset.py
```

## 앱 동작 요약
- Today:
  - 빠른 30카드 / 집중 60카드 세션 선택
  - 카드 탭 시 단어/뜻 전환
  - `다시 보기` / `알고 있음`으로 진행
  - 목표 달성 요약 카드 표시
- Decks:
  - `중2 초급 영어 120` 덱 노출
- Insights:
  - 완료량/정답률 노출
- Add/Profile:
  - 콘텐츠 확장/리마인드 후속 작업 안내

## 주요 변경 파일
- `app/lib/main.dart`
- `app/pubspec.yaml`
- `app/assets/data/m2_beginner_words.json`
- `app/test/widget_test.dart`
- `scripts/extract_pdf_text.swift`
- `scripts/build_m2_beginner_dataset.py`

## 검증
- `flutter analyze`: 통과
- `flutter test`: 통과

## 실행
```bash
./scripts/run_ios_simulator.sh app
# 또는
./scripts/run_android_emulator.sh app
```
