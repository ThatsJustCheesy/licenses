import Yams
import PathKit

public struct Configuration: Codable, Equatable {
    
    public init(file: Path = Path.current + defaultConfigurationFile) throws {
        try self.init(yaml: file.read(.utf8))
    }
    
    public init(yaml: String) throws {
        let decoder = YAMLDecoder()
        self = try decoder.decode(Configuration.self, from: yaml)
    }
    
    public func yaml() throws -> String {
        try YAMLEncoder().encode(self)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.preamble = try container.decodeIfPresent(String.self, forKey: .preamble) ??
            "This software product incorporates the following licensed components:"
        self.components = try container.decode(Components.self, forKey: .components)
        self.licenses = try container.decode(Licenses.self, forKey: .licenses)
    }
    
    public let preamble: String
    public let components: Components
    public let licenses: Licenses
    
    public typealias Components = [String : [String]]
    public typealias Licenses = [String : License]
    
    public struct License: Codable, Equatable {
        
        var name: String
        var filename: String?
        
    }
    
}
