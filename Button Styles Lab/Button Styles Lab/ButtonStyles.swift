//
//  ButtonStyles.swift
//  Button Styles Lab
//
//  Created by Cortney Anderson on 11/5/26.
//

import SwiftUI

struct ChunkyButtonStyle: ButtonStyle {
    var color: Color = .orange

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                configuration.role == .destructive ? Color.red : color
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: configuration.isPressed ? 0 : 4)
            .offset(y: configuration.isPressed ? 4 : 0)
    }
}

struct CircleIconButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .frame(width: 44, height: 44)
            .background(.orange)
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 0.85 : 1.0)
    }
}

struct ChipButtonStyle: ButtonStyle {
    var isSelected: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(isSelected ? .white : .primary)
            .padding()
            .background(
                isSelected
                ? Color.orange
                : Color.gray.opacity(0.2)
            )
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

extension ButtonStyle where Self == ChunkyButtonStyle {
    static func chunky(color: Color = .orange) -> ChunkyButtonStyle {
        ChunkyButtonStyle(color: color)
    }
}

extension ButtonStyle where Self == CircleIconButtonStyle {
    static var circleIcon: CircleIconButtonStyle {
        CircleIconButtonStyle()
    }
}

extension ButtonStyle where Self == ChipButtonStyle {
    static func chip(isSelected: Bool) -> ChipButtonStyle {
        ChipButtonStyle(isSelected: isSelected)
    }
}
