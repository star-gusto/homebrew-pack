# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.28.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.28.0/pup_0.28.0_Darwin_arm64.tar.gz"
      sha256 "88bf59f4e6616c615301c3e0dc6a5a85ec1251add90630e8a63f898452bdbfa3"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.28.0/pup_0.28.0_Darwin_x86_64.tar.gz"
      sha256 "4ed02785732702b33c54b99c473ff12274f2b8a3c1d8fb0f4288ac58d14fcd50"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.28.0/pup_0.28.0_Linux_arm64.tar.gz"
      sha256 "ab098ce265082bd370c7d9443054ec5ebca2d61ed0f7ad70c85ce896543aa23b"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.28.0/pup_0.28.0_Linux_x86_64.tar.gz"
      sha256 "347e1896590dfed5c2689a5a1281df8bee08184fa4e08cb9d333053e9f2ce954"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog APIs", shell_output("#{bin}/pup --help")
  end
end
