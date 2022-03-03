//
//  ShareViewController.swift
//  ShareExtensionPDF
//
//  Created by Pelayo Mercado on 2/24/22.
//

import UIKit
import Social
import MobileCoreServices
import UniformTypeIdentifiers
import PDFKit



class ShareViewController: UIViewController {
    
    var pdfString: String?
    

    
    override func viewDidLoad() {
        
        for item in self.extensionContext!.inputItems as! [NSExtensionItem] {
            
            for provider in item.attachments! {
                if provider.hasItemConformingToTypeIdentifier(kUTTypePDF as String) {
                    provider.loadItem(forTypeIdentifier: kUTTypePDF as String, options: nil, completionHandler: { (pdfUrl, error) in
                        OperationQueue.main.addOperation {
                                if let pdfUrl = pdfUrl as? URL {
                                // pdfUrl now contains the path to the shared pdf data
                                    print("THIS IS YOUR PDF URL \(pdfUrl) ")
                                    let defaults = UserDefaults(suiteName: "group.miguelhoracio.PDFPelayoV02")
                                    defaults?.set(pdfUrl, forKey: "pdfUrl")
                                    self.openContainerApp()
                                    self.extensionContext!.cancelRequest(withError:NSError())
                                    
                        }
                    }
              }
         ) }

            }
        }
        
//        let returnProvider = NSItemProvider(item: pdfString as NSSecureCoding?, typeIdentifier: UTType.pdf.identifier as String)
//        let returnItem = NSExtensionItem()
//        returnItem.attachments = [returnProvider]
//
//
//        self.extensionContext?.completeRequest(returningItems: [returnItem], completionHandler: { success in
//
//                self.openContainerApp()
//
//                self.closeView()
//
//
//
//
//        })
        
        
    }
    
   
    func closeView() {
        self.view.backgroundColor = .blue
        
    }
  
    

//    override func isContentValid() -> Bool {
//        // Do validation of contentText and/or NSExtensionContext attachments here
//        return true
//    }
//
//    override func didSelectPost() {
//        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
//
//        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
//        //self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
//        for item in self.extensionContext!.inputItems as! [NSExtensionItem] {
//            for provider in item.attachments! {
//                if provider.hasItemConformingToTypeIdentifier(kUTTypePDF as String) {
//                    provider.loadItem(forTypeIdentifier: kUTTypePDF as String, options: nil, completionHandler: { (pdfUrl, error) in
//                        OperationQueue.main.addOperation {
//                                if let pdfUrl = pdfUrl as? URL {
//                                // pdfUrl now contains the path to the shared pdf data
//                                    print("THIS IS YOUR PDF URL \(pdfUrl) ")
//                                    let defaults = UserDefaults(suiteName: "group.miguelhoracio.PDFPelayoV02")
//                                    defaults?.set(pdfUrl, forKey: "pdfUrl")
//                        }
//                    }
//              }
//         ) }
//
//            }
//        }
//
//        let returnProvider = NSItemProvider(item: pdfString as NSSecureCoding?, typeIdentifier: UTType.pdf.identifier as String)
//        let returnItem = NSExtensionItem()
//        returnItem.attachments = [returnProvider]
//
//       // self.extensionContext!.completeRequest(returningItems: [returnItem], completionHandler: nil)
//        self.extensionContext?.completeRequest(returningItems: [returnItem], completionHandler: { success in
//
//                self.openContainerApp()
//
//        })
//        //openContainerApp()
//
//
//    }
    
    // For skip compile error.
   @objc func openURL(_ url: URL) {
        return
    }

    func openContainerApp() {
        var responder: UIResponder? = self as UIResponder
        let selector = #selector(openURL(_:))
        while responder != nil {
            if responder!.responds(to: selector) && responder != self {
                responder!.perform(selector, with: URL(string: "PDFUrl://")!)
                return
            }
            responder = responder?.next
        }
    }
    
//    @objc func openURL(_ url: URL) -> Bool {
//        var responder: UIResponder? = self
//        while responder != nil {
//            if let application = responder as? UIApplication {
//                return application.perform(#selector(openURL(_:)), with: url) != nil
//            }
//            responder = responder?.next
//        }
//        return false
//    }

//    override func configurationItems() -> [Any]! {
//        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
//        return []
//    }

}
