# Repeato App

## Canonical Guide
- 제품 기동/사용 기준 문서: [`doc/work/repeato-product-run-guide-v1.md`](../doc/work/repeato-product-run-guide-v1.md)

## Local Run
- `flutter pub get`
- `flutter run`

## Test
- `flutter test`
- `flutter analyze`

## GitHub Pages Preview
- GitHub Pages workflow: [`.github/workflows/pages.yml`](../.github/workflows/pages.yml)
- Web build command:
  - `flutter build web --release --base-href "/repeato/"`
- 배포가 `main` 브랜치에 반영되면 GitHub Pages에서 웹 앱으로 확인할 수 있다.
- 이번 리뷰 빌드는 각 탭 상단 설명 문구를 통해 사용자 그룹 테스트 포인트를 바로 확인할 수 있게 구성했다.
