//
//  ObjectRecognitionView.swift
//  cameraApplication
//
//  Created by Alberto Palomeque on 27/02/24.
//

import SwiftUI
import AVFoundation
import CoreML
import Vision

struct CameraRecognitionView: View {
    @State private var isCameraActive: Bool = false
    @State private var recognizedObjects: [String] = []
    
    var body: some View {
        VStack {
            if isCameraActive {
                ZStack {
                CameraView(recognizedObjects: $recognizedObjects)
//                List(recognizedObjects, id: \.self) { obj in
//                    Text("Objeto: \(obj)")
//                }
                    VStack {
                        Spacer()
                        ForEach(recognizedObjects.sorted(), id: \.self) { obj in
                            if obj == "cafe_organico_irlanda_454g" {
                                Rectangle()
                                    .cornerRadius(20)
                                    .shadow(radius: 3)
                                    .frame(width: 590, height: 150)
                                    .overlay{
                                        HStack {
                                            Image("cafeoro")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 100)
                                                .offset(x: 20)
                                            Spacer()
                                            Text("Cafe 100% Organico de Chiapas. Finca irlanda en su presentación de 1/2 kg (454 gramos)")
                                                .font(.title2)
                                                .foregroundStyle(.gray)
                                            Button(action: {
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
                                                .background(.blue)
                                                .cornerRadius(10)
                                                .shadow(radius: 3)
                                            }
                                        }
                                    }
                                    .animation(.spring)
                            }
                            else if obj == "hojas_lechuga_orejona_organica_250g" {
                                Rectangle()
                                    .cornerRadius(20)
                                    .shadow(radius: 3)
                                    .frame(width: 590, height: 150)
                                    .overlay{
                                        HStack {
                                            Image("lechuga")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 100)
                                                .offset(x: 20)
                                            Spacer()
                                            Text("Mr Lucky Hojas de Lechuga Orejona Orgánica")
                                                .font(.title2)
                                                .foregroundStyle(.gray)
                                            Button(action: {
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
                                                .background(.blue)
                                                .cornerRadius(10)
                                                .shadow(radius: 3)
                                            }
                                        }
                                    }
                                    .animation(.spring)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            isCameraActive = true
        }
        .onDisappear {
            isCameraActive = false
            recognizedObjects = []
        }
    }
}

struct CameraView: UIViewControllerRepresentable {
    @Binding var recognizedObjects: [String]

        class Coordinator: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
            var parent: CameraView
            var allRecognizedObjects: [String] = []

            init(parent: CameraView) {
                self.parent = parent
            }

            func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
                guard let model = try? VNCoreMLModel(for: ArticlesDetector(configuration: MLModelConfiguration()).model) else {
                    fatalError("Error cargando el modelo CoreML")
                }

                let request = VNCoreMLRequest(model: model) { request, error in
                                guard let results = request.results as? [VNRecognizedObjectObservation], error == nil else {
                                    print("Error processing the request")
                                    return
                                }

                    let recognizedObjects = Set(results.map { observation in
                        let objectLabel = observation.labels.first?.identifier ?? ""
                        return objectLabel
                    })
                    
                    self.allRecognizedObjects.append(contentsOf: recognizedObjects)

//                    DispatchQueue.main.async {
//                        self.parent.recognizedObjects = recognizedObjects.isEmpty ? [] : Array(recognizedObjects)
//                    }
                    let uniqueObjects = Array(Set(self.allRecognizedObjects))
                    DispatchQueue.main.async {
                        //self.parent.recognizedObjects = Array(recognizedObjects)
                        self.parent.recognizedObjects = uniqueObjects
                    }
                }

                let handler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: .up)

                do {
                    try handler.perform([request])
                } catch {
                    print("Error processing request: \(error)")
                }
            }
        }

        func makeUIViewController(context: UIViewControllerRepresentableContext<CameraView>) -> UIViewController {
            let viewController = UIViewController()
            let captureSession = AVCaptureSession()

            guard let backCamera = AVCaptureDevice.default(for: .video) else {
                return viewController
            }

            do {
                let input = try AVCaptureDeviceInput(device: backCamera)
                captureSession.addInput(input)
            } catch {
                return viewController
            }

            let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.frame = viewController.view.layer.bounds
            previewLayer.videoGravity = .resizeAspectFill
            viewController.view.layer.addSublayer(previewLayer)

            let output = AVCaptureVideoDataOutput()
            output.setSampleBufferDelegate(context.coordinator, queue: DispatchQueue(label: "cameraQueue"))
            captureSession.addOutput(output)

            captureSession.startRunning()

            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<CameraView>) {
            // Update UI if needed
        }

        func makeCoordinator() -> Coordinator {
            return Coordinator(parent: self)
        }
}

#Preview {
    CameraRecognitionView()
}
