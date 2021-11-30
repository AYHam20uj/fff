//
//  ImageView.swift
//  final
//
//  Created by Ayham on 2021-11-29.
//

import SwiftUI
struct ImageView: View {
    var stringUrl : String
    var isIcon=false
    var body: some View {
        AsyncImage(url: URL(string: stringUrl)) { phase in
                if let image = phase.image {
                    image // Displays the loaded image.
                        .resizable()

                } else if phase.error != nil {
                    Color.red // Indicates an error.
                } else {
                    Color.blue // Acts as a placeholder.
                }
            
            }
        .frame( maxWidth: isIcon ? 50 :350, maxHeight:isIcon ? 50 :300)
        .clipShape(RoundedRectangle(cornerRadius: 10))

    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(stringUrl: "")
    }
}
