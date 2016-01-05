//
//  CommentView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 29/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class CommentView: UIView, UITextViewDelegate {
    
    var validateButton: UIButton!
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        let cureTitle = UILabel( frame: CGRect( x: 20, y: 10, width: self.frame.width, height: 40 ) )
        cureTitle.text = "Partagez votre avis"
        cureTitle.font = UIFont( name: "Bellota-Bold", size: 20.0 )
        cureTitle.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1.0 )
        self.addSubview( cureTitle )
        
        let textView = UITextView( frame: CGRect( x: 20, y: 50, width: self.frame.width - 40, height: 290 ) )
        textView.text = "Écrivez votre commentaire"
        textView.font = UIFont( name: "Bellota-Regular", size: 16.0 )
        textView.textContainerInset = UIEdgeInsetsMake( 10, 10, 10, 10 )
        textView.textColor = UIColor( red: 0.77, green: 0.77, blue: 0.77, alpha: 1.0 )
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor( red: 0.88, green: 0.88, blue: 0.89, alpha: 1.0 ).CGColor
        textView.delegate = self
        textView.layer.cornerRadius = 4.0
        self.addSubview( textView )
        
        self.validateButton = ValidateButton( frame: CGRect( x: self.frame.width - 70, y: self.frame.height - 70, width: 55, height: 55 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 ) )
        self.addSubview( self.validateButton )
    }
    
    func textViewDidBeginEditing( textView: UITextView ) {
        if textView.textColor == UIColor( red: 0.77, green: 0.77, blue: 0.77, alpha: 1.0 ) {
            textView.text = ""
            textView.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing( textView: UITextView ) {
        if textView.text.isEmpty {
            textView.text = "Écrivez votre commentaire"
            textView.textColor = UIColor( red: 0.77, green: 0.77, blue: 0.77, alpha: 1.0 )
        }
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}