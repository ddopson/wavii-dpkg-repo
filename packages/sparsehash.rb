MakefilePackage.define 'sparsehash' do
  description "The SparseHash library contains several hash-map implementations, including implementations that optimize for space or speed."
  version '1.12'
  url lambda { "wavii-repo.s3.amazonaws.com/source/#{name}-#{version}.tar.gz" }

end
