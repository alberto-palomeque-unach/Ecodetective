import SwiftUI
import Charts

struct Datos: Identifiable {
    let id = UUID()
    let name: String
    let numero: Int
}


let datosGraficos: [Datos] = [
    .init(name: "Aguascalientes", numero: 58),
    .init(name: "Baja California", numero: 47),
    .init(name: "Baja California Sur", numero: 19),
    .init(name: "Campeche", numero: 1106),
    .init(name: "Chiapas", numero: 194),
    .init(name: "Chihuahua", numero: 194),
    .init(name: "Coahuila", numero: 52),
    .init(name: "Colima", numero: 30),
    .init(name: "Durango", numero: 72),
    .init(name: "Guanajuato", numero: 240),
    .init(name: "Guerrero", numero: 1023),
    .init(name: "Hidalgo", numero: 129),
    .init(name: "Jalisco", numero: 284),
    .init(name: "México", numero: 674),
    .init(name: "Michoacán", numero: 285),
    .init(name: "Morelos", numero: 274),
    .init(name: "Nayarit", numero: 120),
    .init(name: "Nuevo León", numero: 40),
    .init(name: "Oaxaca", numero: 376),
    .init(name: "Puebla", numero: 508),
    .init(name: "Querétaro", numero: 102),
    .init(name: "Quintana Roo", numero: 93),
    .init(name: "San Luis Potosí", numero: 131),
    .init(name: "Sinaloa", numero: 195),
    .init(name: "Sonora", numero: 51),
    .init(name: "Tabasco", numero: 221),
    .init(name: "Tamaulipas", numero: 67),
    .init(name: "Tlaxcala", numero: 37),
    .init(name: "Veracruz", numero: 823),
    .init(name: "Yucatán", numero: 290),
    .init(name: "Zacatecas", numero: 86)
]


struct NoticiasView: View {
    var device = UIDevice.current.userInterfaceIdiom
    
    @State private var showSafari: Bool = false
    
    var body: some View {
                VStack {
                    Spacer()
                    Chart(datosGraficos) { dato in
                        AreaMark (
                            x: .value("name", dato.name),
                            y: .value("Numero", dato.numero)
                        ).foregroundStyle(.linearGradient(colors: [.green.opacity(0.5), .green.opacity(0.05)], startPoint: .top, endPoint: .bottom))
                        LineMark(
                            x: .value("name", dato.name),
                            y: .value("Numero", dato.numero)
                        )
                        
                    }.foregroundStyle(.green).frame(width: device == .phone ? 400 : 800, height: device == .phone ? 300 : 600).background(.black)
                    NoticiasHeadlinesView()
                }
            }
}

struct Noticias: Identifiable {
    let id = UUID()
    let name: String
    let url: String
}

#Preview {
    NoticiasView()
}
