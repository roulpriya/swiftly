import Foundation

func shellScript(_ command: String) -> String {
    """
    #!/bin/sh
    \(command)
    """
}
