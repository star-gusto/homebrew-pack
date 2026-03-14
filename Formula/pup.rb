# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.

class Pup < Formula
  desc "Go-based command-line wrapper for easy interaction with Datadog APIs"
  homepage "https://github.com/datadog-labs/pup"
  version "0.31.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.31.0/pup_0.31.0_Darwin_arm64.tar.gz"
      sha256 "d7ee25dda35004c2f1186937de559d73f6ee5f546e45ce6400b1ae53a0576dd4"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.31.0/pup_0.31.0_Darwin_x86_64.tar.gz"
      sha256 "83007d8747142c3ffdd94960e4c145bf27bcaa10231c519462e0324b270f95b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/datadog-labs/pup/releases/download/v0.31.0/pup_0.31.0_Linux_arm64.tar.gz"
      sha256 "ffb9e455f429913433c461e1896cf5c5ea9a5273d0d08df97b5a961d66b6cc0f"
    else
      url "https://github.com/datadog-labs/pup/releases/download/v0.31.0/pup_0.31.0_Linux_x86_64.tar.gz"
      sha256 "e4f57123274481e8d08265f462c3730c3d082dffc1b9a1bfa3c13588977ba112"
    end
  end

  def install
    bin.install "pup"
  end

  test do
    assert_match "Datadog APIs", shell_output("#{bin}/pup --help")
  end
end
