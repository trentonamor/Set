//
//  AspectVGrid.swift
//  Set
//
//  Created by Trenton Parrotte on 8/13/24.
//

import Foundation
import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    var items: [Item]
    var aspectRatio: CGFloat = 1.0
    var content: (Item) -> ItemView
    
    init(_ items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body : some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWidthThatFits(count: self.items.count, size: geometry.size, atAspectRatio: aspectRatio)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0) {
                ForEach(self.items) { item in
                    content(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
        }
    }
}

extension AspectVGrid {
    func gridItemWidthThatFits(count: Int, size: CGSize, atAspectRatio aspectRatio: CGFloat) -> CGFloat {
        var colCount = 1.0
        let count = CGFloat(count)
        repeat {
            let width = size.width / colCount
            let height = width / aspectRatio
            
            let rowCount = (count / colCount).rounded(.up)
            if rowCount * height < size.height {
                return (size.width / colCount).rounded(.down)
            }
            colCount += 1
        } while colCount < count
        
        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }
}

