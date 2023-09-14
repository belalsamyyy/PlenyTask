//
//  SplashView.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/14/23.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        ZStack {
            Color("primaryColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 0) {
                
                Image("logo-pleny")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300, alignment: .center)
                
                Text("#TheNextBigSocialNetwork")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom, 15)
            }
            
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

