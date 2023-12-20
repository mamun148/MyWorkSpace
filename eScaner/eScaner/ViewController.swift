//
//  ViewController.swift
//  eScaner
//
//  Created by Abdullah Mamun on 13/12/23.
//

import UIKit
import PDFGenerator
import PDFReader

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = .red
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addCreatePDFButton()
        addReadPDFButton()
        
    }
    
    func addCreatePDFButton() {
        let pdfReadButton = UIButton(frame: CGRect(x: 20, y: 100, width: 100, height: 30))
        pdfReadButton.setTitle("Create PDF", for: .normal)
        pdfReadButton.addTarget(self, action: #selector(createPDF(_:)), for: .touchUpInside)
        self.view.addSubview(pdfReadButton)
    }
    
    func addReadPDFButton() {
        let pdfReadButton = UIButton(frame: CGRect(x: 20, y: 150, width: 100, height: 30))
        pdfReadButton.setTitle("Read PDF", for: .normal)
        pdfReadButton.addTarget(self, action: #selector(readPDF(_:)), for: .touchUpInside)
        self.view.addSubview(pdfReadButton)
    }
    
    @objc func createPDF(_: UIButton) {
        generatePDF()
    }
    
    func generatePDF() {
        let v1 = UIView(frame: CGRect(x: 0.0,y: 0, width: 100.0, height: 100.0))
        v1.backgroundColor = .red
        let v2 = UIView(frame: CGRect(x: 0.0,y: 0, width: 100.0, height: 200.0))
        v2.backgroundColor = .green

        let image1 = UIImage(named: "1.jpeg")!
        
        let page1 = PDFPage.view(v1)
        let page2 = PDFPage.view(v2)
        let page3 = PDFPage.whitePage(CGSizeMake(200, 100))
        let page4 = PDFPage.image(image1)
        let page5 = page4
        let pages = [page1, page2, page3, page4, page5]

        //let dst = documentDirectory().appending("sample1.pdf")
        if let dst = append(toPath: documentDirectory(), withPathComponent: "sample1.pdf") {
            do {
                try PDFGenerator.generate(pages, to: dst)
                readPDF(nil)
            } catch (let e) {
                print(e)
            }
        }
        
    }
    
    private func append(toPath path: String,
                        withPathComponent pathComponent: String) -> String? {
        if var pathURL = URL(string: path) {
            pathURL.appendPathComponent(pathComponent)
            
            return pathURL.absoluteString
        }
        
        return nil
    }
    
    @objc func readPDF(_ sender: UIButton?) {
        let url = "https://www.orimi.com/pdf-test.pdf"
        if let dstUrl = append(toPath: documentDirectory(), withPathComponent: "sample1.pdf") {
            //loadPDF(urlStr: dstUrl)
            if let fileData = try? Data(contentsOf: URL(fileURLWithPath: dstUrl))  {
                if let document = PDFDocument(url: URL(fileURLWithPath: dstUrl)) {
                    DispatchQueue.main.async {
                        let readerController = PDFViewController.createNew(with: document, actionStyle: .activitySheet)
                        self.navigationController?.pushViewController(readerController, animated: true)
                    }
                }
            }
        }
        
    }
    
    private func documentDirectory() -> String {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                    .userDomainMask,
                                                                    true)
        return documentDirectory[0]
    }
    
    func loadPDF(urlStr: String) {
        DispatchQueue.global().async {
            //let url = "https://www.orimi.com/pdf-test.pdf"
            //let url = "https://www.ucd.ie/t4cms/Test%20PDF-8mb.pdf"
            
            let remotePDFDocumentURL = URL(string: urlStr)!
            //let document = PDFDocument(url: remotePDFDocumentURL)!
            if let fileData = try? Data(contentsOf: remotePDFDocumentURL)  {
                
            }
            
            
            if let document = PDFDocument(url: remotePDFDocumentURL) {
                DispatchQueue.main.async {
                    let readerController = PDFViewController.createNew(with: document, actionStyle: .activitySheet)
                    self.navigationController?.pushViewController(readerController, animated: true)
                }
            }
            
            
        }

    }


}

