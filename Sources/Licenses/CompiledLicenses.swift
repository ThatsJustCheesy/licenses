import PathKit

public struct CompiledLicenses: CustomStringConvertible {
    
    public var licensesDirectoryName = "licenses"
    
    public init(
        for configuration: Configuration,
        in licensesDirectory: Path = Path.current + defaultLicensesDirectory
    ) throws {
        self.configuration = configuration
        self.licenses = [String : (name: String, fullText: String)](uniqueKeysWithValues:
            try configuration.licenses.map { kv in
                let (id, license) = kv
                
                let licenseFile = licensesDirectory + Path(license.filename ?? "\(id).txt")
                let fullText = try licenseFile.read(.utf8)
                
                return (id, (name: license.name, fullText: fullText))
            }
        )
    }
    
    var configuration: Configuration
    var licenses: [String : (name: String, fullText: String)]
    
    public var description: String {
        configuration.preamble +
        licenses.sorted { $0.key < $1.key }.map { (license: (key: String, value: (name: String, fullText: String))) -> String in
            configuration.components[license.key].map { (components: [String]) -> String in
                """
                \n
                ==========
                \(license.value.name)
                \n
                """ +
                components.map { component in
                    "• \(component)"
                }
                    .joined(separator: "\n")
                +
                "\n\n" +
                license.value.fullText +
                """
                \n
                end of \(license.value.name)
                ==========
                """
            }
                ?? ""
        }
            .joined(separator: "")
    }
    
}
