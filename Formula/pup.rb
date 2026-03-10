# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.29.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.29.1/pup_0.29.1_Darwin_arm64.tar.gz"
      sha256 "869dc7c88b55087cdf828bcec46ee6023165b26b38050ad85510c9b09912ffbd"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.29.1/pup_0.29.1_Darwin_x86_64.tar.gz"
      sha256 "7211c619e4aa608074ac504d318bd0137bc0b13aca05b05c396637725571ed1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.29.1/pup_0.29.1_Linux_arm64.tar.gz"
      sha256 "c528f8edb46490368a129fb7622ea3ee31e80621e3f84dd0f43e3f8db74cf674"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.29.1/pup_0.29.1_Linux_x86_64.tar.gz"
      sha256 "fe00c5c2afa22a8ceea1b232db937dc9bda487ac78228921c3d9282bf2f0befc"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog APIs", shell_output("#{bin}/pup --help")
  end
end
