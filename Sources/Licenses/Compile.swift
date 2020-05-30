import PathKit

public func compileLicenses(
    for directory: Path = Path.current, 
    configurationFile: Path = defaultConfigurationFile,
    licensesDirectory: Path = defaultLicensesDirectory
) throws -> String {
    try directory.chdir {
        try CompiledLicenses(
            for: Configuration(file: directory + configurationFile),
            in: directory + licensesDirectory
        )
            .description
    }
}

extension Path {
    
    // For whatever reason, Path.chdir doesn't return its result.
    // This wraps it so that it can.
    func chdir<Result>(_ action: () throws -> Result) rethrows -> Result {
        var result: Result!
        try chdir {
            result = try action()
        }
        return result
    }
    
}
