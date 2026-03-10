class DatadogCodeSecurityMcp < Formula
  desc "Local code security scanning for AI coding assistants"
  homepage "https://github.com/datadog-labs/datadog-code-security-mcp"
  license "Apache-2.0"
  version "v0.1.3"

  # SHA256 checksums for each platform/architecture combination
  sha256_map = {
    "darwin" => {
      "amd64" => "7377a77ba116dd391dac46ad9e19e445f9d2d4934f6033f5bd78b04098cac87d",
      "arm64" => "147fd0152eb713d6607806992244564cce6a9a06f8f2bed2bf80a9470599338a",
    },
    "linux" => {
      "amd64" => "6577f6576864263053b3b775e35e7c4b6667a0310a62031f71d41c48787bd893",
      "arm64" => "a5d7878bfe4d9222858234f53fa19bf1c8301842e82ba4c38e2df19317428f2c",
    }
  }

  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  on_macos do
    url "https://github.com/datadog-labs/datadog-code-security-mcp/releases/download/#{version}/datadog-code-security-mcp-darwin-#{arch}.tar.gz"
    sha256 sha256_map["darwin"][arch]
  end

  on_linux do
    url "https://github.com/datadog-labs/datadog-code-security-mcp/releases/download/#{version}/datadog-code-security-mcp-linux-#{arch}.tar.gz"
    sha256 sha256_map["linux"][arch]
  end

  def install
    bin.install "datadog-code-security-mcp"
  end

  def caveats
    <<~EOS
      To use with Claude Desktop, add to your MCP config:

        claude mcp add datadog-code-security \\
          -- #{bin}/datadog-code-security-mcp start

      For Datadog employees with dd-auth:

        claude mcp add datadog-code-security \\
          -e DD_AUTH_DOMAIN=app.datadoghq.com \\
          -- #{bin}/datadog-code-security-mcp start

      Or manually configure in ~/.claude/config.json:

        {
          "mcpServers": {
            "datadog-code-security": {
              "command": "#{bin}/datadog-code-security-mcp",
              "args": ["start"]
            }
          }
        }

      Direct scanning (no AI assistant required):

        # Scan current directory
        datadog-code-security-mcp scan all .

        # Scan specific paths
        datadog-code-security-mcp scan sast ./src ./lib

        # JSON output for CI/CD
        datadog-code-security-mcp scan all . --json

      Note: All scanning is performed locally - your code never leaves your machine.
      Authentication is optional and only needed for future cloud features.
    EOS
  end

  test do
    system bin/"datadog-code-security-mcp", "version"
  end
end
