import SwiftUI

struct ProductosEcoView: View {
    @State private var buttonColor = Color.green
    @State private var buttonColor2 = Color.green
    @State private var buttonColor3 = Color.green
    @State private var buttonColor4 = Color.green
    var body: some View{
        NavigationView{
            ZStack {
                LinearGradient(colors: [.init(uiColor: UIColor(red: 0.18, green: 0.24, blue: 0.27, alpha: 1.00)), .init(uiColor: UIColor(red: 0.49, green: 0.76, blue: 0.52, alpha: 1.00)), .init(uiColor: UIColor(red: 0.25, green: 0.47, blue: 0.34, alpha: 1.00))], startPoint:
                        .bottomLeading, endPoint: .topTrailing)
                ScrollView{
                    HStack{
                        Rectangle()
                            .cornerRadius(20)
                            .shadow(radius: 3)
                            .frame(width: 590, height: 350)
                            .overlay{
                                HStack{
                                    Text("Los productos más populares de esta semana son")
                                        .bold()
                                        .foregroundColor(.gray)
                                        .padding(.bottom, 300)
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
                                Image("Bebida Honest")
                                    .resizable()
                                    .frame(width: 50, height: 100)
                                    .padding(.bottom, 70)
                                Image("arándanos")
                                    .resizable()
                                    .frame(width: 70, height: 100)
                                    .padding(.trailing, 200)
                                Image("Crema Coco")
                                    .resizable()
                                    .frame(width: 100, height: 80)
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
                    }.offset(x: 0, y:115)
                    ForEach(productos) { producto in
                            HStack {
                                Rectangle()
                                    .frame(width: 590, height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .shadow(radius: 3)
                                    .overlay {
                                        HStack {
                                            ForEach(producto.etiquetas, id: \.id) { etiqueta in
                                                Rectangle()
                                                    .frame(width: etiqueta.width, height: etiqueta.height)
                                                    .foregroundStyle(etiqueta.color)
                                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                                    .overlay {
                                                        Text(etiqueta.nombre)
                                                            .foregroundColor(.white)
                                                            .bold()
                                                            .font(.system(size: 11))
                                                    }
                                                    .padding(.bottom, 90)
                                            }
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
                                                .padding(.bottom, 90)
                                                .padding(.leading, 30)
                                        }
                                        .padding(.leading, 180)
                                        
                                        Image(producto.imagen)
                                            .resizable()
                                            .frame(width: producto.imagenAncho, height: producto.imagenAlto)
                                            .padding(.trailing, 370)
                                            .padding(.top, 30)
                                        
                                        Text(producto.presentacion)
                                            .foregroundStyle(.gray)
                                            .bold()
                                            .font(.system(size: 17))
                                            .padding(.bottom, 150)
                                            .padding(.trailing, 370)
                                        
                                        HStack {
                                            HStack {
                                                Image("Crítica")
                                                    .resizable()
                                                    .frame(width: 45, height: 45)
                                                Text(producto.porcentajeCritica)
                                                    .font(.system(size: 17))
                                                    .foregroundStyle(.green)
                                                    .bold()
                                            }
                                            .padding(.trailing, 30)
                                            
                                            Image("Opinion")
                                                .resizable()
                                                .frame(width:40, height: 40)
                                            Text(producto.porcentajeOpinion)
                                                .font(.system(size:17))
                                                .foregroundStyle(.orange)
                                                .bold()
                                        }
                                        .padding(.leading, 15)
                                        .padding(.top, 140)
                                        HStack {
                                            Rectangle()
                                                .frame(width: 320, height: 150)
                                                .foregroundStyle(.clear)
                                                .overlay {
                                                    Text(producto.descripcion)
                                                        .foregroundStyle(.gray)
                                                }
                                        }
                                        .padding(.top, 20)
                                        .padding(.leading, 110)
                                        BotonView(colorBoton: $buttonColor)
                                    }
                            }
                            .padding(.top, 25).offset(y: 115)
                    }
                    HStack{
                        Text("Otras reseñas")
                            .bold()
                            .font(.system(size: 35))
                            .padding(.top, 50)
                            .padding(.trailing, 350)
                    }
                }
            }.edgesIgnoringSafeArea(.all)
                .navigationTitle("Productos Eco")
            
        }
    }
}

struct ProductosEcoView_Previews: PreviewProvider { 
    static var previews: some View {
        ProductosEcoView()
    }
}


struct BotonView: View {
    @Binding var colorBoton: Color
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
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.white)
                        
                    }.padding(.trailing, 20)
                }
                .background(colorBoton)
                .cornerRadius(10)
                .shadow(radius: 3)
            }
        }.padding(.top, 140)
            .padding(.leading, 400)
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
        imagen: "EnsaladaEva",
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
