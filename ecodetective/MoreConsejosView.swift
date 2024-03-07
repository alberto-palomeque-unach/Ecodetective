import SwiftUI

struct MoreConsejosView: View {
    var device = UIDevice.current.userInterfaceIdiom
    @State private var animationProximamente = false
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(colors: [.init(uiColor: UIColor(red: 0.18, green: 0.24, blue: 0.27, alpha: 1.00)), .init(uiColor: UIColor(red: 0.49, green: 0.76, blue: 0.52, alpha: 1.00)), .init(uiColor: UIColor(red: 0.25, green: 0.47, blue: 0.34, alpha: 1.00))], startPoint:
                        .bottomLeading, endPoint: .topTrailing)
                ScrollView{
                    HStack{
                        Rectangle()
                            .frame(width: device == .phone ? 410 : 590, height: 150)// cambia
                            .shadow(radius: 3)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay{
                                Text("¡Usa Transporte!") // cambia
                                    .foregroundColor(.pink)
                                    .bold()
                                    .padding(.bottom, device == .phone ? 100 : 90)
                                    .padding(.trailing, device == .phone ? 230 : 380)
                                HStack{
                                    Rectangle()
                                        .frame(width: device == .phone ? 290 : 400, height: device == .phone ? 200 : 100)
                                        .foregroundStyle(Color.clear)
                                        .overlay{
                                            Text("El auto promedio produce 180g CO2 por km. El autobús transporta 50 persona y por cada persona consumen 1,64 kg.")
                                                .foregroundColor(.gray)
                                                .padding(.trailing, 5)
                                                .padding(.top, 20)
                                                .font(.system(size: 17))
                                        }
                                }.padding(.trailing, device == .phone ? 100: 140)
                                Image(systemName: "car.circle.fill")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.pink)
                                    .padding(.leading, device == .phone ? 300 : 440)
                            }
                    }.padding(.top, 150)
                    
                    HStack{
                        Rectangle()
                            .frame(width: device == .phone ? 410 : 590, height: 150)
                            .shadow(radius: 3)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay{
                                Text("¡Separa la basura!")
                                    .foregroundColor(.orange)
                                    .bold()
                                    .padding(.bottom, device == .phone ? 100 : 90)
                                    .padding(.trailing, device == .phone ? 220 : 380)
                                Rectangle()
                                    .frame(width: device == .phone ? 295 : 400, height: device == .phone ? 200 : 100)
                                    .foregroundColor(.clear)
                                    .overlay{
                                        Text("Es importante separar los residuos en distintos botes: orgánica, vidrio, cartón, plásticos y desechos tóxicos. Por tu salud, cuida tu entorno.")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 17))
                                    }
                                    .padding(.trailing, device == .phone ? 90: 120)
                                    .padding(.top, 20)
                                Image(systemName: "trash.circle.fill")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.orange)
                                    .padding(.leading, device == .phone ? 300 : 440)
                            }
                    }.padding(.top, 20)
                    
                    HStack{
                        Rectangle()
                            .frame(width: device == .phone ? 410 : 590, height: device == .phone ? 150 : 150)
                            .shadow(radius: 3)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay{
                                Text("¡Planta árboles!")
                                    .foregroundColor(.brown)
                                    .bold()
                                    .padding(.bottom, device == .phone ? 110 : 90)
                                    .padding(.trailing, device == .phone ? 240 : 380)
                                Rectangle()
                                    .frame(width: device == .phone ? 290 : 437, height: device == .phone ? 450 : 100)
                                    .foregroundColor(.clear)
                                    .overlay{
                                        Text("Los árboles son esenciales para el mundo, producen oxígeno, reducen el dióxido de carbono, absorben gases contaminantes, regulan la temperatura, entre otros beneficios.")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 17))
                                    }.padding(.top, device == .phone ? 20 : 40)
                                    .padding(.trailing, device == .phone ? 99 : 110)
                                Image(systemName: "tree.circle.fill")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.brown)
                                    .padding(.leading, device == .phone ? 300 : 440)
                            }
                    }.padding(.top, 20)
                    
                    HStack{
                        Rectangle()
                            .frame(width: device == .phone ? 410 : 590, height: device == .phone ? 170 : 170)
                            .shadow(radius: 3)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay{
                                Text("¡Conecta con la naturaleza!")
                                    .foregroundColor(.teal)
                                    .bold()
                                    .padding(.bottom, device == .phone ? 109 : 90)
                                    .padding(.trailing, device == .phone ? 240 : 380)
                                Rectangle()
                                    .frame(width: device == .phone ? 280 : 400, height: 200)
                                    .foregroundColor(.clear)
                                    .overlay{
                                        Text("Desconecta el cargador de tu celular cuando no lo estés utilizando Esta acción puede hacer una gran diferencia a la hora de ahorrar energía.")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 17))
                                    }.padding(.top, 45)
                                    .padding(.trailing, device == .phone ? 110: 150)
                                Image(systemName: "bolt.circle.fill")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                                    .foregroundStyle(.teal)
                                    .padding(.leading, device == .phone ? 300 : 440)
                            }
                    }.padding(.top, 20)
                    
                    HStack{
                        Rectangle()
                            .frame(width: device == .phone ? 410 : 590, height: device == .phone ? 150 : 170)
                            .shadow(radius: 3)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay{
                               Text("¡Ahorra agua!")
                                    .foregroundColor(.blue)
                                    .bold()
                                    .padding(.bottom, device == .phone ? 115 : 90)
                                    .padding(.trailing, device == .phone ? 256 : 380)
                                Rectangle()
                                    .frame(width: device == .phone ? 280 : 440, height: device == .phone ? 500 : 100)
                                    .foregroundStyle(Color.clear)
                                    .overlay{
                                        Text("Cerrar el grifo mientras te lavas los dientes, bañarte en 5 minutos, juntar el agua de la regadera mientras te bañas, son pequeñas acciones que ayudan a ahorrarla.")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 17))
                                    }.padding(.top, device == .phone ? 20 : 50)
                                    .padding(.trailing, device == .phone ? 110 :160)
                                Image(systemName: "drop.circle.fill")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundStyle(.blue)
                                    .padding(.leading, device == .phone ? 300 : 440)
                                  }
             
                    }.padding(.top, 20)
                    VStack {
                        Text("PRÓXIMAMENTE")
                            .bold()
                            .padding(.top, 50)
                            .font(.system(size: 45))
                        Image(systemName: "hand.raised.app")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.top, 2)
                    }.foregroundStyle(animationProximamente ? .white : .white.opacity(0.3)).offset(y: -30).onAppear(){
                        withAnimation(.easeInOut(duration: 0.9).repeatForever()) {
                            animationProximamente.toggle()
                        }
                    }
                }
            }.edgesIgnoringSafeArea(.all)
                .navigationTitle("Consejos")
        }
    }
}

#Preview {
    MoreConsejosView()
}
