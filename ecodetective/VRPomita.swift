import SwiftUI
struct VRPomita: View{
    @State private var buttonColor = Color.teal
    @State private var isNavigationActive = false
    @State private var offset: CGFloat = 0
    @State private var buttonColor3 = Color.green
    @State private var isLiked2 = false
    @State private var isLiked = false
    let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect() 
    var body: some View{
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.init(uiColor: UIColor(red: 0.18, green: 0.24, blue: 0.27, alpha: 1.00)), .init(uiColor: UIColor(red: 0.49, green: 0.76, blue: 0.52, alpha: 1.00)), .init(uiColor: UIColor(red: 0.25, green: 0.47, blue: 0.34, alpha: 1.00))], startPoint:
                        .bottomLeading, endPoint: .topTrailing)
                ScrollView{
                    Rectangle()
                        .frame(width: 600, height: 100)
                        .foregroundStyle(.clear)
                    HStack{
                        
                        HStack{
                            Rectangle()
                                .frame(width: 150, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .overlay{
                                    Image("JugoPomita") 
                                        .resizable()
                                        .frame(width: 130, height: 200)
                                }
                            
                        }.padding(.trailing, 50)
                        
                        Rectangle() 
                            .fill(Color.white)          
                            .frame(width: 390, height: 150) 
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay{
                                ScrollView(.horizontal, showsIndicators: false) {
                                    //ETIQUETA 1
                                    HStack(spacing: 20) {
                                        Rectangle()
                                            .frame(width: 560, height: 50)
                                            .foregroundStyle(.clear)
                                            .overlay{
                                                HStack{
                                                    Image("SagarpaSticker")
                                                        .resizable()
                                                        .frame(width: 110, height: 110)
                                                }.padding(.trailing, 480)
                                                    .padding(.top, 10)
                                                Text("Orgánico SAGARPA México")
                                                    .bold()
                                                    .foregroundStyle(.gray) 
                                                    .font(.system(size: 15))
                                                    .padding(.bottom, 60)
                                                    .padding(.trailing, 170)
                                                HStack{
                                                    Rectangle()
                                                        .frame(width: 280, height: 300)
                                                        .foregroundStyle(.clear)
                                                        .overlay{
                                                            Text("Es una etiqueta de colores verde, azul y amarillo que brinda la certeza de ser un producto de calidad, sanidad y seguridad alimentaria.")
                                                                .foregroundStyle(.gray)
                                                                .font(.system(size: 12))
                                                        }
                                                }.padding(.trailing, 125)
                                                    .padding(.top, 25)
                                                HStack{
                                                    Image(systemName: "sparkles.square.filled.on.square")
                                                        .resizable()
                                                        .frame(width: 15, height: 15)
                                                        .foregroundStyle(.linearGradient(colors: [.green, .blue], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                                                        .padding(.bottom, 140)
                                                    Text("Etiquetas")
                                                        .bold()
                                                        .foregroundStyle(.gray)
                                                        .font(.system(size: 13))
                                                        .padding(.bottom, 140)
                                                    
                                                }.padding(.leading, 70)
                                                    .padding(.top, 40)
                                                
                                            }
                                        //ETIQUETA 2
                                        HStack(spacing: 20) {
                                            Rectangle()
                                                .frame(width: 560, height: 50)
                                                .foregroundStyle(.clear)
                                                .overlay{
                                                    HStack{
                                                        Image("CertimexSticker")
                                                            .resizable()
                                                            .frame(width: 90, height: 90)
                                                    }.padding(.trailing, 830)
                                                        .padding(.top, 30)
                                                    
                                                    Text("Certificadora CERTIMEX ")
                                                        .bold()
                                                        .foregroundStyle(.gray) 
                                                        .font(.system(size: 15))
                                                        .padding(.bottom, 60)
                                                        .padding(.trailing, 540)
                                                    HStack{
                                                        Rectangle()
                                                            .frame(width: 260, height: 250)
                                                            .foregroundStyle(.clear)
                                                            .overlay{
                                                                Text("Certificadora líder del país, garantiza la calidad y sostenibilidad de los procesos y productos evaluados.")
                                                                    .foregroundStyle(.gray)
                                                                    .font(.system(size: 12))
                                                            }
                                                    }.padding(.trailing, 475)
                                                        .padding(.top, 25)
                                                    HStack{
                                                        Image(systemName: "sparkles.square.filled.on.square")
                                                            .resizable()
                                                            .frame(width: 15, height: 15)
                                                            .foregroundStyle(.linearGradient(colors: [.green, .blue], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                                                            .padding(.bottom, 140)
                                                        Text("Etiquetas")
                                                            .bold()
                                                            .foregroundStyle(.gray)
                                                            .font(.system(size: 13))
                                                            .padding(.bottom, 140)
                                                        
                                                    }.padding(.trailing, 300)
                                                        .padding(.top, 40)
                                                }
                                        }
                                        //ETIQUETA 3
                                        HStack(spacing: 20) {
                                            Rectangle()
                                                .frame(width: 560, height: 50)
                                                .foregroundStyle(.clear)
                                                .overlay{
                                                    HStack{
                                                        Rectangle()
                                                            .frame(width: 260, height: 250)
                                                            .foregroundStyle(.clear)
                                                            .overlay{
                                                                HStack{
                                                                    Text("¡Verifica tus etiquetas!")
                                                                        .bold()
                                                                        .foregroundStyle(.gray)
                                                                }.padding(.bottom, 110)
                                                                    .padding(.trailing, 60)
                                                                HStack{
                                                                    Rectangle()
                                                                        .frame(width: 380, height: 150)
                                                                        .foregroundStyle(.clear)
                                                                        .overlay{
                                                                            Text("Las etiquetas son de gran utilidad para garantizar al consumidor un exigente nivel de calidad, el origen y la autenticidad del producto.")
                                                                                .foregroundStyle(.gray)
                                                                                .font(.system(size: 12))
                                                                                .bold()
                                                                            Image(systemName: "sparkles.square.filled.on.square")
                                                                                .resizable()
                                                                                .frame(width: 45, height: 45)
                                                                                .foregroundStyle(.linearGradient(colors: [.green, .blue], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                                                                                .padding(.top, 100)
                                                                            
                                                                        }
                                                                    
                                                                }.padding(.bottom, 28)
                                                                    .padding(.trailing, 70)
                                                                
                                                            }
                                                    }.padding(.trailing, 850)
                                                        .padding(.top, 25)
                                                }
                                        }
                                        //FIN DE ETIQUETAS
                                        HStack{
                                            Rectangle()
                                        }
                                        
                                    }
                                    .padding()
                                    .offset(x: offset)
                                }
                            }
                            .onReceive(timer) { _ in
                                withAnimation(.easeInOut(duration: 1)) {
                                    self.offset -= 400 
                                    if self.offset < -CGFloat(2 * 520) {
                                        self.offset = 0 
                                    }
                                }
                            }
                    }.padding(.top, 40)
                        .padding(.leading, 40)
                    
                    //COMPARACIÓN DE TIENDAS
                    HStack{
                        //BENEFICIOS Y CONTRAS
                        HStack{
                            Rectangle()
                                .frame(width: 230, height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .foregroundStyle(Color(uiColor: UIColor(red: 0.01, green: 0.52, blue: 0.33, alpha: 1.00)))
                                .overlay{
                                    Text("Beneficios")
                                        .foregroundStyle(.white)
                                        .bold()
                                        .padding(.bottom, 330)
                                    HStack{
                                        Rectangle()
                                            .frame(width: 200, height: 80)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .shadow(radius: 5)
                                            .overlay{
                                                Text("Alto en vitamina C")
                                                    .foregroundStyle(.gray)
                                                    .bold()
                                                    .font(.system(size: 12))
                                            }
                                    }.padding(.bottom, 170)
                                    HStack{
                                        Rectangle()
                                            .frame(width: 200, height: 80)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .shadow(radius: 5)
                                            .overlay{
                                                Text("Ayuda a la Digestión")
                                                    .foregroundStyle(.gray)
                                                    .bold()
                                                    .font(.system(size: 12))
                                            }
                                    }.padding(.top, 30)
                                    HStack{
                                        Rectangle()
                                            .frame(width: 200, height: 80)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .shadow(radius: 5)
                                            .overlay{
                                                Text("Purifica tu sangre")
                                                    .foregroundStyle(.gray)
                                                    .bold()
                                                    .font(.system(size: 12))
                                            }
                                    }.padding(.top, 230)
                                }
                            
                        }.padding(.leading, 45)
                        Rectangle()
                            .frame(width: 390, height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay{
                                Text("Precio en Tiendas")
                                    .foregroundStyle(.gray)
                                    .bold()
                                    .padding(.bottom, 320)
                                Image(systemName: "tag.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(.bottom, 320)
                                    .padding(.trailing, 210)
                                    .foregroundStyle(.linearGradient(colors: [.green, .blue], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                                
                                HStack{
                                    Rectangle()
                                        .frame(width: 350, height: 90)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        .shadow(radius: 5)
                                        .overlay{
                                            Image("ChedrauiSticker")
                                                .resizable()
                                                .frame(width: 70, height: 70)
                                                .padding(.trailing, 250)
                                            Text("Tienda Chedraui")
                                                .foregroundStyle(.gray)
                                                .bold()
                                                .font(.system(size: 15))
                                                .padding(.bottom, 50)
                                                .padding(.trailing, 30)
                                            Text("Precio regular en tienda")
                                                .foregroundStyle(.gray)
                                                .bold()
                                                .font(.system(size: 12))
                                            HStack{
                                                Rectangle()
                                                    .foregroundStyle(.green)
                                                    .frame(width: 90, height: 30)
                                                    .clipShape(RoundedRectangle(cornerRadius: 9))
                                                    .overlay{
                                                        Text("Mejor Precio")
                                                            .bold()
                                                            .font(.system(size: 12))
                                                    }
                                            }.padding(.top, 50)
                                            HStack{
                                                Rectangle()
                                                    .frame(width: 60, height: 35)
                                                    .foregroundStyle(.teal)
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))   
                                                    .overlay{
                                                        Text("$84.00")
                                                            .bold()
                                                            .font(.system(size: 15))
                                                    }
                                            }.padding(.leading, 250)
                                            
                                            
                                        }
                                }.padding(.bottom, 150)
                                HStack{
                                    Rectangle()
                                        .frame(width: 350, height: 90)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        .shadow(radius: 5)
                                        .overlay{
                                            Image("NaturistaSticker")
                                                .resizable()
                                                .frame(width: 130, height: 70)
                                                .padding(.trailing, 250)
                                            Text("Tienda Súper Naturista")
                                                .foregroundStyle(.gray)
                                                .bold()
                                                .font(.system(size: 15))
                                                .padding(.bottom, 50)
                                                .padding(.leading, 30)
                                            Text("Precio regular en tienda")
                                                .foregroundStyle(.gray)
                                                .bold()
                                                .font(.system(size: 12))
                                                .padding(.leading, 5)
                                            HStack{
                                                Rectangle()
                                                    .frame(width: 60, height: 35)
                                                    .foregroundStyle(.teal)
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))   
                                                    .overlay{
                                                        Text("$73.00")
                                                            .bold()
                                                            .font(.system(size: 15))
                                                    }
                                            }.padding(.leading, 250)
                                            Text("+$100 de envío")
                                                .foregroundStyle(.pink)
                                                .bold()
                                                .font(.system(size: 12))
                                                .padding(.top, 50)
                                                .padding(.leading, 250)
                                            
                                            
                                        }
                                }.padding(.top, 70)
                                HStack{
                                    Rectangle()
                                        .frame(width: 350, height: 90)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        .shadow(radius: 5)
                                        .overlay{
                                            Image("XpressSticker")
                                                .resizable()
                                                .frame(width: 90, height: 70)
                                                .padding(.trailing, 250)
                                            Text("Tienda Recibe Xpress")
                                                .foregroundStyle(.gray)
                                                .bold()
                                                .font(.system(size: 15))
                                                .padding(.bottom, 50)
                                                .padding(.leading, 20)
                                            Text("Precio regular en tienda")
                                                .foregroundStyle(.gray)
                                                .bold()
                                                .font(.system(size: 12))
                                                .padding(.leading, 5)
                                            HStack{
                                                Rectangle()
                                                    .foregroundStyle(.red)
                                                    .frame(width: 90, height: 30)
                                                    .clipShape(RoundedRectangle(cornerRadius: 9))
                                                    .overlay{
                                                        Text("Mayor Precio")
                                                            .bold()
                                                            .font(.system(size: 12))
                                                    }
                                            }.padding(.top, 50)
                                            HStack{
                                                Rectangle()
                                                    .frame(width: 60, height: 35)
                                                    .foregroundStyle(.teal)
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))   
                                                    .overlay{
                                                        Text("$95.00")
                                                            .bold()
                                                            .font(.system(size: 15))
                                                    }
                                            }.padding(.leading, 250)
                                            Text("+$99 de envío")
                                                .foregroundStyle(.pink)
                                                .bold()
                                                .font(.system(size: 12))
                                                .padding(.top, 50)
                                                .padding(.leading, 250)
                                            
                                            
                                        }
                                }.padding(.top, 290)
                            }
                    }.padding(.trailing, 50)
                        .padding(.top, 10)
                    HStack{
                        Rectangle()
                            .frame(width: 610, height: 210)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay{
                                Text("Ubicación")
                                    .foregroundStyle(.gray)
                                    .bold()
                                    .font(.system(size: 24))
                                    .padding(.bottom, 160)
                                Image("UbiJugoPomita")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .padding(.top, 50)
                                HStack{
                                    Rectangle()
                                        .frame(width: 150, height: 100)
                                        .foregroundStyle(.clear)
                                        .overlay{
                                            Text("Chihuahua, Sierra Tarahumara")
                                                .foregroundStyle(.gray)
                                                .bold()
                                                .font(.system(size: 12))
                                        }
                                }.padding(.leading, 230)
                                    .padding(.bottom, 100)
                                
                                Image("FlechaNegra")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .padding(.leading, 180)
                                
                            }
                    }.padding(.top, 10)
                    HStack{
                        Text("Reseñas")
                            .bold()
                            .font(.system(size: 35))
                    }.padding(.top, 50)
                        .padding(.trailing, 450)
                    HStack{
                        VStack{
                            //PRIMERA RESEÑA
                            VStack{
                                Rectangle()
                                    .frame(width: 590, height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .shadow(radius: 3)
                                    .overlay{
                                        HStack{
                                            Text("Me gusta su sabor de manzana")
                                                .bold()
                                                .foregroundStyle(.gray)
                                                .font(.system(size: 22))
                                        }.padding(.leading, 139)
                                            .padding(.bottom, 100)
                                        
                                        Image("UserGato")
                                            .resizable()
                                            .frame(width: 120, height: 120)
                                            .padding(.trailing, 370)
                                            .padding(.top, 10)
                                        Text("@cat.lover.3219")
                                            .foregroundStyle(.gray)
                                            .bold()
                                            .padding(.bottom, 140)
                                            .padding(.trailing, 370)
                                        
                                        HStack{
                                            Text("4.0")
                                                .foregroundStyle(.gray)
                                                .bold()
                                                .padding(.trailing, 20)
                                                .font(.system(size: 22))
                                        }.padding(.top, 145)
                                            .padding(.trailing, 150)
                                        HStack{
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundStyle(.yellow)
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundStyle(.yellow)
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundStyle(.yellow)
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundStyle(.yellow)
                                            Image(systemName: "star")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundStyle(.yellow)
                                            
                                        }.padding(.leading, 65)
                                            .padding(.top, 140)
                                        HStack{
                                            Rectangle()
                                                .frame(width: 320, height: 150)
                                                .foregroundStyle(.clear)
                                                .overlay{
                                                    Text("Su sabor agridulce es delicioso y no deja de ser natural, no tiene endulzantes ni conservadores.")
                                                        .foregroundStyle(.gray)
                                                }
                                        }.padding(.top, 20)
                                            .padding(.leading, 130)
                                        HStack{
                                            Text("¿Es útil?")
                                                .bold()
                                                .foregroundStyle(.gray)
                                            Button(action: {
                                                withAnimation {
                                                    self.isLiked.toggle()
                                                }
                                            }) {
                                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                                    .foregroundColor(isLiked ? .red : .black)
                                                    .font(.system(size: 30))
                                                    .scaleEffect(isLiked ? 1.5 : 1)
                                            }.padding(.trailing, 20)
                                        }.padding(.top, 140)
                                            .padding(.leading, 440)
                                    }
                                VStack{
                                    //SEGUNDA RESEÑA
                                    Rectangle()
                                        .frame(width: 590, height: 200)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .shadow(radius: 3)
                                        .overlay{
                                            HStack{
                                                Text("Excelente producto")
                                                    .bold()
                                                    .foregroundStyle(.gray)
                                                    .font(.system(size: 22))
                                            }.padding(.leading, 15)
                                                .padding(.bottom, 100)
                                            
                                            Image("UserGirl")
                                                .resizable()
                                                .frame(width: 120, height: 120)
                                                .padding(.trailing, 370)
                                                .padding(.top, 10)
                                            Text("@sweet.red.04")
                                                .foregroundStyle(.gray)
                                                .bold()
                                                .padding(.bottom, 140)
                                                .padding(.trailing, 370)
                                            
                                            HStack{
                                                Text("5.0")
                                                    .foregroundStyle(.gray)
                                                    .bold()
                                                    .padding(.trailing, 20)
                                                    .font(.system(size: 22))
                                            }.padding(.top, 145)
                                                .padding(.trailing, 150)
                                            HStack{
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 30, height: 30)
                                                    .foregroundStyle(.yellow)
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 30, height: 30)
                                                    .foregroundStyle(.yellow)
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 30, height: 30)
                                                    .foregroundStyle(.yellow)
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 30, height: 30)
                                                    .foregroundStyle(.yellow)
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 30, height: 30)
                                                    .foregroundStyle(.yellow)
                                                
                                            }.padding(.leading, 65)
                                                .padding(.top, 140)
                                            HStack{
                                                Rectangle()
                                                    .frame(width: 320, height: 150)
                                                    .foregroundStyle(.clear)
                                                    .overlay{
                                                        Text("Me encanta que es saludable, orgánico, fresco y lo suelo llevar a mi trabajo para mi lunch, es rico.")
                                                            .foregroundStyle(.gray)
                                                    }.padding(.trailing, 20)
                                            }.padding(.top, 20)
                                                .padding(.leading, 130)
                                            HStack{
                                                Text("¿Es útil?")
                                                    .bold()
                                                    .foregroundStyle(.gray)
                                                Button(action: {
                                                    withAnimation {
                                                        self.isLiked2.toggle()
                                                    }
                                                }) {
                                                    Image(systemName: isLiked2 ? "heart.fill" : "heart")
                                                        .foregroundColor(isLiked2 ? .red : .black)
                                                        .font(.system(size: 30))
                                                        .scaleEffect(isLiked2 ? 1.5 : 1)
                                                }.padding(.trailing, 20)
                                            }.padding(.top, 140)
                                                .padding(.leading, 440)
                                        }
                                    
                                }.padding(.top, 50)
                                
                            }
                        }
                    }
                    
                }
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .navigationTitle("Jugo de Manzana Pomita")
        }
    }
}

struct VRPomita_Previews: PreviewProvider { 
    static var previews: some View {
        VRPomita()
    }
}
