import SwiftUI
import Charts

struct Datos: Identifiable {
    let id = UUID()
    let name: String
    let numero: Int
}

let datosGraficos: [Datos] = [
    .init(name: "hola", numero: 2),
    .init(name: "Adios", numero: 1),
    .init(name: "he", numero: 2),
    .init(name: "lo", numero: 5)
]

struct NoticiasView: View {
    var device = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
                VStack {
                    Spacer()
                    Chart(datosGraficos) { dato in
                        BarMark (
                            x: .value("name", dato.name),
                            y: .value("Numero", dato.numero)
                        )
                        LineMark(
                            x: .value("name", dato.name),
                            y: .value("Numero", dato.numero)
                        )
                        
                    }.foregroundStyle(.green).frame(width: device == .phone ? 400 : 800, height: device == .phone ? 300 : 600).background(.black)
                    ScrollView {
                        VStack {
                            Group {
                                ForEach(conjuntoNoticias) { noticia in
                                    Link(destination: URL(string: noticia.URL)!) {
                                        VStack(alignment: .leading) {
                                            Text("Nombre noticia")
                                            Text(noticia.name)
                                        }
//                                        Button {
//                                            Link(destination: URL(string: noticia.URL)!) {
//                                            }
//                                        } label: {
//                                            Text("Nombre noticia")
//                                            Text(noticia.name)
//                                        }

                                    }
                                }
                            }.padding().frame(width: device == .phone ? 400 : 800, height: 80, alignment: .leading)
                                .background {
                                    Color.white.clipShape(RoundedRectangle(cornerRadius: 12.0))
                                }.foregroundStyle(.black)
                        }
                    }
                }
            }
}
struct Noticias: Identifiable {
    let id = UUID()
    let name: String
    let URL: String
}
let conjuntoNoticias: [Noticias] = [
    .init(name: "HOLA NIJDKFJKSDJFKJFJKDSJF JAJAJ", URL: "https://www.greenpeace.org/mexico/noticia/53600/ante-aumento-de-deforestacion-en-bacalar-urge-que-profepa-y-senasica-investiguen-y-sancionen-a-los-responsables/"),
    .init(name: "eke", URL: "https://tecnoagro.com.mx/no.-170/el-auge-de-la-agricultura-organica-en-mexico-estadisticas-y-tendencias")
]

#Preview {
    Notice()
}
