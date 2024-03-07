import SwiftUI
import Charts

struct Datos: Identifiable {
    let id = UUID()
    let name: String
    let numero: Int
}

let datosGraficos: [Datos] = [
    .init(name: "a", numero: 100),
    .init(name: "b", numero: 240),
    .init(name: "c", numero: 120),
    .init(name: "d", numero: 210),
    .init(name: "e", numero: 190),
    .init(name: "f", numero: 180),
    .init(name: "g", numero: 170),
    .init(name: "h", numero: 150),
    .init(name: "i", numero: 120),
    .init(name: "j", numero: 100),
    .init(name: "k", numero: 70),
    .init(name: "l", numero: 80),
    .init(name: "m", numero: 60),
    .init(name: "n", numero: 50),
    .init(name: "o", numero: 30),
    .init(name: "p", numero: 20)
]

struct NoticiasView: View {
    var device = UIDevice.current.userInterfaceIdiom
    
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
                    ScrollView {
                        VStack {
                            Group {
                                ForEach(conjuntoNoticias) { noticia in
                                    Link(destination: URL(string: noticia.URL)!) {
                                        VStack {
                                            Text(noticia.name).font(.system(size: 25))
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
    .init(name: "Aumento de deforestacion en Bacalar", URL: "https://www.greenpeace.org/mexico/noticia/53600/ante-aumento-de-deforestacion-en-bacalar-urge-que-profepa-y-senasica-investiguen-y-sancionen-a-los-responsables/"),
    .init(name: "Auge de la agricultura Orgánica en México", URL: "https://tecnoagro.com.mx/no.-170/el-auge-de-la-agricultura-organica-en-mexico-estadisticas-y-tendencias"),
    .init(name: "¿Qué son los alimentos organicos?", URL: "https://www.eluniversal.com.mx/menu/que-son-los-alimentos-organicos/"),
    .init(name: "e", URL: "https://developer.apple.com/documentation/charts"),
    .init(name: "Contaminación de miel con residuos de plaguicidas", URL: "https://www.diariodelsur.com.mx/local/ecosur-abejas-miel-contaminada-uso-excesivo-de-plaguicidas-cambio-climatico-9621859.html"),
    .init(name: "Residuos de plaguicidas en los alimentos", URL: "https://www.who.int/es/news-room/fact-sheets/detail/pesticide-residues-in-food"),
    .init(name: "Poca producción de cultivos orgánicos en México", URL: "https://producepay.com/es/el-blog/por-que-en-mexico-se-produce-tan-poco-volumen-de-cultivos-organicos/"),
    .init(name: "eke", URL: "https://developer.apple.com/documentation/charts")
]

#Preview {
    NoticiasView()
}
