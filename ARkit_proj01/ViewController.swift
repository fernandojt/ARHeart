//
//  ViewController.swift
//  ARkit_proj01
//
//  Created by Fernando Jt on 14/8/18.
//  Copyright © 2018 Fernando Jumbo Tandazo. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    //añadir arkit scene a la clase
    @IBOutlet weak var sceneView: ARSCNView!
    
    //añadimos la configuracion
    let configuration = ARWorldTrackingConfiguration()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //añadimos la configuracion al viewDidLoad
        self.sceneView.session.run(configuration)
        
        //mostrar referencias de ayuda  para despues colocar los objetos
        self.sceneView.debugOptions = [SCNDebugOptions.showFeaturePoints,SCNDebugOptions.showWorldOrigin]
        
        //habilitamos la luz por defecto
        self.sceneView.autoenablesDefaultLighting = true
        
    }
    
    //boton añadir
    @IBAction func añadir(_ sender: UIButton) {
        
        /*
        //crear nodo e instanciar
        let nodo = SCNNode()
        
        /*añadir una forma geométrica al nodo y asignarle medidas
        //0.1 = 1cm
        // 1 = 1 metro
        chamferRadius = esquinas redondeadas
        */
        
        //nodo.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
        //nodo.geometry = SCNPyramid(width: 0.3, height: 0.3, length: 0.3)
        //nodo.geometry = SCNCapsule(capRadius: 0.1, height: 0.3)
        //nodo.geometry = SCNTorus(ringRadius: 0.2, pipeRadius: 0.1)
        
        /*
        //vamos a crear la forma de la letra F en 3D
        let path = UIBezierPath()
        //donde queremos que empiece el trazado
        path.move(to: CGPoint(x: 0, y: 0))
        //construir lineas
        path.addLine(to: CGPoint(x: -0.2, y: 0))
        path.addLine(to: CGPoint(x: -0.2, y: -0.5))
        path.addLine(to: CGPoint(x: 0, y: -0.3 ))
        //path.addLine(to: CGPoint(x: 0, y: -0.4 ))
        //path.addLine(to: CGPoint(x: -0.1, y: -0.4 ))
        path.addLine(to: CGPoint(x: -0.1, y: -0.3 ))
        path.addLine(to: CGPoint(x: 0, y: -0.3 ))
        path.addLine(to: CGPoint(x: 0, y: -0.2 ))
        path.addLine(to: CGPoint(x: -0.1, y: -0.2 ))
        path.addLine(to: CGPoint(x: -0.1, y: -0.1 ))
        path.addLine(to: CGPoint(x: 0, y: -0.1 ))
        */
        //vamos a crear la forma de la letra E en 3D
        let path = UIBezierPath()
        //donde queremos que empiece el trazado
        path.move(to: CGPoint(x: 0, y: 0))
        //construir lineas
        path.addLine(to: CGPoint(x: -0.2, y: 0))
        path.addLine(to: CGPoint(x: -0.2, y: -0.5))
        path.addLine(to: CGPoint(x: 0, y: -0.5 ))
        path.addLine(to: CGPoint(x: 0, y: -0.4 ))
        path.addLine(to: CGPoint(x: -0.1, y: -0.4 ))
        path.addLine(to: CGPoint(x: -0.1, y: -0.3 ))
        path.addLine(to: CGPoint(x: 0, y: -0.3 ))
        path.addLine(to: CGPoint(x: 0, y: -0.2 ))
        path.addLine(to: CGPoint(x: -0.1, y: -0.2 ))
        path.addLine(to: CGPoint(x: -0.1, y: -0.1 ))
        path.addLine(to: CGPoint(x: 0, y: -0.1 ))
        
        //agregamos el formato para agregar la forma
        let shape = SCNShape(path: path, extrusionDepth: 0.1)
        //le asignamos al nodo la forma que creamos
        nodo.geometry = shape
        
        
        /*dar un color a la figura geométrica
        difusse = color general que le queremos dar a la figura */
        nodo.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        
        //añadir luz al objeto
        nodo.geometry?.firstMaterial?.specular.contents = UIColor.white
        
        //dar una posicion en el espacio a la figura
        nodo.position = SCNVector3(0,0,-0.8)
        
        //añadir la figura a nuestra escena
        self.sceneView.scene.rootNode.addChildNode(nodo)
 */
        
        //añadir pokemon
        let objetoScene = SCNScene(named: "art.scnassets/Heart.scn")
        //convertir en nodo para poder mostrarlo a travez de la camara
        if let objetoNodo = objetoScene?.rootNode.childNode(withName: "Heart", recursively: false){
            //darle una posicion
            objetoNodo.position = SCNVector3(0, 0, -0.4)
            //añadir nodo a escena
            self.sceneView.scene.rootNode.addChildNode(objetoNodo)
        }else{
            print("error")
        }
        
 
    }
    
    //boton resetear
    @IBAction func resetear(_ sender: UIButton) {
        //llamamos a la funcion para reiniciar la sesion
        self.reiniciarSesion()
    }
    
    
    //funcion para reiniciar la sesion y poder añadir mas objetos en diferentes lugares
    func reiniciarSesion(){
        //pausamos la sesion actual
        self.sceneView.session.pause()
        
        //recorremos todos los nodos que se encuentran por debajo del root node  y los borramos
        self.sceneView.scene.rootNode.enumerateChildNodes { (nodo, _) in
            nodo.removeFromParentNode()
        }
        
        //reanudamos la sesion
        //resetTracking = reseteamos la posicion de nuestro telefono
        //removeExistingAnchors = remover todos los puntos existentes
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

