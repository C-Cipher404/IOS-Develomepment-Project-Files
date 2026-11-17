//
//  ContentView.swift
//  Grids Labs 1&2
//
//  Created by Cortney Anderson on 11/11/26.
//



import SwiftUI

struct ContentView: View {

    // One row for hats
    let hatRows = [
        GridItem(.fixed(150))
    ]

    // Two fixed rows for shirts
    let shirtRows = [
        GridItem(.fixed(130)),
        GridItem(.fixed(130))
    ]

    // Four adaptive rows for pants
    let pantRows = Array(
        repeating: GridItem(.adaptive(minimum: 100, maximum: 100)),
        count: 4
    )

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 30) {

                    // HATS
                    Text("Hats")
                        .font(.largeTitle)
                        .bold()
                        .id("Hats")

                    ScrollView(.horizontal) {
                        LazyHGrid(rows: hatRows, spacing: 16) {
                            ForEach(hats, id: \.self) { hat in
                                ClothingCard(item: hat)
                                    .frame(width: 170, height: 150)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .frame(height: 150)

                    // SHIRTS
                    Text("Shirts")
                        .font(.largeTitle)
                        .bold()

                    ScrollView(.horizontal) {
                        LazyHGrid(rows: shirtRows, spacing: 16) {
                            ForEach(shirts, id: \.self) { shirt in
                                ClothingCard(item: shirt)
                                    .frame(width: 170, height: 130)
                            }
                        }
                    }
                    .frame(height: 276)

                    // PANTS
                    Text("Pants")
                        .font(.largeTitle)
                        .bold()

                    ScrollView(.horizontal) {
                        LazyHGrid(rows: pantRows, spacing: 16) {
                            ForEach(pants, id: \.self) { pant in
                                ClothingCard(item: pant)
                                    .frame(width: 170, height: 100)
                            }
                        }
                    }
                    .scrollTargetBehavior(.paging)
                    .frame(height: 448)

                    // ORDER SUMMARY
                    Text("Order Summary")
                        .font(.largeTitle)
                        .bold()

                    Grid(
                        alignment: .leading,
                        horizontalSpacing: 16,
                        verticalSpacing: 12
                    ) {

                        // Header row
                        GridRow {
                            Text("Item")
                                .bold()

                            Text("Size")
                                .bold()

                            Text("Price")
                                .bold()
                                .gridColumnAlignment(.trailing)
                        }

                        Divider()

                        // Item 1 - Hat
                        GridRow {
                            Text("Baseball Cap")
                            Text("M")
                            Text("$19.99")
                        }

                        // Item 2 - Shirt
                        GridRow {
                            Text("Graphic Tee")
                            Text("M")
                            Text("$15.99")
                        }

                        // Item 3 - Pants
                        GridRow {
                            Text("Jeans")
                            Text("32")
                            Text("$39.99")
                        }

                        // Item 4 - Hat
                        GridRow {
                            Text("Beanie")
                            Text("One Size")
                            Text("$14.99")
                        }

                        Divider()

                        // Total row
                        GridRow {
                            Text("Total")
                                .bold()
                                .gridCellColumns(2)

                            Text("$90.96")
                                .bold()
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue.opacity(0.1))
                    .clipShape(.rect(cornerRadius: 12))

                    // BACK TO TOP
                    Button {
                        withAnimation {
                            proxy.scrollTo("Hats", anchor: .top)
                        }
                    } label: {
                        Label("Back to Top", systemImage: "arrow.up")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 12))
                    }
                }
                .padding()
            }
        }
    }
}

// Reusable clothing card
struct ClothingCard: View {
    let item: Clothing

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(item.name)
                .font(.headline)
                .lineLimit(2)

            Text(item.price, format: .currency(code: "USD"))
                .font(.subheadline)
                .bold()

            Text("Size: \(item.size)")
                .font(.caption)

            Text("Color: \(item.color)")
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
        .padding(10)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .leading
        )
        .background(.blue.opacity(0.1))
        .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    ContentView()
}
