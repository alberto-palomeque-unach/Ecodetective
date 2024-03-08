//
//  HistorialView.swift
//  ecodetective
//
//  Created by ADMIN UNACH on 07/03/24.
//

import SwiftUI

struct HistorialView: View {
    @State private var buttonColor = Color.green
    var device = UIDevice.current.userInterfaceIdiom
    let productosRandom:[DatosProductos] = [productos[3], productos[2], productos[2], productos[1]]
    
    var body: some View {
        ScrollView {
            Text("Historial de productos").offset(y: 150).frame(width: 500, height: 0).font(.system(size: 40)).padding(.trailing, 30).padding(.bottom, 60)
            ForEach(productosRandom) { producto in
                HStack {
                    Rectangle()
                        .frame(width: device == .phone ? 410 :590, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 3)
                        .overlay {
                            HStack {
                                ForEach(producto.etiquetas, id: \.id) { etiqueta in
                                    Rectangle()
                                        .frame(width: device == .phone ? etiqueta.width - 10: etiqueta.width, height: device == .phone ? etiqueta.height - 10: etiqueta.height)
                                        .foregroundStyle(etiqueta.color)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                        .overlay {
                                            Text(etiqueta.nombre)
                                                .foregroundColor(.white)
                                                .bold()
                                                .font(.system(size: device == .phone ? 8.5 : 11))
                                        }
                                        .padding(.bottom, device == .phone ? 150 : 90)
                                }
                            }
                            .padding(.leading, 150)
                            
                            Image(producto.imagen)
                                .resizable()
                                .frame(width: device == .phone ? producto.imagenAncho - 40: producto.imagenAncho, height: device == .phone ? producto.imagenAlto - 40: producto.imagenAlto)
                                .padding(.trailing, device == .phone ? 280 : 420)
                                .padding(.top, device == .phone ? -10 : 30)
                            Text(producto.presentacion)
                                .foregroundStyle(.gray)
                                .bold()
                                .font(.system(size: device == .phone ? 10 : 17))
                                .padding(.bottom, 150)
                                .padding(.trailing, device == .phone ? 250 : 370)
                            HStack {
                                Rectangle()
                                    .frame(width: device == .phone ? 250 : 520, height: 150)
                                    .foregroundStyle(.clear)
                                    .overlay {
                                        Text(producto.descripcion)
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 15))
                                            .padding()
                                    }
                            }
                            .padding(.top, device == .phone ? -35 : 20)
                            .padding(.leading, device == .phone ? 150 : 130)
                            Text("Fecha de consulta: " + Date.now.formatted(date: .long, time: .omitted))
                                .font(.caption)
                                .foregroundStyle(.gray)
                                .padding(.top, 150)
                                .padding(.trailing, 120)
                            BotonView(colorBoton: $buttonColor)
                        }
                }
                .padding(.top, 25).offset(y: device == .phone ? 178 : 115)
            }
        }
    }
}

#Preview {
    HistorialView()
}
