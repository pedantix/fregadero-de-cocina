//
//  Debuggable.swift
//  FregaderoDeCocina
//
//  Created by Shaun Hubbard on 8/20/19.
//

import Foundation

/// `Debuggable` provides an interface that allows a type to be debugged.
public protocol Debuggable: LocalizedError {

  /// A readable name for the error's Type.
  /// For instance `ServiceError` will have the name `"Service Error"`.
  static var readableName: String { get }

  /// A unique identifier for the error's Type.
  /// - note: This defaults to `ModuleName.TypeName`
  /// and is used to create the `identifier` property.
  static var typeIdentifier: String { get }

  /// A unique identifier for this specific error.
  /// - warning: Do NOT use `String(reflecting: self)` or `String (describing: self)`
  /// or there will be infinite recursion.
  var identifier: String { get }

  /// The reason for the error. Usually one sentence
  var reason: String { get }

  /// Source location for this error
  var sourceLocation: SourceLocation { get }

  /// Stack trace from which this error originated (must set this from the error's init)
  var stackTrace: [String]? { get }

  /// A `String` array listing some common fixes for the error.
  var suggestedFixes: [String] { get }

}

// MARK: - Helpers
extension Debuggable {
  public static func makeStackTrace() -> [String] {
    return Thread.callStackSymbols
  }
}

// MARK: - Computed
extension Debuggable {
  public var fullIdentifier: String {
    return Self.typeIdentifier + "." + identifier
  }
}

// MARK: - Defaults
extension Debuggable {
  public static var readableName: String {
    return typeIdentifier
  }

  public static var typeIdentifier: String {
    let type = "\(self)"
    return type.split(separator: ".").last.flatMap(String.init) ?? type
  }
}

// MARK: - CustomDebugStringConvertible
extension Debuggable {
  /// See `CustomDebugStringConvertible`
  public var debugDescription: String {
    return debuggableHelp(format: .long)
  }

  /// See `CustomStringConvertible`
  public var description: String {
    return debuggableHelp(format: .short)
  }
}

// MARK: Localized
extension Debuggable {
  /// A localized message describing what error occurred.
  public var errorDescription: String? { return description }

  /// A localized message describing the reason for the failure.
  public var failureReason: String? { return reason }
}

// MARK: Representations

/// Available formatting options for generating debug info for `Debuggable` errors.
public enum HelpFormat {
  case short
  case long
}

extension Debuggable {
  /// A computed property returning a `String` that encapsulates why the error occurred.
  /// - note: This representation is best used with functions like print()
  public func debuggableHelp(format: HelpFormat) -> String {
    var print: [String] = []

    switch format {
    case .long:
      print.append("⚠️ \(Self.readableName): \(reason)\n- id: \(fullIdentifier)")
    case .short:
      print.append("⚠️ [\(fullIdentifier): \(reason)]")
    }

    switch format {
    case .long:
      var help: [String] = []
      help.append("File: \(sourceLocation.file)")
      help.append(" - func: \(sourceLocation.function)")
      help.append(" - line: \(sourceLocation.line)")
      help.append(" - column: \(sourceLocation.column)")
      print.append(help.joined(separator: "\n"))
    case .short:
      let string = "[\(sourceLocation.file):\(sourceLocation.line):\(sourceLocation.column)]"
      print.append(string)
    }

    switch format {
    case .long:
      if !suggestedFixes.isEmpty {
        print.append("These suggestions could address the issue: \(suggestedFixes.bulletedList)")
      }
    case .short:
      if !suggestedFixes.isEmpty {
        print.append("[Suggested fixes: \(suggestedFixes.joined(separator: " "))]")
      }
    }

    switch format {
    case .long:
      return print.joined(separator: "\n\n") + "\n"
    case .short:
      return print.joined(separator: " ")
    }
  }
}

extension Sequence where Iterator.Element == String {
  var bulletedList: String {
    return map { "\n- \($0)" } .joined()
  }
}
