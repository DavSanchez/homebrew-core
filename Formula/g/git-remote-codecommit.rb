class GitRemoteCodecommit < Formula
  include Language::Python::Virtualenv

  desc "Git Remote Helper to interact with AWS CodeCommit"
  homepage "https://github.com/aws/git-remote-codecommit"
  url "https://files.pythonhosted.org/packages/6c/a0/feb4dfa42e8cb1a0bd91667233254e49696cf6618f51ad5629f6efd89dae/git-remote-codecommit-1.17.tar.gz"
  sha256 "fd4a9ba3fbd88cd455a8e2087765e415da0beaae9932d4e84010069a536de24e"
  license "Apache-2.0"
  revision 2
  head "https://github.com/aws/git-remote-codecommit.git", branch: "master"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "5ad858e57ea1e623128df76151f824e9a76793edbe6d189ec0d62d96e687fa79"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "d39c660362cc0835912543e67dd16d58422a7a1b081d293e7eee18c03d7b53e6"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "91bf27b22f0dbd2d1d786e979e4c999d3da45ceb0c889cdce23b0e99674bc45c"
    sha256 cellar: :any_skip_relocation, sonoma:         "c64fce98dc6352af38f44c5410bc6a4d5f8d22b2fd3ef89fddcfbc9276a089b3"
    sha256 cellar: :any_skip_relocation, ventura:        "445c2b8553c8a29fb4dd7cd21f3778f4832789f1d097375088f83c18771b813c"
    sha256 cellar: :any_skip_relocation, monterey:       "a8169c42a8deb50dc86ee9b56b342894bd0c1e1cc8ac7cf65ccb2d5a72ffe47e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "799d2de7d2c06ec19be93a5150226861fb4c2ff3188bf572119814cfbe163173"
  end

  depends_on "python@3.12"
  depends_on "six"

  resource "botocore" do
    url "https://files.pythonhosted.org/packages/42/30/e5e2126eca77baedbf51e48241c898d99784d272bcf2fb47f5a10360e555/botocore-1.31.65.tar.gz"
    sha256 "90716c6f1af97e5c2f516e9a3379767ebdddcc6cbed79b026fa5038ce4e5e43e"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/00/2a/e867e8531cf3e36b41201936b7fa7ba7b5702dbef42922193f05c8976cd6/jmespath-1.0.1.tar.gz"
    sha256 "90261b206d6defd58fdd5e85f478bf633a2901798906be2ad389150c5c60edbe"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9/python-dateutil-2.8.2.tar.gz"
    sha256 "0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/af/47/b215df9f71b4fdba1025fc05a77db2ad243fa0926755a52c5e71659f4e3c/urllib3-2.0.7.tar.gz"
    sha256 "c97dfde1f7bd43a71c8d2a58e369e9b2bf692d1334ea9f9cae55add7d0dd0f84"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "The following URL is malformed",
      pipe_output("#{bin}/git-remote-codecommit capabilities invalid 2>&1")
  end
end
