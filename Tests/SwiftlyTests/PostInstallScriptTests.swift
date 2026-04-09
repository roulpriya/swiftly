@testable import Swiftly
import Testing

@Suite struct PostInstallScriptTests {
    @Test func wrapsCommandsInShScript() {
        let script = shellScript("apt-get -y install pkg-config")

        #expect(script == "#!/bin/sh\napt-get -y install pkg-config")
    }

    @Test func preservesMultiLineCommands() {
        let script = shellScript(
            """
            apt-get -y install pkg-config
            apt-get -y install libncurses-dev
            """
        )

        #expect(
            script == """
            #!/bin/sh
            apt-get -y install pkg-config
            apt-get -y install libncurses-dev
            """
        )
    }
}
