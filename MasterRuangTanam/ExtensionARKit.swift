//
//  ExtensionARKit.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 04/11/21.
//

import Foundation
import ARKit
import RealityKit

extension simd_float4x4{
    var vector_position: SCNVector3{
        return SCNVector3(columns.3.x, columns.3.y, columns.3.z)
    }
    var simd_position: SIMD3<Float>{
        return SIMD3<Float>(columns.3.x, columns.3.y, columns.3.z)
    }
}

extension Float{
    func metersToInches() -> Float{
        return self * 39.3701
    }
    
    func pow2() -> Float{
        return self * self
    }
}

extension simd_float3x3{
    var cgPoints: CGPoint{
        return CGPoint(x: CGFloat(columns.2.x), y: CGFloat(columns.2.z))
    }
}

