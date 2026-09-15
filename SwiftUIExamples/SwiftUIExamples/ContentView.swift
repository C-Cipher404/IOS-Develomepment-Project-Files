//
//  ContentView.swift
//  SwiftUIExamples
//
//  Created by Cortney Anderson on 9/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.mint.opacity(0.1))
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    HStack {
                        Spacer()

                        Text("Cortney Anderson")
                            .font(.largeTitle)
                            .foregroundStyle(.pink.opacity(0.7))
                            .bold()

                        Spacer()
                    }
                    
                    HStack {
                        Spacer()

                        Text("About Me")
                            .font(.largeTitle)
                            .foregroundStyle(.pink.opacity(0.5))
                            .bold()

                        Spacer()
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                                .fill(.pink.opacity(0.3))
                        Text("""
                I am a mom of two. I have a 5-year-old daughter and a 3-year-old son. I love hiking and doing anything adventurous with my family and friends. I am huge into the concert scene and have been to over 100 concerts across many different genres. I love my dog, and she is my best friend. I have been working as a software engineer for a little over a year and a half, and I am hoping this program will help me get into the mobile development scene and eventually make a little more money.
                """
                        )
                        .font(.body)
                        .foregroundStyle(.black)
                        .padding()
                       
                    }
                    
                    HStack {
                        Spacer()

                        Text("Fun Facts")
                            .font(.largeTitle)
                            .foregroundStyle(.pink.opacity(0.5))
                            .bold()

                        Spacer()
                    }
                        
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.pink.opacity(0.3))
                        
                        Text("""
                • I am learning how to code in Swift.
                • I love painting rocks with my kids.
                • I enjoy traveling and exploring new places.
                
                """)
                        .font(.body)
                        .foregroundStyle(.black)
                        .padding()
                    }
                    
                    HStack{
                        Spacer()
                        
                        Text("👩🏼‍💻")
                            .font(.system(size: 80))
                            .padding()
                            .background(.pink.opacity(0.3))
                            .clipShape(Circle())
                            .shadow(radius: 8)
                        
                        Spacer()
                    }
                }
                .padding()
            }
        }
    }


#Preview {
    ContentView()
}

