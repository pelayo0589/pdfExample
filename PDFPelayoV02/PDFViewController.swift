//
//  ViewController.swift
//  PDFPelayoV02
//
//  Created by Pelayo Mercado on 2/20/22.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         let pdfView = PDFView(frame: self.view.bounds)
        //pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(pdfView)
        
        let documentURL = Bundle.main.url(forResource: "21", withExtension: "pdf")
        if let document = PDFDocument(url: documentURL!) {
            pdfView.document = document
        }
        
        
        
    }


}

