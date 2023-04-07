// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Authorization {
    /// Localizable.strings
    ///   taskManager
    /// 
    ///   Created by SERGEY SHLYAKHIN on 05.04.2023.
    internal static let title = L10n.tr("Localizable", "Authorization.title", fallback: "Authorization")
    internal enum Button {
      /// Authorization
      internal static let title = L10n.tr("Localizable", "Authorization.Button.title", fallback: "Authorization")
    }
    internal enum Error {
      /// Invalid login or password!
      internal static let message = L10n.tr("Localizable", "Authorization.Error.message", fallback: "Invalid login or password!")
    }
    internal enum Placeholder {
      /// Login
      internal static let login = L10n.tr("Localizable", "Authorization.Placeholder.login", fallback: "Login")
      /// Password
      internal static let password = L10n.tr("Localizable", "Authorization.Placeholder.password", fallback: "Password")
    }
  }
  internal enum Main {
    /// MM.dd.yyyy
    internal static let dateFormat = L10n.tr("Localizable", "Main.dateFormat", fallback: "MM.dd.yyyy")
    /// Task list
    internal static let title = L10n.tr("Localizable", "Main.title", fallback: "Task list")
    internal enum Error {
      /// Error
      internal static let title = L10n.tr("Localizable", "Main.Error.title", fallback: "Error")
    }
    internal enum OkButton {
      /// OK
      internal static let title = L10n.tr("Localizable", "Main.OkButton.title", fallback: "OK")
    }
  }
  internal enum Section {
    internal enum CompletedTasks {
      /// Completed tasks
      internal static let title = L10n.tr("Localizable", "Section.CompletedTasks.title", fallback: "Completed tasks")
    }
    internal enum UncompletedTasks {
      /// Uncompleted tasks
      internal static let title = L10n.tr("Localizable", "Section.UncompletedTasks.title", fallback: "Uncompleted tasks")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
