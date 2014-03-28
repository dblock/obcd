require 'spec_helper'

describe Obcd::Finder do
  before :each do
    @fixtures_dir = File.expand_path(File.join(__FILE__, '../../fixtures'))
  end
  describe '#find' do
    it 'finds all files for which the block yields true' do
      finder = Obcd::Finder.new(@fixtures_dir)
      files = []
      finder.find do |file|
        files << file
      end
      files.sort.should eq Dir["#{@fixtures_dir}/**/*"].select { |f| File.file?(f) }.sort
    end
  end
end
