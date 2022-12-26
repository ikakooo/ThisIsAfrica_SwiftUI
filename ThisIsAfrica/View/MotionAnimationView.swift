//
//  MotionAnimationView.swift
//  ThisIsAfrica
//
//  Created by IKAKOOO on 12/25/22.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERITES
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // MARK: - FUNCTION
    
    // 1. RANDOM COORDINATE
    func randomCoordinade(max: CGFloat)-> CGFloat {
        CGFloat.random(in: 0...max)
    }
    
    // 2. RAMDOM SIZE
    func randomSize()-> CGFloat  { CGFloat(Int.random(in: 10...300)) }
    
    // 3. RAMDOM SCALE
    func randomScale()-> CGFloat  { CGFloat(Double.random(in: 0.1...2.0)) }
    // 4. RAMDOM SPEED
    func randomSpeed()-> Double { Double.random(in: 0.025...1.0) }
    // 5. RAMDOM DELAY
    func randomDelay()-> Double { Double.random(in: 0...2) }
    
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometri in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinade(max: geometri.size.width ),
                            y: randomCoordinade(max: geometri.size.height )
                    )
                        .animation(
                            Animation.interpolatingSpring(stiffness:0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                } //: LOOP
            } //: ZSTACK
            .drawingGroup()
        } //: GEOMETRY
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
