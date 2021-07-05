import UIKit

//  Converted to Swift 5.4 by Swiftify v5.4.29596 - https://swiftify.com/
let ellipsis = "…"

extension String {
    /// 处理换行截断字符串
    /// - Parameters:
    ///   - string: ]
    ///   - width: label的宽度
    ///   - numberOfLines: label的numberOfLines
    ///   - font: label的font
    /// - Returns: 处理后的字符串
    mutating func stringByTruncating(at string: String, width: CGFloat, numberOfLines: Int, font: UIFont) -> String {
        
        let attr: [NSAttributedString.Key : UIFont] = [NSAttributedString.Key.font: font]
        
        // origin
        let originHeight = self.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: attr, context: nil).size.height
        
        // standard
        var standardString = ""
        for _ in 1..<numberOfLines {
            standardString += "\n"
        }
        let standardHeight = standardString.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: attr, context: nil).size.height
        
        //compare
        if originHeight <= standardHeight || (self as NSString).range(of: (string ) as String).location == NSNotFound {
            return self
        }
        
        //获取]的唯一位置
        var range = (self as NSString).range(of: string)
        range.length = 1
        
        //先处理...
        range.location -= 1
        if let subRange = Range<String.Index>(range, in: self) { self.replaceSubrange(subRange, with: ellipsis) }
        
        //处理其他
        while range.location > 0 {
            let tempHeight = self.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: attr, context: nil).size.height
            if tempHeight == standardHeight {
                break
            } else {
                range.location -= 1
                if let subRange = Range<String.Index>(range, in: self) { self.removeSubrange(subRange) }
            }
        }
        return self
    }
}
