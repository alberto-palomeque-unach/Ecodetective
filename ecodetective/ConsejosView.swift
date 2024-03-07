import SwiftUI

struct ConsejosView: View {
//    @State private var isNavigationActive = false
//    @State private var isNavigationActive2 = false
//    @State private var isNavigationActive3 = false
    @State private var buttonColor = Color.teal
    @State private var buttonColor1 = Color.teal
    @State private var buttonColor2 = Color.teal
    @State private var isNavigationActiveSCR = false
    @State private var isActiveProductos = false
    @State private var offset: CGFloat = 0
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect() // Temporizador para desplazamiento automático
    var body: some View {
        ZStack{
            LinearGradient(colors: [.init(uiColor: UIColor(red: 0.18, green: 0.24, blue: 0.27, alpha: 1.00)), .init(uiColor: UIColor(red: 0.49, green: 0.76, blue: 0.52, alpha: 1.00)), .init(uiColor: UIColor(red: 0.25, green: 0.47, blue: 0.34, alpha: 1.00))], startPoint:
                    .bottomLeading, endPoint: .topTrailing)
            ScrollView{
                HStack{
                    Rectangle()
                        .frame(width: 600, height: 200)
                        .foregroundColor(.clear)
                        .overlay{
                            Text("Bienvenido a Ec    Detective")
                                .bold()
                                .font(.system(size: 60))
                            Image("Hoja Verde")
                                .resizable()
                                .frame(width: 90, height: 90)
                                .padding(.top, 80)
                                .padding(.trailing, 210)
                            Text("Ec")
                                .bold()
                                .font(.system(size: 60))
                                .foregroundColor(Color(uiColor: UIColor(red: 0.00, green: 0.56, blue: 0.22, alpha: 1.00)))
                                .padding(.top, 73)
                                .padding(.trailing, 324)
                            Image("lupa")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .padding(.leading, 460)
                                .padding(.top, 60)
                        }
                }
                
                HStack{
                    Rectangle() // Envuelve el ScrollView en un Rectangle
                        .fill(Color.white) // Color de fondo del Rectangle
                        .frame(width: 590, height: 220) // Altura del Rectangle
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 3)
                        .overlay {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                        ForEach(contenido) { unico in
                                            Rectangle()
                                                .frame(width: 560, height: 170)
                                                .foregroundStyle(.clear)
                                                .overlay{
                                                    HStack{
                                                        Image(systemName: "sparkles")
                                                            .resizable()
                                                            .frame(width: 30, height: 30)
                                                            .foregroundStyle(.linearGradient(colors: [.green, .blue], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                                                        Text("Consejos")
                                                            .foregroundStyle(.gray)
                                                            .bold()
                                                    }.padding(.leading, 400)
                                                        .padding(.bottom, 140)
                                                    Text(unico.titulo) // CAMBIA
                                                        .bold()
                                                        .padding(.bottom, 140)
                                                        .padding(.trailing, unico.derecha) // CAMBIA
                                                        .foregroundStyle(unico.colores) // CAMBIA
                                                    Text(unico.descripcion)
                                                        .padding(.trailing, 140) 
                                                        .foregroundStyle(.gray)
                                                    Image(systemName: unico.imagen)                     .resizable()
                                                        .frame(width: 100, height: 100)
                                                        .padding(.leading, 430)
                                                        .foregroundStyle(unico.colores) // CAMBIA
                                                }
                                        }                                  
                                }
                                .padding()
                                .offset(x: offset)
                            }
                        }.overlay {
                            HStack{
                                Button(action: {
                                    isNavigationActiveSCR.toggle()
                                    // Acción al presionar el botón
                                    self.buttonColor = .indigo // Cambia el color del botón a rojo
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        withAnimation {
                                            self.buttonColor = .teal // Vuelve el color del botón a azul después de un breve retraso
                                        }
                                    }
                                }) {
                                    Text("Conoce más")
                                        .padding()
                                        .foregroundColor(.white)
                                        .font(.system(size: 12))
                                        .bold()
                                        .background(buttonColor)
                                        .cornerRadius(10)
                                        .shadow(radius: 3)
                                }.sheet(isPresented: $isNavigationActiveSCR){
                                  ConsejosView()
                                }
                                
                            }.padding(.top, 160)
                            
                        }
                        .onReceive(timer) { _ in
                            withAnimation(.easeInOut(duration: 1)) {
                                self.offset -= 580 // Cambia la posición de desplazamiento automáticamente cada 2 segundos
                                if self.offset < -CGFloat(4 * 520) {
                                    self.offset = 0 // Reinicia el desplazamiento al principio cuando llega al final
                                }
                            }
                        }
                }.padding(.top, 10)

                HStack{
                    Rectangle()
                        .frame(width: 590, height: 300)
                        .cornerRadius(20)
                        .padding(.top, 80)
                        .shadow(radius: 3)
                        .overlay{
                            Text("Tu nivel de CO2 esta semana ha sido    ")
                                .foregroundColor(.gray)
                                .padding(.bottom, 130)
                                .bold()
                            Image("estadística")
                                .resizable()
                                .frame(width: 300, height: 300)
                                .padding(.top, 130)
                            HStack{
                                Image(systemName: "align.vertical.bottom.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(.linearGradient(colors: [.green, .blue], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                                Text("Datos")
                                    .foregroundColor(.gray)
                            }.padding(.leading, 450)
                                .bold()
                                .padding(.bottom, 130)
                            HStack{
                                NavigationLink { 
                                    ProductosEcoView()
                                } label: { 
                                    Button(action: {
                                        // Acción al presionar el botón
                                        self.buttonColor1 = .indigo // Cambia el color del botón a rojo
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                            withAnimation {
                                                self.buttonColor1 = .teal // Vuelve el color del botón a azul después de un breve retraso
                                            }
                                        }
                                    }) {
                                        Text("¿Por qué?")
                                            .padding()
                                            .foregroundColor(.white)
                                            .font(.system(size: 12))
                                            .bold()
                                            .background(buttonColor1)
                                            .cornerRadius(10)
                                            .shadow(radius: 3)
                                    }
                                }
                            }.padding(.top, 320)
                                .padding(.leading, 450)
                        }
                }.offset(x: 0, y:-30)
                HStack{
                    Rectangle()
                        .cornerRadius(20)
                        .shadow(radius: 3)
                        .frame(width: 590, height: 350)
                        .overlay{
                            HStack{
                                Image(systemName:"waterbottle.fill")
                                    .resizable()
                                    .frame(width: 18, height: 30)
                                    .foregroundStyle(.linearGradient(colors: [.green, .blue], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                                Text("Eco")
                                    .bold()
                                    .foregroundColor(.gray)
                            }.padding(.bottom, 250)
                                .padding(.leading, 450)
                            HStack{
                                Text("Los productos Eco de esta semana son")
                                    .bold()
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 300)
                                    .padding(.trailing, 100)
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
                            HStack{
                                Button(action: {
                                    // Acción al presionar el botón
                                    isActiveProductos.toggle()
                                    self.buttonColor2 = .indigo // Cambia el color del botón a rojo
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        withAnimation {
                                            self.buttonColor2 = .teal // Vuelve el color del botón a azul después de un breve retraso
                                        }
                                    }
                                }) {
                                    Text("¿Por qué?")
                                        .padding()
                                        .foregroundColor(.white)
                                        .font(.system(size: 12))
                                        .bold()
                                        .background(buttonColor2)
                                        .cornerRadius(10)
                                        .shadow(radius: 3)
                                }.sheet(isPresented: $isActiveProductos) {
                                    ProductosEcoView()
                                }
                            }.padding(.top, 290)
                                .padding(.leading, 450)                        
                        }
                }.offset(x: 0, y:15)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TextoImagen: Identifiable {
    let id = UUID()
    let titulo: String
    let descripcion: String
    let imagen: String
    let derecha: CGFloat
    let colores: Color
}

let contenido: [TextoImagen] = [
    .init(titulo: "¡Usa transporte público!", descripcion: "Es la clave para un aire más limpio y un clima más saludable Reduce las emisiones de gases de efecto invernadero, ¡ayudando a combatir el cambio climático!", imagen: "car.circle.fill", derecha: 330, colores: .pink),
    .init(titulo: "¡Separa la basura!", descripcion: "¡Separar la basura es un pequeño gesto con un gran impacto! Ayuda a reducir la cantidad de residuos enviados a los vertederos y promueve la reutilización y el reciclaje.", imagen: "trash.circle.fill", derecha: 390, colores: .orange),
    .init(titulo: "¡Planta árboles!", descripcion: "¡Plantar árboles es la solución verde para un planeta más saludable! Ayuda a combatir la deforestación, absorber el dióxido de carbono y promover la biodiversidad.", imagen: "tree.circle.fill", derecha: 410, colores: .brown),
    .init(titulo: "¡Ahorra agua!", descripcion: "¡Ahorrar agua es crucial para conservar nuestro recurso más preciado! Cada gota cuenta en la lucha contra la escasez de agua y la protección de ecosistemas vitales.", imagen: "drop.circle.fill", derecha: 430, colores: .blue)
]

