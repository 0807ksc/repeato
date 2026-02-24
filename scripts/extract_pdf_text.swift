import Foundation
import PDFKit

if CommandLine.arguments.count < 2 {
    fputs("usage: swift extract_pdf_text.swift <pdf_path>\n", stderr)
    exit(1)
}

let path = CommandLine.arguments[1]
let url = URL(fileURLWithPath: path)

guard let doc = PDFDocument(url: url) else {
    fputs("failed to open pdf: \(path)\n", stderr)
    exit(1)
}

for i in 0..<doc.pageCount {
    guard let page = doc.page(at: i), let text = page.string else { continue }
    print("===PAGE:\(i+1)===")
    print(text)
}
