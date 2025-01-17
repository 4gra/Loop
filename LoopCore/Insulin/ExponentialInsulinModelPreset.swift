//
//  ExponentialInsulinModelPreset.swift
//  Loop
//
//  Copyright © 2017 LoopKit Authors. All rights reserved.
//

import LoopKit


public enum ExponentialInsulinModelPreset: String {
    case humalogNovologAdult
    case novoRapid35h
    case novoRapid40h
    case novoRapid45h
    case humalogNovologChild
    case fiasp
}


// MARK: - Model generation
extension ExponentialInsulinModelPreset {
    var actionDuration: TimeInterval {
        switch self {
        case .humalogNovologAdult:
            return .minutes(360)
        case .novoRapid35h:
            return .minutes(210)
        case .novoRapid40h:
            return .minutes(240)
        case .novoRapid45h:
            return .minutes(270)
        case .humalogNovologChild:
            return .minutes(360)
        case .fiasp:
            return .minutes(360)
        }
    }

    var peakActivity: TimeInterval {
        switch self {
        case .humalogNovologAdult:
            return .minutes(75)
        case .novoRapid35h:
            return .minutes(65)
        case .novoRapid40h:
            return .minutes(65)
        case .novoRapid45h:
            return .minutes(65)
        case .humalogNovologChild:
            return .minutes(65)
        case .fiasp:
            return .minutes(55)
        }
    }
    
    var effectDelay: TimeInterval {
        switch self {
        case .humalogNovologAdult:
            return .minutes(10)
        case .novoRapid35h:
            return .minutes(12)
        case .novoRapid40h:
            return .minutes(12)
        case .novoRapid45h:
            return .minutes(12)
        case .humalogNovologChild:
            return .minutes(10)
        case .fiasp:
            return .minutes(10)
        }
    }

    var model: InsulinModel {
        return ExponentialInsulinModel(actionDuration: actionDuration, peakActivityTime: peakActivity, delay: effectDelay)
    }
}


extension ExponentialInsulinModelPreset: InsulinModel {
    public var effectDuration: TimeInterval {
        return model.effectDuration
    }
    
    public var delay: TimeInterval {
        return model.delay
    }

    public func percentEffectRemaining(at time: TimeInterval) -> Double {
        return model.percentEffectRemaining(at: time)
    }
}


extension ExponentialInsulinModelPreset: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "\(self.rawValue)(\(String(reflecting: model))"
    }
}
