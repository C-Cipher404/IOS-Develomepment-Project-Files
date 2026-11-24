//
//  ContentView.swift
//  Animations
//
//  Created by Cortney Anderson on 11/17/26.
//




import SwiftUI

struct ContentView: View {
    @State private var floating = false
    @State private var magic = false

    private let night = Color(red: 0.10, green: 0.06, blue: 0.24)

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(
                    colors: [
                        night,
                        Color(red: 0.25, green: 0.12, blue: 0.43),
                        Color(red: 0.46, green: 0.24, blue: 0.57)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                StarField()

                VStack(spacing: 20) {
                    Spacer(minLength: 15)

                    Text("Magical Kitty")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)

                    Text("Make a little moonlight magic")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.75))

                    Spacer()

                    ZStack {
                        Circle()
                            .fill(.yellow.opacity(magic ? 0.32 : 0.12))
                            .frame(width: 310, height: 310)
                            .blur(radius: 48)

                        CrescentMoon()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        .yellow,
                                        Color(red: 1, green: 0.70, blue: 0.30)
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(width: 255, height: 270)
                            .shadow(
                                color: .yellow.opacity(magic ? 0.9 : 0.5),
                                radius: magic ? 35 : 20
                            )
                            .scaleEffect(magic ? 1.07 : 1)

                        KittyView()
                            .offset(x: -12, y: 13)

                        if magic {
                            MagicParticles()
                                .transition(.opacity.combined(with: .scale))
                                .allowsHitTesting(false)
                        }
                    }
                    .frame(height: 330)
                    .offset(y: floating ? -12 : 12)
                    .animation(
                        .easeInOut(duration: 2.5)
                            .repeatForever(autoreverses: true),
                        value: floating
                    )
                    .animation(
                        .spring(response: 0.6, dampingFraction: 0.55),
                        value: magic
                    )

                    Spacer()

                    Text(magic ? "You're pure magic! 💖" : "Tap ME!")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .contentTransition(.opacity)

                    Button {
                        withAnimation(
                            .spring(response: 0.5, dampingFraction: 0.55)
                        ) {
                            magic.toggle()
                        }
                    } label: {
                        Label(
                            magic ? "Reset Magic" : "Make Magic",
                            systemImage: magic
                                ? "arrow.counterclockwise"
                                : "sparkles"
                        )
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                colors: [.pink, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(.capsule)
                        .shadow(color: .pink.opacity(0.5), radius: 12)
                    }
                    .padding(.horizontal, 35)

                    Text("Psst... tap the kitty too! 🐾")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.65))

                    Spacer(minLength: 10)
                }
                .frame(width: geometry.size.width)
            }
        }
        .onAppear {
            floating = true
        }
    }
}

struct CrescentMoon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let top = CGPoint(
            x: rect.width * 0.65,
            y: rect.height * 0.05
        )

        let bottom = CGPoint(
            x: rect.width * 0.65,
            y: rect.height * 0.95
        )

        path.move(to: top)

        path.addCurve(
            to: bottom,
            control1: CGPoint(
                x: -rect.width * 0.18,
                y: rect.height * 0.13
            ),
            control2: CGPoint(
                x: -rect.width * 0.18,
                y: rect.height * 0.88
            )
        )

        path.addCurve(
            to: top,
            control1: CGPoint(
                x: rect.width * 0.33,
                y: rect.height * 0.79
            ),
            control2: CGPoint(
                x: rect.width * 0.33,
                y: rect.height * 0.23
            )
        )

        path.closeSubpath()
        return path
    }
}

struct KittyEar: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(
            to: CGPoint(x: rect.midX, y: rect.minY)
        )

        path.addLine(
            to: CGPoint(x: rect.maxX, y: rect.maxY)
        )

        path.addLine(
            to: CGPoint(x: rect.minX, y: rect.maxY)
        )

        path.closeSubpath()
        return path
    }
}

struct CurvedKittyTail: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(
            to: CGPoint(
                x: rect.width * 0.20,
                y: rect.height * 0.92
            )
        )

        path.addCurve(
            to: CGPoint(
                x: rect.width * 0.83,
                y: rect.height * 0.30
            ),
            control1: CGPoint(
                x: rect.width * 1.10,
                y: rect.height * 1.08
            ),
            control2: CGPoint(
                x: rect.width * 1.10,
                y: rect.height * 0.60
            )
        )

        path.addQuadCurve(
            to: CGPoint(
                x: rect.width * 0.52,
                y: rect.height * 0.25
            ),
            control: CGPoint(
                x: rect.width * 0.78,
                y: rect.height * 0.08
            )
        )

        return path
    }
}

struct KittyView: View {
    @State private var wagging = false
    @State private var eyesClosed = false
    @State private var showingLove = false

    private let fur = Color(
        red: 0.12,
        green: 0.10,
        blue: 0.18
    )

    var body: some View {
        ZStack {
            CurvedKittyTail()
                .stroke(
                    fur,
                    style: StrokeStyle(
                        lineWidth: 23,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                .frame(width: 95, height: 130)
                .rotationEffect(
                    .degrees(wagging ? 8 : -8),
                    anchor: .bottomLeading
                )
                .offset(x: 65, y: 34)
                .animation(
                    .easeInOut(duration: 1.4)
                        .repeatForever(autoreverses: true),
                    value: wagging
                )

            Ellipse()
                .fill(fur)
                .frame(width: 112, height: 135)
                .offset(y: 52)

            KittyEar()
                .fill(fur)
                .frame(width: 55, height: 65)
                .rotationEffect(.degrees(-15))
                .offset(x: -43, y: -62)

            KittyEar()
                .fill(fur)
                .frame(width: 55, height: 65)
                .rotationEffect(.degrees(15))
                .offset(x: 43, y: -62)

            KittyEar()
                .fill(.pink.opacity(0.75))
                .frame(width: 27, height: 36)
                .rotationEffect(.degrees(-15))
                .offset(x: -43, y: -53)

            KittyEar()
                .fill(.pink.opacity(0.75))
                .frame(width: 27, height: 36)
                .rotationEffect(.degrees(15))
                .offset(x: 43, y: -53)

            Circle()
                .fill(fur)
                .frame(width: 145, height: 125)
                .offset(y: -14)

            HStack(spacing: 36) {
                ForEach(0..<2, id: \.self) { _ in
                    ZStack {
                        if eyesClosed {
                            Capsule()
                                .fill(.yellow)
                                .frame(width: 22, height: 4)
                        } else {
                            Ellipse()
                                .fill(.yellow)
                                .frame(width: 19, height: 27)

                            Capsule()
                                .fill(.black)
                                .frame(width: 5, height: 20)
                        }
                    }
                    .frame(width: 22, height: 28)
                }
            }
            .offset(y: -21)

            KittyEar()
                .fill(.pink)
                .frame(width: 15, height: 12)
                .rotationEffect(.degrees(180))
                .offset(y: 7)

            HStack(spacing: 92) {
                VStack(spacing: 8) {
                    Capsule()
                        .fill(.white.opacity(0.8))
                        .frame(width: 30, height: 2)
                        .rotationEffect(.degrees(12))

                    Capsule()
                        .fill(.white.opacity(0.8))
                        .frame(width: 30, height: 2)
                        .rotationEffect(.degrees(-12))
                }

                VStack(spacing: 8) {
                    Capsule()
                        .fill(.white.opacity(0.8))
                        .frame(width: 30, height: 2)
                        .rotationEffect(.degrees(-12))

                    Capsule()
                        .fill(.white.opacity(0.8))
                        .frame(width: 30, height: 2)
                        .rotationEffect(.degrees(12))
                }
            }
            .offset(y: 12)

            if showingLove {
                HStack(spacing: 73) {
                    Ellipse()
                        .fill(.pink.opacity(0.75))
                        .frame(width: 25, height: 12)

                    Ellipse()
                        .fill(.pink.opacity(0.75))
                        .frame(width: 25, height: 12)
                }
                .offset(y: 15)
                .transition(.opacity)
            }

            HStack(spacing: 24) {
                Ellipse()
                    .fill(fur)
                    .frame(width: 40, height: 29)

                Ellipse()
                    .fill(fur)
                    .frame(width: 40, height: 29)
            }
            .offset(y: 105)

            if showingLove {
                Image(systemName: "heart.fill")
                    .font(.system(size: 27))
                    .foregroundStyle(.pink)
                    .offset(x: -82, y: -120)
                    .transition(.scale.combined(with: .opacity))
            }
        }
        .frame(width: 220, height: 270)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.spring(response: 0.3)) {
                showingLove.toggle()
                eyesClosed = true
            }

            DispatchQueue.main.asyncAfter(
                deadline: .now() + 0.2
            ) {
                withAnimation(.easeOut(duration: 0.15)) {
                    eyesClosed = false
                }
            }
        }
        .onAppear {
            wagging = true
        }
    }
}

struct MagicParticles: View {
    var body: some View {
        ZStack {
            FloatingMagicSymbol(
                symbol: "heart.fill",
                color: .pink,
                x: -115,
                y: -100,
                delay: 0
            )

            FloatingMagicSymbol(
                symbol: "heart.fill",
                color: .pink,
                x: 110,
                y: -75,
                delay: 0.4
            )

            FloatingMagicSymbol(
                symbol: "heart.fill",
                color: .red,
                x: -70,
                y: 105,
                delay: 0.8
            )

            FloatingMagicSymbol(
                symbol: "sparkles",
                color: .yellow,
                x: 120,
                y: 90,
                delay: 0.2
            )

            FloatingMagicSymbol(
                symbol: "sparkle",
                color: .white,
                x: -120,
                y: 85,
                delay: 0.6
            )

            FloatingMagicSymbol(
                symbol: "star.fill",
                color: .yellow,
                x: 80,
                y: -145,
                delay: 1.0
            )
        }
    }
}

struct FloatingMagicSymbol: View {
    let symbol: String
    let color: Color
    let x: CGFloat
    let y: CGFloat
    let delay: Double

    @State private var rising = false

    var body: some View {
        Image(systemName: symbol)
            .font(.system(size: 26))
            .foregroundStyle(color)
            .shadow(color: color.opacity(0.6), radius: 8)
            .offset(
                x: x,
                y: y + (rising ? -40 : 10)
            )
            .scaleEffect(rising ? 1.15 : 0.75)
            .opacity(rising ? 0.5 : 1)
            .animation(
                .easeInOut(duration: 2.0)
                    .repeatForever(autoreverses: true)
                    .delay(delay),
                value: rising
            )
            .onAppear {
                rising = true
            }
    }
}

struct StarField: View {
    @State private var twinkling = false

    private let stars: [(CGFloat, CGFloat)] = [
        (0.12, 0.12),
        (0.78, 0.10),
        (0.30, 0.22),
        (0.90, 0.30),
        (0.10, 0.40),
        (0.80, 0.48),
        (0.20, 0.65),
        (0.91, 0.73),
        (0.38, 0.83),
        (0.70, 0.88),
        (0.58, 0.18),
        (0.13, 0.87),
        (0.55, 0.55),
        (0.88, 0.60),
        (0.22, 0.95)
    ]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(stars.indices, id: \.self) { index in
                    Image(systemName: "star.fill")
                        .font(
                            .system(
                                size: index.isMultiple(of: 3) ? 14 : 8
                            )
                        )
                        .foregroundStyle(.white.opacity(0.85))
                        .scaleEffect(twinkling ? 0.45 : 1.2)
                        .opacity(twinkling ? 0.35 : 1)
                        .position(
                            x: geometry.size.width * stars[index].0,
                            y: geometry.size.height * stars[index].1
                        )
                        .animation(
                            .easeInOut(
                                duration: 1.0 + Double(index % 4) * 0.3
                            )
                            .repeatForever(autoreverses: true)
                            .delay(Double(index % 3) * 0.2),
                            value: twinkling
                        )
                }
            }
        }
        .allowsHitTesting(false)
        .onAppear {
            twinkling = true
        }
    }
}

#Preview {
    ContentView()
}


//
//I looked at a GitHub cat animation project and tutorials about creating custom shapes with SwiftUI Paths.
//
//I used circles, ellipses, and custom shapes to build the cat and moon.
//
//Then I added different animations:
//- **Rotation** to make the cat's tail swish.
//- **Offset** to make the moon and kitty float.
//- **Scale and opacity** to make the stars twinkle.
//- **Spring animations** to make the moon grow.
//- **Transitions** to make hearts and sparkles appear.
//
//I also made it interactive, so when you tap the kitty, it blinks and blushes, and when you press Make Magic, the hearts and sparkles animate.
