import SwiftUI

struct ConsejosView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(colors: [.init(uiColor: UIColor(red: 0.18, green: 0.24, blue: 0.27, alpha: 1.00)), .init(uiColor: UIColor(red: 0.49, green: 0.76, blue: 0.52, alpha: 1.00)), .init(uiColor: UIColor(red: 0.25, green: 0.47, blue: 0.34, alpha: 1.00))], startPoint:
                        .bottomLeading, endPoint: .topTrailing)
                ScrollView{
                    HStack{
                        Rectangle()
                            .frame(width: 590, height: 150)// cambia
                            .shadow(radius: 3)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay{
                                Text("¡Usa Transporte!") // cambia
                                    .foregroundColor(.pink)
                                    .bold()
                                    .padding(.bottom, 90)
                                    .padding(.trailing, 380)
                                HStack{
                                    Rectangle()
                                        .frame(width: 400, height: 100)
                                        .foregroundStyle(Color.clear)
                                        .overlay{
                                            Text("El auto promedio produce 180g CO2 por km. El autobús transporta 50 persona y por cada persona consumen 1,64 kg.")
                                                .foregroundColor(.gray)
                                                .padding(.trailing, 5)
                                                .padding(.top, 20)
                                        }
                                }.padding(.trailing, 140)
                                Image(systemName: "car.circle.fill")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                                    .foregroundColor(.pink)
                                    .padding(.leading, 440)
                            }
                    }.padding(.top, 150)
                    
                    HStack{
                        Rectangle()
                            .frame(width: 590, height: 150)
                            .shadow(radius: 3)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay{
                                Text("¡Separa la basura!")
                                    .foregroundColor(.orange)
                                    .bold()
                                    .padding(.bottom, 90)
                                    .padding(.trailing, 380)
                                Rectangle()
                                    .frame(width: 450, height: 190)
                                    .foregroundColor(.clear)
                                    .overlay{
                                        Text("Es importante separar los residuos en distintos botes: orgánica, vidrio, cartón, plásticos y desechos tóxicos. Por tu salud, cuida tu entorno.")
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.trailing, 120)
                                    .padding(.top, 20)
                                Image(systemName: "trash.circle.fill")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.orange)
                                    .padding(.leading, 440)
                            }
                    }.padding(.top, 30)
                    HStack{
                        Rectangle()
                            .frame(width: 590, height: 170)
                            .shadow(radius: 3)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay{
                                Text("¡Planta árboles!")
                                    .foregroundColor(.brown)
                                    .bold()
                                    .padding(.trailing, 400)
                                    .padding(.bottom, 100)
                                Rectangle()
                                    .frame(width: 437, height: 100)
                                    .foregroundColor(.clear)
                                    .overlay{
                                        Text("Los árboles son esenciales para el mundo, producen oxígeno, reducen el dióxido de carbono, absorben gases contaminantes, regulan la temperatura, entre otros beneficios.")
                                            .foregroundColor(.gray)
                                    }.padding(.top, 40)
                                    .padding(.trailing, 110)
                                Image(systemName: "tree.circle.fill")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.brown)
                                    .padding(.leading, 440)
                            }
                    }.padding(.top, 30)
                    HStack{
                        Rectangle()
                            .frame(width: 590, height: 170)
                            .shadow(radius: 3)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay{
                                Text("¡Conecta con la naturaleza!")
                                    .foregroundColor(.teal)
                                    .bold()
                                    .padding(.bottom, 100)
                                    .padding(.trailing, 290)
                                Rectangle()
                                    .frame(width: 400, height: 100)
                                    .foregroundColor(.clear)
                                    .overlay{
                                        Text("Desconecta el cargador de tu celular cuando no lo estés utilizando Esta acción puede hacer una gran diferencia a la hora de ahorrar energía. También aumentarás su vida útil. ")
                                            .foregroundColor(.gray)
                                    }.padding(.top, 45)
                                    .padding(.trailing, 150)
                                Image(systemName: "bolt.circle.fill")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                                    .foregroundStyle(.teal)
                                    .padding(.leading, 450)
                            }
                    }.padding(.top, 30)
                    HStack{
                        Rectangle()
                            .frame(width: 590, height: 170)
                            .shadow(radius: 3)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay{
                               Text("¡Ahorra agua!")
                                    .foregroundColor(.blue)
                                    .bold()
                        .padding(.bottom, 90)
                                    .padding(.trailing, 420)
                                Rectangle()
                                    .frame(width: 440, height: 100)
                                    .foregroundStyle(Color.clear)
                                    .overlay{
                                        Text("Cerrar el grifo mientras te lavas los dientes, bañarte en 5 minutos, juntar el agua de la regadera mientras te bañas, son pequeñas acciones que ayudan a ahorrarla.")
                                            .foregroundColor(.gray)

                                    }.padding(.top, 50)
                                    .padding(.trailing, 160)
                                Image(systemName: "drop.circle.fill")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                                    .foregroundStyle(.blue)
                                    .padding(.leading, 450)
                                  }
             
                    }.padding(.top, 40)
                    Text("PRÓXIMAMENTE")
                        .bold()
                        .padding(.top, 50)
                        .font(.system(size: 45))
                    Image(systemName: "hand.raised.app")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .padding(.top, 2)
                }
            }.edgesIgnoringSafeArea(.all)
                .navigationTitle("Consejos")
        }
    }
}

struct VConsejos_Previews: PreviewProvider { // Cambia el nombre de la estructura a VConsejos_Previews
    static var previews: some View {
        ConsejosView()
    }
}
