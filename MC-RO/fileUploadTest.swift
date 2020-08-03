//
//  fileUploadTest.swift
//  MC-RO
//
//  Created by chuanlin on 2020/7/29.
//  Copyright © 2020 薛竣祐. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
import MobileCoreServices

struct fileUpload: View {
    
    @State var show = false
    @State var alert = false
    
    var body: some View{
        Button(action: {
            self.show.toggle()
        }){
            Image("upload")
                .resizable()
                .padding()
                .frame(width: 100, height: 100)
                .opacity(0.5)
        }.sheet(isPresented: $show){
            DocumentPicker(alert: self.$alert)
        }
        .alert(isPresented: $alert){
            Alert(title: Text("Message"), message: Text("upload successfully!!"), dismissButton: .default(Text("OK")))
        }
        .buttonStyle(
            PlainButtonStyle()
               
        )
    }
}

struct fileUpload_preview: PreviewProvider {
    static var previews: some View{
        fileUpload()
    }
}

struct DocumentPicker : UIViewControllerRepresentable {
    func makeCoordinator() -> DocumentPicker.Coordinator {
        return DocumentPicker.Coordinator(parent1: self)
    }
    
    @Binding var alert : Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPicker>) -> UIDocumentPickerViewController {
        
        let picker = UIDocumentPickerViewController(documentTypes: [String(kUTTypeItem)], in: .open)
        picker.allowsMultipleSelection = false
        picker.delegate = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPicker>) {
        
    }
    
    class Coordinator : NSObject,UIDocumentPickerDelegate{
        
        var parent : DocumentPicker
        
        init(parent1 : DocumentPicker) {
            parent = parent1
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            print(urls)
//            var uploadSongList = [URL]()
            
//            uploadSongList.append(contentsOf: urls)
//            print(uploadSongList)
        }
    }
}

