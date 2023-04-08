// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable all

internal enum L10n {

  internal enum Authorization {
    /// Authorization
    internal static let title = L10n.tr("Localizable", "Authorization.title")

    internal enum Button {
      /// Authorization
      internal static let title = L10n.tr("Localizable", "Authorization.Button.title")
    }

    internal enum Error {
      /// Invalid login or password!
      internal static let message = L10n.tr("Localizable", "Authorization.Error.message")
    }

    internal enum Placeholder {
      /// Login
      internal static let login = L10n.tr("Localizable", "Authorization.Placeholder.login")
      /// Password
      internal static let password = L10n.tr("Localizable", "Authorization.Placeholder.password")
    }
  }

  internal enum Main {
    /// MM.dd.yyyy
    internal static let dateFormat = L10n.tr("Localizable", "Main.dateFormat")
    /// Task list
    internal static let title = L10n.tr("Localizable", "Main.title")

    internal enum Error {
      /// Error
      internal static let title = L10n.tr("Localizable", "Main.Error.title")
    }

    internal enum OkButton {
      /// OK
      internal static let title = L10n.tr("Localizable", "Main.OkButton.title")
    }
  }

  internal enum Section {

    internal enum CompletedTasks {
      /// Completed tasks
      internal static let title = L10n.tr("Localizable", "Section.CompletedTasks.title")
    }

    internal enum UncompletedTasks {
      /// Uncompleted tasks
      internal static let title = L10n.tr("Localizable", "Section.UncompletedTasks.title")
    }
  }
}

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
// swiftlint:enable all