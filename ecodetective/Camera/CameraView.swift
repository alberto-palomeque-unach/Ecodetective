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
                CameraView(recognizedObjects: $recognizedObjects)
//                List(recognizedObjects, id: \.self) { obj in
//                    Text("Objeto: \(obj)")
//                }
                ForEach(recognizedObjects, id: \.self) { obj in
                    Text(obj)
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

//                    DispatchQueue.main.async {
//                        self.parent.recognizedObjects = recognizedObjects.isEmpty ? [] : Array(recognizedObjects)
//                    }
                    DispatchQueue.main.async {
                        self.parent.recognizedObjects = Array(recognizedObjects)
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
