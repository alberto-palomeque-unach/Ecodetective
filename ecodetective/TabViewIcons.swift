//
//  ContentView.swift
//  ecodetective
//
//  Created by ADMIN UNACH on 06/03/24.
//

import SwiftUI

enum TipoIcono: Int, Identifiable, Comparable {
    static func < (lhs: TipoIcono, rhs: TipoIcono) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    internal var id: Int {rawValue}
    
    case normal, camara, grafica
}

enum Pantallas: Int, Identifiable, CaseIterable, Comparable {
    static func < (lhs: Pantallas, rhs: Pantallas) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    internal var id: Int {rawValue}
    
    case principal, productos, camara, historial, noticias
    
    var icono: String {
        switch self {
        case .principal:
            return "sparkles"
        case .productos:
            return "waterbottle.fill"
        case .camara:
            return "camera.fill"
        case .historial:
            return "list.bullet.clipboard.fill"
        case .noticias:
            return "chart.bar.xaxis"
        }
    }
    
    var color: LinearGradient {
        switch self {
        case .principal, .productos, .camara, .historial, .noticias:
            return LinearGradient(colors: [.init(uiColor: UIColor(red: 0.18, green: 0.24, blue: 0.27, alpha: 1.00)), .init(uiColor: UIColor(red: 0.49, green: 0.76, blue: 0.52, alpha: 1.00)), .init(uiColor: UIColor(red: 0.25, green: 0.47, blue: 0.34, alpha: 1.00))], startPoint:
                    .bottomLeading, endPoint: .topTrailing)
        }
    }
    
    var tipo: TipoIcono {
        switch self {
        case .principal, .productos, .historial:
            return .normal
        case .camara:
            return .camara
        case .noticias:
            return .grafica
        }
    }
}

struct TabViewIcons: View {
    @State private var cambioPantalla: Pantallas = .principal
    @State private var position: CGFloat = -20
    var device = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.init(uiColor: UIColor(red: 0.18, green: 0.24, blue: 0.27, alpha: 1.00)), .init(uiColor: UIColor(red: 0.49, green: 0.76, blue: 0.52, alpha: 1.00)), .init(uiColor: UIColor(red: 0.25, green: 0.47, blue: 0.34, alpha: 1.00))], startPoint:
                    .bottomLeading, endPoint: .topTrailing).ignoresSafeArea()
            ZStack {
                switch cambioPantalla {
                case .principal:
                    //Placeholder
                    Text("Placeholder")
                case .productos:
                    SearchView()
                case .camara:
                    CameraRecognitionView()
                case .historial:
                    //Placeholder
                    Text("Placeholder")
                case .noticias:
                    NoticiasView()
                }
                HStack(spacing: 23) {
                    ForEach(Pantallas.allCases) { pantalla in
                        TabViewButton(cambioPantalla: $cambioPantalla, pantalla: pantalla).offset(y: pantalla.icono == "camera.fill" ? -10 : 0)
                    }
                }.aspectRatio(contentMode: .fit).padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)).frame(width: 350, height: 50)
                    .background(content: {
                        Color.white.clipShape(RoundedRectangle(cornerRadius: 25.0))
                    })
                    .offset(y: device == .phone ? 445 : 580)
                    .foregroundStyle(.linearGradient(colors: [.green, .blue], startPoint: .bottomLeading, endPoint: .bottomTrailing))
            }.frame(height: device == .phone ? 782 : 1050).offset(y: -35)
        }
    }
}

struct TabViewButton: View {
    @Binding var cambioPantalla: Pantallas
    let pantalla: Pantallas
    @State private var animationCamera: Bool = false
    @State private var animationColor = false

    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.3)) {
                cambioPantalla = pantalla
            }
        }, label: {
            ZStack{
                Group {
                    switch pantalla.tipo {
                    case .normal, . grafica:
                        Color.white
                            .frame(width: pantalla == cambioPantalla ? 60 : 45, height: pantalla == cambioPantalla ? 60 : 45).overlay(Circle().stroke(pantalla == cambioPantalla ? pantalla.color : LinearGradient(colors: [.white], startPoint: .top, endPoint: .bottom), lineWidth: 10))
                    case .camara:
                        Color.white
                            .frame(width: 55, height: 55).overlay(Circle().trim(from: 0.5, to: 1).stroke(lineWidth: 5)).rotationEffect(.degrees(animationCamera ? 360 : 0))
                    }
                }
            }.clipShape(Circle())
                .overlay(
                    Group {
                        switch pantalla.tipo {
                        case .normal:
                            Image(systemName: pantalla.icono)
                                .font(.system(size: 30))
                        case .camara:
                            Image(systemName: pantalla.icono)
                                .font(.system(size: 35))
                                .onAppear() {
                                    withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                                        animationCamera.toggle()
                                    }
                                    withAnimation(.easeInOut(duration: 1).repeatForever()) {
                                        animationColor.toggle()
                                    }
                                }.foregroundStyle(LinearGradient(colors: animationColor ? [.green, .blue] : [.blue.opacity(0.45), .green.opacity(0.45)], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                        case .grafica:
                            Image(systemName: pantalla.icono)
                                .resizable().frame(width: 30, height: 30)
                        }
                    }
                )
                .frame(width: 45, height: 45)
        }).offset(y: pantalla == cambioPantalla && pantalla.icono != "camera.fill" ? -20 : 0)
    }
}

#Preview {
    TabViewIcons()
}
