import SwiftUI

struct ProductosEcoView: View {
    @State private var buttonColor = Color.green
    @State private var buttonColor2 = Color.green
    @State private var buttonColor3 = Color.green
    @State private var buttonColor4 = Color.green
    var device = UIDevice.current.userInterfaceIdiom
    var body: some View{
            ZStack {
                Color.clear
                ScrollView{
                    Text("Productos Eco").offset(y: 150).frame(width: 500, height: 0).font(.system(size: 40)).padding(.trailing, 130).padding(.bottom, 80)
                    HStack{
                        Rectangle()
                            .cornerRadius(20)
                            .shadow(radius: 3)
                            .frame(width: device == .phone ? 410 : 590, height: device == .phone ? 350 : 350)
                            .overlay{
                                HStack{
                                    Text("Los productos más populares de esta semana son")
                                        .bold()
                                        .foregroundColor(.gray)
                                        .padding(.bottom, device == .phone ? 220 : 300).offset(y: -40)
                                        .padding(.trailing, 50)
                                }.padding(.top, 50)
                                    .padding(.leading, 90)
                                HStack{
                                    Rectangle()
                                        .frame(width: 100, height: 150)
                                        .foregroundColor(.orange)
                                        .cornerRadius(3.0)
                                        .overlay{
                                            Text("1")
                                                .bold()
                                                .font(.system(size: 40))
                                        }
                                }.padding(.top, 180)
                                Image("JugoPomita")
                                    .resizable()
                                    .frame(width: 80, height: 150)
                                    .padding(.bottom, 80)
                                Image("CafeAltura")
                                    .resizable()
                                    .frame(width: 70, height: 100)
                                    .padding(.trailing, 200)
                                Image("AzucarAires")
                                    .resizable()
                                    .frame(width: 150, height: 200)
                                    .padding(.top, 62)
                                    .padding(.leading, 200)
                                HStack{
                                    Rectangle()
                                        .frame(width: 100, height: 120)
                                        .cornerRadius(3.0)
                                        .foregroundColor(.blue)
                                        .overlay{
                                            Text("2")
                                                .bold()
                                                .font(.system(size: 40))
                                        }
                                }.padding(.top, 210)
                                    .padding(.trailing, 200)
                                HStack{
                                    Rectangle()
                                        .cornerRadius(3.0)
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.green)
                                        .overlay{
                                            Text("3")
                                                .bold()
                                                .font(.system(size: 40))
                                        }
                                }.padding(.top, 230)
                                    .padding(.leading, 200)
                            }
                    }.offset(x: 0, y: device == .phone ? 180 : 115)
                    ForEach(productos) { producto in
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
                                        // Precio
                                            Rectangle()
                                                .frame(width: 55, height: 30)
                                                .foregroundStyle(.cyan)
                                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                                .overlay {
                                                    Text(producto.precio)
                                                        .foregroundColor(.white)
                                                        .bold()
                                                        .font(.system(size: 11))
                                                }
                                                .padding(.top, 150)
                                                .padding(.leading, device == .phone ? -170 : -165)
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
                                            HStack {
                                                Image("Critica")
                                                    .resizable()
                                                    .frame(width: device == .phone ? 35 : 45, height: device == .phone ? 35 : 45)
                                                Text(producto.porcentajeCritica)
                                                    .font(.system(size: device == .phone ? 13 : 17))
                                                    .foregroundStyle(.green)
                                                    .bold()
                                            }
                                            .padding(.trailing, device == .phone ? 10 : 30)
                                            
                                            Image("Opinion")
                                                .resizable()
                                                .frame(width: device == .phone ? 30 : 40, height: device == .phone ? 30 : 40)
                                            Text(producto.porcentajeOpinion)
                                                .font(.system(size: device == .phone ? 13 : 17))
                                                .foregroundStyle(.orange)
                                                .bold()
                                        }
                                        .padding(.leading, device == .phone ? 20 : 15)
                                        .padding(.top, 140)
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
                                        BotonView(colorBoton: $buttonColor)
                                    }
                            }
                            .padding(.top, 25).offset(y: device == .phone ? 178 : 115)
                    }
                    HStack(alignment: .center) {
                        
                    }
                }
                
            }.edgesIgnoringSafeArea(.all)
            .navigationTitle("Productos Eco")
        }
}

struct ProductosEcoView_Previews: PreviewProvider { 
    static var previews: some View {
        ProductosEcoView()
    }
}

struct BotonView: View {
    @Binding var colorBoton: Color
    var device = UIDevice.current.userInterfaceIdiom
    var body: some View {
        HStack{
            Button(action: {
                // Acción al presionar el botón
                colorBoton = .indigo // Cambia el color del botón a rojo
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation {
                        colorBoton = .green 
                        
                    }
                }
            }) {
                HStack{
                    Text("Info")
                        .padding()
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                        .bold()
                    HStack{
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .frame(width: device == .phone ? 25 : 30, height: device == .phone ? 25 : 30)
                            .foregroundStyle(.white)
                        
                    }.padding(.trailing, device == .phone ? 10 : 20)
                }
                .background(colorBoton)
                .cornerRadius(10)
                .shadow(radius: 3)
            }
        }.padding(.top, 140)
            .padding(.leading, device == .phone ? 295 : 400)
    }
}

struct DatosProductos: Identifiable {
    var id = UUID()
    var etiquetas: [EtiquetaView]
    var precio: String
    var imagen: String
    var imagenAncho: CGFloat
    var imagenAlto: CGFloat
    var presentacion: String
    var porcentajeCritica: String
    var porcentajeOpinion: String
    var descripcion: String
    
    struct EtiquetaView {
        var id = UUID()
        var nombre: String
        var color: Color
        var width: CGFloat
        var height: CGFloat
    }
}

let productos: [DatosProductos] = [
    .init(
        etiquetas: [
            .init(nombre: "#Natural", color: .pink, width: 80, height: 30),
            .init(nombre: "#Refrescante", color: .blue, width: 90, height: 30),
            .init(nombre: "#Organico", color: .orange, width: 90, height: 30)
        ],
        precio: "$86.99",
        imagen: "JugoPomita",
        imagenAncho: 130,
        imagenAlto: 190,
        presentacion: "Jugo Pomita (946 ml)",
        porcentajeCritica: "65%",
        porcentajeOpinion: "95%",
        descripcion: "Preparado con manzanas Golden Delicious y criollas, un jugo 100% orgánico."
    ),
    .init(
        etiquetas: [
            .init(nombre: "#Saludable", color: .pink, width: 80, height: 30),
            .init(nombre: "#Dieta", color: .blue, width: 70, height: 30),
            .init(nombre: "#Orgánico", color: .orange, width: 90, height: 30)
        ],
        precio: "$57.56",
        imagen: "Ensaladaeva",
        imagenAncho: 130,
        imagenAlto: 130,
        presentacion: "Ensalada Eva (250 gr)",
        porcentajeCritica: "80%",
        porcentajeOpinion: "70%",
        descripcion: "Clásica ensalada a base de lechugas romaine, crutones y su receta original de aderezo."
    ),
    .init(
        etiquetas: [
            .init(nombre: "#Orgánico", color: .pink, width: 80, height: 30),
            .init(nombre: "#Agrícola", color: .blue, width: 70, height: 30),
            .init(nombre: "#NoColorantes", color: .orange, width: 90, height: 30)
        ],
        precio: "$104.44",
        imagen: "AzucarAires",
        imagenAncho: 200,
        imagenAlto: 200,
        presentacion: "Azúcar Aires de Campo (1 kg)",
        porcentajeCritica: "70%",
        porcentajeOpinion: "80%",
        descripcion: "Cultivado con métodos agrícolas sustentables, apoyando a las comunidades de la región."
    ),
    .init(
        etiquetas: [
            .init(nombre: "#Chiapas", color: .pink, width: 80, height: 30),
            .init(nombre: "#Orgánico", color: .blue, width: 70, height: 30),
            .init(nombre: "#Delicioso", color: .orange, width: 90, height: 30)
        ],
        precio: "$49.16",
        imagen: "CafeAltura",
        imagenAncho: 130,
        imagenAlto: 130,
        presentacion: "Café Altura (500 gr)",
        porcentajeCritica: "90%",
        porcentajeOpinion: "90%",
        descripcion: "Una mezcla de granos de diferentes regiones, seleccionados con calidad de exportación Europea."
    )
]
