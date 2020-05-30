import Licenses
import ArgumentParser

struct Licenses: ParsableCommand {
    
    static var configuration = CommandConfiguration(
        abstract: "Compile software licenses for a directory.",
        discussion: "The resulting compiled license text always goes to standard output. This should be redirected as necessary, e.g., to a credits.txt file that a GUI can display."
    )
    
    func run() throws {
        print(try compileLicenses())
    }
    
}

Licenses.main()

/*
enum Commands {
    
    
    
    struct Options: ParsableArguments {
        
        @Option(
            name: [.customShort("C")],
            default: ".",
            help: ArgumentHelp(
                "The directory in which to operate.",
                valueName: "directory"
            )
        )
        var directory: String
        
        var directoryURL: URL { URL(fileURLWithPath: directory) }
        
    }
    
    struct Index: ParsableCommand {
        
        static var configuration = CommandConfiguration(
            abstract: "Index a directory.",
            discussion: "Writes the index data to <directory>/index.labels."
        )
        
        @OptionGroup()
        var options: Options
        
        func run() throws {
            let indexFile = IndexFile(inDirectory: options.directoryURL)
            let index = try LabelsCore.Index(buildingForDirectory: options.directoryURL)
            try indexFile.write(index)
        }
        
    }
    
    struct Resolve: ParsableCommand {
        
        static var configuration = CommandConfiguration(
            abstract: "Resolve a reference."
        )
        
        @OptionGroup()
        var options: Options
        
        @Argument(
            help: ArgumentHelp(
                "The reference to resolve.",
                discussion: "The reference should not include any _/ prefix."
            ),
            transform: { arg in Label(string: arg) }
        )
        var label: Label
        
        func run() throws {
            let indexFile = IndexFile(inDirectory: options.directoryURL)
            for url in try indexFile.load().resolveReference(label) {
                print(url.relativePath)
            }
        }
        
    }
    
    struct List: ParsableCommand {
        
        static var configuration = CommandConfiguration(
            abstract: "List labels for a file or the entire index."
        )
        
        @OptionGroup()
        var options: Options
        
        @Argument(
            help: ArgumentHelp(
                "The file of interest. If omitted, the entire index is considered."
            )
        )
        var file: String?
        
        var fileURL: URL? { file.map { URL(fileURLWithPath: $0).absoluteURL } }
        
        func run() throws {
            let indexFile = IndexFile(inDirectory: options.directoryURL)
            let index = try indexFile.load()
            
            let sortedLabels: [Label] =
                fileURL.map { index.sortedLabels(forFile: $0) } ??
                index.sortedLabels()
            
            for label in sortedLabels {
                print(label)
            }
        }
        
    }
    
    struct Import: ParsableCommand {
        
        static var configuration = CommandConfiguration(
            abstract: "Import from an external data format.",
            subcommands: [AppleNotes.self]
        )
        
        struct AppleNotes: ParsableCommand {
            
            static var configuration = CommandConfiguration(
                abstract: "Import from an Apple Notes library.",
                discussion: """
                Automation permission is required for the export script to be able to communicate with Notes.

                Labels are created for locked notes, but their contents cannot be automatically exported.

                This operation currently may fail for extremely large Notes libraries. If you encounter any issues, please reach out to support.
                """
            )
            
            @OptionGroup()
            var options: Options
            
            @Argument(
                help: ArgumentHelp(
                    "The name of the Notes account to from which to import.",
                    discussion: "",
                    valueName: "account"
                )
            )
            var accountName: String
            
            func run() throws {
                let index = try LabelsCore.Index(buildingForNotesAccount: accountName, at: options.directoryURL)
                
                let sortedLabels = index.sortedLabels()
                
                print("Successfully imported the following \(sortedLabels.count) notes and folder labels from Apple Notes account '\(accountName)':")
                
                for label in sortedLabels {
                    print(label)
                }
            }
            
        }
        
    }
    
}
*/
